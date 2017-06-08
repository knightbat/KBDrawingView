//
//  CALayer+UIColor.h  CALayer+UIColor.m
//  Piggiebag
//
//  Created by JK on 08/11/16.
//  Copyright © 2016 Xminds. All rights reserved.
//

#import "CALayer+UIColor.h"

@implementation CALayer(UIColor)

- (void)setBorderUIColor:(UIColor*)color {
    self.borderColor = color.CGColor;
}

- (UIColor*)borderUIColor {
    return [UIColor colorWithCGColor:self.borderColor];
}

@end
