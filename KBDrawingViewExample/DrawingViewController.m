//
//  ViewController.m
//  KBDrawingViewExample
//
//  Created by JK on 06/09/16.
//

#import "DrawingViewController.h"

@interface DrawingViewController ()
@property (weak, nonatomic) IBOutlet UIButton *renderButton;
@property (weak, nonatomic) IBOutlet KBDrawingView *drawingView;

@end

@implementation DrawingViewController {
    
    UIImage *rendredImage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];

    self.renderButton.enabled = NO;
    self.drawingView.delegate = self;
    self.drawingView.minimumDrawLength = [NSNumber numberWithFloat:10.10];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBActions

- (IBAction)renderButtonPressed:(id)sender {
    
    rendredImage = [self.drawingView renderImage];
    [self performSegueWithIdentifier:@"show" sender:self];
}

- (IBAction)clearButtonPressed:(id)sender {
    
    [self.drawingView clear];
    self.renderButton.enabled = NO;
    self.drawingView.lineColor = [UIColor grayColor];
    self.drawingView.lineWidth = @4;
}


#pragma mark SettingViewController Delegates

- (void)setLineColor:(UIColor *)color {
    self.drawingView.lineColor = color;
}
- (void)setLineWidth:(NSNumber *)width {
    self.drawingView.lineWidth =width;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"show"]) {
        
        RenderViewController *vc =   segue.destinationViewController;
        vc.renderedImage = rendredImage;
    } else if ([segue.identifier isEqualToString:@"settings"]) {
        SettingsViewController *vc = segue.destinationViewController;
        vc.backGndColor=self.view.backgroundColor;
        vc.delegate = self;
    }
    
}

- (void)finishedDrawingMinimumLength {
    
    self.renderButton.enabled = YES;
}

@end
