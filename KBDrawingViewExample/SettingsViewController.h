//
//  SettingsViewController.h
//  KBDrawingViewExample
//
//  Created by Bindu on 08/06/17.
//  Copyright © 2017 LtriX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTableViewCell.h"

@protocol SettingsViewControllerDelegate;

@interface SettingsViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,weak) id <SettingsViewControllerDelegate> delegate;
@property (nonatomic,strong) UIColor *backGndColor;
@end
@protocol SettingsViewControllerDelegate <NSObject>

- (void)setLineColor:(UIColor *)color;
- (void)setLineWidth:(NSNumber *)width;

@end
