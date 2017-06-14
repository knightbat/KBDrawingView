//
//  SettingsViewController.m
//  KBDrawingViewExample
//
//  Created by Bindu on 08/06/17.
//  Copyright © 2017 LtriX. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController {
    
    IBOutlet UIView *popupView;
    IBOutlet UITableView *listTableView;
    BOOL isFromColor;
    NSMutableArray *colorArray;
    NSMutableArray *widthArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    popupView.hidden = YES;
    [listTableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    colorArray = [NSMutableArray arrayWithObjects:
                  @{@"color_name":@"ERASE",@"color":self.backGndColor},
                  @{@"color_name":@"RED",@"color":UIColor.redColor},
                  @{@"color_name":@"BLUE",@"color":UIColor.blueColor},
                  @{@"color_name":@"GREEN",@"color":UIColor.greenColor},
                  @{@"color_name":@"GRAY",@"color":UIColor.grayColor},
                  @{@"color_name":@"BLACK",@"color":UIColor.blackColor},
                  @{@"color_name":@"BROWN",@"color":UIColor.brownColor},
                  @{@"color_name":@"CYAN",@"color":UIColor.cyanColor},
                  @{@"color_name":@"MAGENTA",@"color":UIColor.magentaColor},
                  @{@"color_name":@"ORANGE",@"color":UIColor.orangeColor},
                  @{@"color_name":@"PURPLE",@"color":UIColor.purpleColor},
                  @{@"color_name":@"YELLOW",@"color":UIColor.yellowColor},
                  nil];
    
    widthArray = [NSMutableArray arrayWithObjects:@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10", nil];
}

#pragma mark UITableView Datasource and Delegate

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (isFromColor) {
        return colorArray.count;
    } else {
        return widthArray.count;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"listCell"];
    
    if (isFromColor) {
        cell.listLabel.text = [[colorArray objectAtIndex:indexPath.row] valueForKey:@"color_name"];
        
    } else {
        cell.listLabel.text = [widthArray objectAtIndex:indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (isFromColor) {
        
        if (indexPath.row == 0) {
            [self.delegate setLineWidth:[NSNumber numberWithInteger:10]];
        }
        [self.delegate setLineColor:[[colorArray objectAtIndex:indexPath.row] valueForKey:@"color"]];
    } else {
        NSString *width = [widthArray objectAtIndex:indexPath.row];
        [self.delegate setLineWidth:[NSNumber numberWithInteger:width.integerValue]];
    }
    popupView.hidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UIButton Actions

- (IBAction)colorBtnClicked:(UIButton *)sender {
    isFromColor =YES;
    popupView.hidden = NO;
    [listTableView reloadData];
}

- (IBAction)widthBtnClicked:(UIButton *)sender {
    isFromColor =NO;
    popupView.hidden = NO;
    [listTableView reloadData];
    
}
- (IBAction)closeBtnClicked:(UIButton *)sender {
    popupView.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
