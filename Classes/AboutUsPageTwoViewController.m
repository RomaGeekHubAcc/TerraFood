//
//  AboutUsPageTwoViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/6/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//

#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "AboutUsPageTwoViewController.h"


@interface AboutUsPageTwoViewController () {
    
    UIImageView *column1;
    UIImageView *column2;
    UIImageView *column3;
    
    CGRect column1Frame;
    CGRect column2Frame;
    CGRect column3Frame;
    
    NSTimer *timer;
    
    NSUInteger timeIntervalAnimating;
    
    BOOL willDisappear;
}

-(IBAction) backToMainMenu:(id)sender;

@end


@implementation AboutUsPageTwoViewController

-(void) viewDidLoad {
    [super viewDidLoad];
	
    column1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"abUs2column1.png"]];
    column2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"abUs2column2.png"]];
    column3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"abUs2column3.png"]];
    
    column1Frame = CGRectMake(207, 514, 163, 77);
    column2Frame = CGRectMake(398, 514, 208, 178);
    column3Frame = CGRectMake(632, 518, 207, 160);
    
    willDisappear = NO;
}

-(void) viewWillDisappear:(BOOL)animated {
    willDisappear = YES;
}

-(void) viewDidAppear:(BOOL)animated {
    if (willDisappear) {
        column1.hidden = NO;
        column2.hidden = NO;
        column3.hidden = NO;
        
        column1.frame = column1Frame;
        column2.frame = column2Frame;
        column3.frame = column3Frame;
        
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
    [self removeSubViews];
    [self hideViewsForAnimating];
    
    timeIntervalAnimating = 0;
    [timer invalidate];
    timer = nil;
    willDisappear = NO;
}

-(BOOL) prefersStatusBarHidden {
    return YES;
}


#pragma mark - Action methods

-(IBAction) backToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) startAnimations {
    timeIntervalAnimating++;
    if (timeIntervalAnimating == 6) {
        [UIView animateWithDuration:0.2 animations:^{
            
            column1.frame = column1Frame;
        }];
    }
    if (timeIntervalAnimating == 8) {
        [UIView animateWithDuration:0.2 animations:^{
            column2.frame = column2Frame;
        }];
    }
    if (timeIntervalAnimating == 10) {
        [UIView animateWithDuration:0.2 animations:^{
            column3.frame = column3Frame;
        }];
    }
}


#pragma mark - Private methods

-(void) hideViewsForAnimating {
    CGRect newFrame = column1Frame;
    newFrame.origin.x = screenSizeLandscape.width;
    column1.frame = newFrame;
    
    newFrame = column2Frame;
    newFrame.origin.x = screenSizeLandscape.width;
    column2.frame = newFrame;
    
    newFrame = column3Frame;
    newFrame.origin.x = screenSizeLandscape.width;
    column3.frame = newFrame;
}

-(void)addSubViews {
    [self.view addSubview:column1];
    [self.view addSubview:column2];
    [self.view addSubview:column3];
}

-(void) removeSubViews {
    [column1 removeFromSuperview];
    [column2 removeFromSuperview];
    [column3 removeFromSuperview];
}

@end
