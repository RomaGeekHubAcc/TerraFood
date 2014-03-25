//
//  AboutUsViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/5/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "AboutUsViewController.h"


@interface AboutUsViewController () {
    
    UIImageView *terraFoodLabel;
    UIImageView *paragr1Text;
    UIImageView *paragr2Text;
    
    CGRect terraFoodLabelFrame;
    CGRect paragr1TextFrame;
    CGRect paragr2TextFrame;
    
    BOOL willDisappear;
    
    NSTimer *timer;
    
    NSUInteger timeIntervalAnimating;
}

-(IBAction) backToMainMenu:(id)sender;

@end


@implementation AboutUsViewController

-(void) viewDidLoad {
    [super viewDidLoad];
    
    terraFoodLabelFrame = CGRectMake(185, 440, 420, 48);
    paragr1TextFrame = CGRectMake(398, 512, 218, 223);
    paragr2TextFrame = CGRectMake(640, 516, 213, 162);
    
    terraFoodLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"terraFoodLabel.png"]];
    paragr1Text = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paragr1AbUs.png"]];
    paragr2Text = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"paragr2AbUs.png"]];
    
    willDisappear = NO;
}

-(void) viewWillDisappear:(BOOL)animated {
    willDisappear = YES;
}

-(void) viewDidAppear:(BOOL)animated {
    if (willDisappear) {
        terraFoodLabel.hidden = NO;
        paragr1Text.hidden = NO;
        paragr2Text.hidden = NO;
        
        terraFoodLabel.frame = terraFoodLabelFrame;
        paragr1Text.frame = paragr1TextFrame;
        paragr2Text.frame = paragr2TextFrame;
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

-(BOOL) prefersStatusBarHidden {
    return YES;
}


#pragma mark - Private methods

-(void) hideViewsForAnimating {
    CGRect newFrame = terraFoodLabelFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    terraFoodLabel.frame = newFrame;
    
    newFrame = paragr1TextFrame;
    newFrame.origin.y = screenSizeLandscape.height + newFrame.size.height;
    paragr1Text.frame = newFrame;
    
    newFrame = paragr2TextFrame;
    newFrame.origin.y = screenSizeLandscape.height + newFrame.size.height;
    paragr2Text.frame = newFrame;
}

-(void)addSubViews {
    [self.view addSubview:terraFoodLabel];
    [self.view addSubview:paragr1Text];
    [self.view addSubview:paragr2Text];
}

-(void) removeSubViews {
    [terraFoodLabel removeFromSuperview];
    [paragr1Text removeFromSuperview];
    [paragr2Text removeFromSuperview];
}

#pragma mark - Action methods

-(IBAction) backToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) startAnimations {
    timeIntervalAnimating++;
    if (timeIntervalAnimating == 6) {
        [UIView animateWithDuration:0.2 animations:^{
            
            terraFoodLabel.frame = terraFoodLabelFrame;
        }];
    }
    if (timeIntervalAnimating == 8) {
        [UIView animateWithDuration:0.2 animations:^{
            paragr1Text.frame = paragr1TextFrame;
        }];
    }
    if (timeIntervalAnimating == 10) {
        [UIView animateWithDuration:0.2 animations:^{
            paragr2Text.frame = paragr2TextFrame;
        }];
    }
}


@end
