//
//     KBDrawingView.m
//
//     MIT License
//
//     Copyright (c) 2017 Jayakrishnan M
//
//     Permission is hereby granted, free of charge,to any person obtaining a copy of
//     this software and associated documentation files (the "Software"), to deal in
//     the Software without restriction, including without limitation the rights to
//     use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of
//     the Software, and to permit persons to whom the Software is furnished to do so,
//     subject to the following conditions:
//
//     The above copyright notice and this permission notice shall be included in all
//     copies or substantial portions of the Software.
//
//     THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//     IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
//     FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
//     COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
//     IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//     CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import "KBDrawingView.h"

@implementation KBDrawingView {
    UIBezierPath *path;
    UIImage *incrementalImage;
    CGPoint pts[5]; // we now need to keep track of the four points of a Bezier segment and the first control point of the next segment
    uint ctr;
    BOOL isValid;
    CGPoint prevPoint;
    float distance;
}

@synthesize delegate,lineWidth,lineColor;

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        
        [self setupLine];
    }
    return self;
    
}
- (id)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setupLine];
    }
    return self;
}


- (void) setupLine {
    
    [self setMultipleTouchEnabled:NO];
    [self setBackgroundColor:[UIColor whiteColor]];
    self.lineColor = [UIColor blackColor];
    path = [UIBezierPath bezierPath];
    [path setLineWidth:2.0];
    
}


- (NSNumber *) lineWidth {
    return lineWidth;
}

- (void) setLineWidth: (NSNumber*) width {
    
    if ([width integerValue] <= 0) {
        width = @1;
    }
    lineWidth = width;
    [path setLineWidth: [lineWidth integerValue]];
}

- (UIColor *) lineColor {
    return lineColor;
}

- (void) setLineColor: (UIColor*) color {
    
    lineColor = color;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    [incrementalImage drawInRect:rect];
    UIColor *strokeColor = self.lineColor;
    [strokeColor setStroke];
    [path stroke];
    
    
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    ctr = 0;
    UITouch *touch = [touches anyObject];
    pts[0] = [touch locationInView:self];
    prevPoint = pts[0];
    distance = 0;
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    
    if (!isValid) {
        
        distance += [self distanceFromPoint:prevPoint ToPoint:p];
        NSLog(@"%f",distance);
        prevPoint = p;
        
        if (self.minimumDrawLength && distance > [self.minimumDrawLength floatValue]) {
            isValid = YES;
            [delegate finishedDrawingMinimumLength];
            
        } else if (distance > 150) {
            
            isValid = YES;
            [delegate finishedDrawingMinimumLength];
        }
    }
    ctr++;
    pts[ctr] = p;
    if (ctr == 4) {
        
        pts[3] = CGPointMake((pts[2].x + pts[4].x)/2.0, (pts[2].y + pts[4].y)/2.0); // move the endpoint to the middle of the line joining the second control point of the first Bezier segment and the first control point of the second Bezier segment
        
        [path moveToPoint:pts[0]];
        [path addCurveToPoint:pts[3] controlPoint1:pts[1] controlPoint2:pts[2]]; // add a cubic Bezier from pt[0] to pt[3], with control points pt[1] and pt[2]
        
        [self setNeedsDisplay];
        // replace points and get ready to handle the next segment
        pts[0] = pts[3];
        pts[1] = pts[4];
        ctr = 1;
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self drawBitmap];
    [self setNeedsDisplay];
    [path removeAllPoints];
    ctr = 0;
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self touchesEnded:touches withEvent:event];
}

- (void)drawBitmap {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, YES, 0.0);
    
    if (!incrementalImage) { // first time; paint background to view's background color
        
        UIBezierPath *rectpath = [UIBezierPath bezierPathWithRect:self.bounds];
        [self.backgroundColor setFill];
        [rectpath fill];
    }
    [incrementalImage drawAtPoint:CGPointZero];
    [self.lineColor setStroke];
    [path stroke];
    incrementalImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
}



- (UIImage *) renderImage {
    
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage * img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return img;
}

- (void) clear {
    
    isValid = NO;
    incrementalImage = nil;
    [self drawBitmap];
    [self setNeedsDisplay];
    [path removeAllPoints];
    ctr = 0;
}

- (CGFloat) distanceFromPoint:(CGPoint)p1 ToPoint:(CGPoint)p2 {
    CGFloat xDist = (p2.x - p1.x);
    CGFloat yDist = (p2.y - p1.y);
    return sqrt((xDist * xDist) + (yDist * yDist));
}

@end
