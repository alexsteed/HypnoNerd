//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Alexis Bastide on 04/08/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@interface BNRHypnosisViewController()

@property (nonatomic, strong) BNRHypnosisView *hypnosisView;

@end

@implementation BNRHypnosisViewController

- (void)loadView
{
    CGRect frame = [UIScreen mainScreen].bounds;
    _hypnosisView = [[BNRHypnosisView alloc] initWithFrame:frame];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"Red", @"Green", @"Blue"]];
    [segmentedControl addTarget:self action:@selector(updateCircleColor:) forControlEvents:UIControlEventValueChanged];
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.frame = CGRectMake(frame.size.width / 4, frame.size.height / 20, frame.size.width / 2, frame.size.height / 20);
    self.view = _hypnosisView;
    [self.view addSubview:segmentedControl];
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
