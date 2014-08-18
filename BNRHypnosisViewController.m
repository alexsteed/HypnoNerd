//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Alexis Bastide on 04/08/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController() <UITextFieldDelegate>

@property (nonatomic, strong) BNRHypnosisView *hypnosisView;

@end

@implementation BNRHypnosisViewController

- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].bounds;
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] initWithFrame:frame];
    CGRect textFieldRect = CGRectMake(40, 70, 240, 30);
    UITextField *textField = [[UITextField alloc] initWithFrame:textFieldRect];
    
    // Setting the border style on the text field will allow us to see it more easily
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"Hypnotize me";
    
    // Change return key to "Done"
    textField.returnKeyType = UIReturnKeyDone;
    textField.delegate = self;
    [backgroundView addSubview:textField];

    self.view = backgroundView;
}

- (void)drawHypnoticMessage:(NSString *)message
{
    for (int i = 0; i < 20; i++)
    {
        UILabel *messageLabel = [[UILabel alloc] init];
        
        // Configure the label's color and text
        messageLabel.backgroundColor = [UIColor clearColor];
        messageLabel.textColor = [UIColor blackColor];
        messageLabel.text = message;
        
        // This method resizes the label, which will be relative to the text that it is displaying
        [messageLabel sizeToFit];
        
        // Get a random x value that fits with in hypnosis view's width
        int width = (int)(self.view.bounds.size.width - messageLabel.bounds.size.width);
        int x = arc4random() % width;
        
        // Get a random y value that fits with in hypnosis view's height
        int height = (int)(self.view.bounds.size.height - messageLabel.bounds.size.height);
        int y = arc4random() % height;
        
        // Update the label's frame
        CGRect frame = messageLabel.frame;
        frame.origin = CGPointMake(x, y);
        messageLabel.frame = frame;
        
        // Add the label to the hierarchy
        [self.view addSubview:messageLabel];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self drawHypnoticMessage:textField.text];
    
    textField.text = @"";
    [textField resignFirstResponder];
    return YES;
}

- (void)updateCircleColor:(UISegmentedControl *)segmentedControl
{
    switch (segmentedControl.selectedSegmentIndex)
    {
        case 0:
            self.hypnosisView.circleColor = [UIColor redColor];
            break;
        case 1:
            _hypnosisView.circleColor = [UIColor greenColor];
            break;
        case 2:
            _hypnosisView.circleColor = [UIColor blueColor];
            break;
        default:
            break;
    }
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.tabBarItem.title = @"Hypnotize";
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"BNRHypnosisViewController did load its view.");
}

@end
