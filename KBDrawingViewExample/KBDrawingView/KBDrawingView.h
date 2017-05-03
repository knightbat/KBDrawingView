//
//  KBDrawingView.h
//
//  Created by JK on 26/08/16.
//  using codes from http://code.tutsplus.com/tutorials/smooth-freehand-drawing-on-ios--mobile-13164
//

#import <UIKit/UIKit.h>

@protocol KBDrawingViewDelegate ;

@interface KBDrawingView : UIView

@property (nonatomic, weak) id<KBDrawingViewDelegate> delegate;
@property (nonatomic, strong) NSNumber *minimumDrawLength;
@property (nonatomic, strong) UIColor *lineColor;
@property (nonatomic, strong) NSNumber *lineWidth;


- (UIImage *) renderImage;
- (void) clear;

@end

@protocol KBDrawingViewDelegate <NSObject>

- (void) finishedDrawingMinimumLength;

@end
