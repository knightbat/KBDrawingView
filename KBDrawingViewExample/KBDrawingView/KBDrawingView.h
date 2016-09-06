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


- (UIImage *) renderImage;
- (void) clear;

@end

@protocol KBDrawingViewDelegate <NSObject>

- (void) enableButton;

@end