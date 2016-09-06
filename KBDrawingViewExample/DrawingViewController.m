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
    
}




 #pragma mark - Navigation
 
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

     if ([segue.identifier isEqualToString:@"show"]) {
         
         RenderViewController *vc =   segue.destinationViewController;
         vc.renderedImage = rendredImage;
     }
     
 }

- (void)enableButton {
    
    self.renderButton.enabled = YES;
}

@end
