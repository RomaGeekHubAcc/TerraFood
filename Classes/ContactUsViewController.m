//
//  ContactUsViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/6/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "ContactUsViewController.h"


@interface ContactUsViewController () {
    
    UIImageView *contactUsLabel;
    UIImageView *contactUsColumn;
    
    CGRect contactUsLabelFrame;
    CGRect contactUsColumnFrame;
    
    NSTimer *timer;
    
    NSUInteger timeIntervalAnimating;
    
    BOOL willDisappear;
}
-(IBAction) backToMainMenu:(id)sender;

@end


@implementation ContactUsViewController

-(void) viewDidLoad {
    [super viewDidLoad];
	
    contactUsLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ContactUsLabel.png"]];
    contactUsColumn = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"ContactUsColumn.png"]];
    
    contactUsLabelFrame = CGRectMake(152, 449, 706, 36);
    contactUsColumnFrame = CGRectMake(350, 516, 481, 225);
    
    willDisappear = NO;
}

-(BOOL) prefersStatusBarHidden {
    return YES;
}

-(void) viewWillDisappear:(BOOL)animated {
    willDisappear = YES;
}

-(void) viewDidAppear:(BOOL)animated {
    
    if (willDisappear) {
        contactUsColumn.hidden = NO;
        contactUsLabel.hidden = NO;
        contactUsLabel.frame = contactUsLabelFrame;
        contactUsColumn.frame = contactUsColumnFrame;
        [self addSubViews];
    }
    else {
        timeIntervalAnimating = 0;
        
        [self hideViewsForAnimating];
        [self addSubViews];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(startAnimations) userInfo:nil repeats:YES];
    }
}

-(void)viewDidDisappear:(BOOL)animated {
    [self hideViewsForAnimating];
    [self removeSubViews];
    
    timeIntervalAnimating = 0;
    [timer invalidate];
    timer = nil;
    willDisappear = NO;
}


#pragma mark - Action methods

-(IBAction) backToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) startAnimations {
    timeIntervalAnimating++;
    if (timeIntervalAnimating == 6) {
        [UIView animateWithDuration:0.2 animations:^{
            contactUsLabel.frame = contactUsLabelFrame;
            contactUsColumn.frame = contactUsColumnFrame;
        }];
    }
}


#pragma mark - Private methods

-(void) hideViewsForAnimating {
    CGRect newFrame = contactUsLabelFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    contactUsLabel.frame = newFrame;
    
    newFrame = contactUsColumnFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    contactUsColumn.frame = newFrame;
}

-(void)addSubViews {
    [self.view addSubview:contactUsLabel];
    [self.view addSubview:contactUsColumn];
}

-(void) removeSubViews {
    [contactUsLabel removeFromSuperview];
    [contactUsColumn removeFromSuperview];
}

@end
