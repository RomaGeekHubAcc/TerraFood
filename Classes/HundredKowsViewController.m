//
//  HundredKowsViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/7/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "HundredKowsViewController.h"

@interface HundredKowsViewController () {
    
    __weak IBOutlet UIImageView *textCol1;
    __weak IBOutlet UIImageView *textCol2;
    
    __weak IBOutlet UIImageView *big015fat;
    __weak IBOutlet UIImageView *big3fat;
    __weak IBOutlet UIImageView *big15fat;
    __weak IBOutlet UIImageView *big25fat;
    
    __weak IBOutlet UIImageView *small015fat;
    __weak IBOutlet UIImageView *small3fat;
    __weak IBOutlet UIImageView *small15fat;
    __weak IBOutlet UIImageView *small25fat;
    
    CGRect textCol1Frame;
    CGRect textCol2Frame;
    
    CGRect big015fatFrame;
    CGRect big3fatFrame;
    CGRect big15fatFrame;
    CGRect big25fatFrame;
    
    CGRect small015fatFrame;
    CGRect small3fatFrame;
    CGRect small15fatFrame;
    CGRect small25fatFrame;
    
    NSTimer *timer;
    
    BOOL willDisappear;
    
    NSUInteger timeIntervalAnimating;
}

-(IBAction) backToMainMenu:(id)sender;

@end

@implementation HundredKowsViewController


-(void) viewDidLoad {
    [super viewDidLoad];
	
    textCol1Frame = textCol1.frame;
    textCol2Frame = textCol2.frame;
    
    big015fatFrame = big015fat.frame;
    big3fatFrame = big3fat.frame;
    big15fatFrame = big15fat.frame;
    big25fatFrame = big25fat.frame;
    
    small015fatFrame = small015fat.frame;
    small3fatFrame = small3fat.frame;
    small15fatFrame = small15fat.frame;
    small25fatFrame = small25fat.frame;
    
    willDisappear = NO;
}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    if (willDisappear) {
        [self imageViewsHidden:NO];
    }
    else {
        timeIntervalAnimating = 0;
        
        [self setFramesForStartAnimating];
        [self imageViewsHidden:NO];
        
        timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(startAnimations) userInfo:nil repeats:YES];
    }
}

-(void) viewWillDisappear:(BOOL)animated {
    willDisappear = YES;
}

-(void)viewDidDisappear:(BOOL)animated {
    [self imageViewsHidden:YES];
    [self setFramesForStartAnimating];
    
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


#pragma mark - Private methods

-(void) setFramesForStartAnimating {
    
    CGRect newFrame = big015fatFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    big015fat.frame= newFrame;
    
    newFrame = big3fatFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    big3fat.frame = newFrame;
    
    newFrame = big15fatFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    big15fat.frame = newFrame;
    
    newFrame = big25fatFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    big25fat.frame = newFrame;
    
    ///////////////////////////////////////////////
    newFrame = small015fatFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    small015fat.frame = newFrame;
    
    newFrame = small3fatFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    small3fat.frame = newFrame;
    
    newFrame = small15fatFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    small15fat.frame = newFrame;
    
    newFrame = small25fatFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    small25fat.frame = newFrame;
    
    ///////////////////////////////////////////////
    textCol2.alpha = 0.0;
    textCol1.alpha = 0.0;
}

-(void)imageViewsHidden:(BOOL)hidden {
    if (hidden) {
        textCol1.alpha = 0.0;
        textCol2.alpha = 0.0;
    }
    textCol1.hidden = hidden;
    textCol2.hidden = hidden;
    
    big015fat.hidden = hidden;
    big3fat.hidden = hidden;
    big15fat.hidden = hidden;
    big25fat.hidden = hidden;
    
    small015fat.hidden = hidden;
    small3fat.hidden = hidden;
    small15fat.hidden = hidden;
    small25fat.hidden = hidden;
}

-(void) startAnimations {
    timeIntervalAnimating++;
    
    if (timeIntervalAnimating == 3) {
        [UIView animateWithDuration:0.2 animations:^{
            big015fat.frame = big015fatFrame;
            small3fat.frame = small3fatFrame;
        }];
    }
    if (timeIntervalAnimating == 5) {
        [UIView animateWithDuration:0.2 animations:^{
            big3fat.frame = big3fatFrame;
            small015fat.frame = small015fatFrame;
        }];
    }
    if (timeIntervalAnimating == 7) {
        [UIView animateWithDuration:0.2 animations:^{
            big15fat.frame = big15fatFrame;
            small25fat.frame = small25fatFrame;
        }];
    }
    if (timeIntervalAnimating == 9) {
        [UIView animateWithDuration:0.2 animations:^{
            big25fat.frame = big25fatFrame;
            small15fat.frame = small15fatFrame;
        }];
    }
    if (timeIntervalAnimating == 11) {
        [UIView animateWithDuration:0.4 animations:^{
            textCol1.alpha = 1.0;
            textCol2.alpha = 1.0;
        }];
    }
}

@end
