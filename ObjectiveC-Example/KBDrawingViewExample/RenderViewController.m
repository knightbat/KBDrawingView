//
//  RenderViewController.m
//  KBDrawingViewExample
//
//  Created by JK on 06/09/16.
//

#import "RenderViewController.h"

@interface RenderViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *showImage;

@end

@implementation RenderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.showImage.image = self.renderedImage;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
