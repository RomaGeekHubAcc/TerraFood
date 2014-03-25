//
//  GoldValleyViewControllerPageTwo.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/18/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//



#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "GoldValleyViewControllerPageTwo.h"


@interface GoldValleyViewControllerPageTwo () {
   
    __weak IBOutlet UIImageView *textCol;
    
    __weak IBOutlet UIImageView *cup1;
    __weak IBOutlet UIImageView *cup2;
    __weak IBOutlet UIImageView *cup3;
    __weak IBOutlet UIImageView *cup4;
    
    __weak IBOutlet UIImageView *popupchik;
    
    CGRect cup1Frame;
    CGRect cup2Frame;
    CGRect cup3Frame;
    CGRect cup4Frame;
    CGRect popupchikFrame;
    
    BOOL willDisappear;
    
    NSTimer *timer;
    
    NSUInteger timeIntervalAnimating;
}

-(IBAction) backToRootViewController:(id)sender;

@end

@implementation GoldValleyViewControllerPageTwo

-(void) viewDidLoad {
    [super viewDidLoad];
    
    cup1Frame = cup1.frame;
    cup2Frame = cup2.frame;
    cup3Frame = cup3.frame;
    cup4Frame = cup4.frame;
    popupchikFrame = popupchik.frame;
    
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

-(IBAction) backToRootViewController:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - Private methods

-(void) setFramesForStartAnimating {
    CGRect newFrame = cup1Frame;
    newFrame.origin.x = screenSizeLandscape.width;
    cup1.frame = newFrame;
    
    newFrame = cup2Frame;
    newFrame.origin.x = screenSizeLandscape.width;
    cup2.frame = newFrame;
    
    newFrame = cup3Frame;
    newFrame.origin.y = screenSizeLandscape.height;
    cup3.frame = newFrame;
    
    newFrame = cup4Frame;
    newFrame.origin.y = screenSizeLandscape.height;
    cup4.frame = newFrame;
    
    newFrame = popupchikFrame;
    newFrame.origin.y = newFrame.size.height * (-1);
    popupchik.frame = newFrame;
    
    textCol.alpha = 0.0;
}

-(void)imageViewsHidden:(BOOL)hidden {
    if (hidden) {
        textCol.alpha = 0;
    }
    textCol.hidden = hidden;
    
    cup1.hidden = hidden;
    cup2.hidden = hidden;
    cup3.hidden = hidden;
    cup4.hidden = hidden;
    popupchik.hidden = hidden;
}

-(void) startAnimations {
    timeIntervalAnimating++;
    
    if (timeIntervalAnimating == 3) {
        [UIView animateWithDuration:0.2 animations:^{
            cup1.frame = cup1Frame;
            cup3.frame = cup3Frame;
        }];
    }
    if (timeIntervalAnimating == 5) {
        [UIView animateWithDuration:0.2 animations:^{
            cup2.frame = cup2Frame;
            cup4.frame = cup4Frame;
        }];
    }
    if (timeIntervalAnimating == 5) {
        [UIView animateWithDuration:0.5 animations:^{
            textCol.alpha = 1.0;
        }];
    }
    if (timeIntervalAnimating == 9) {
        [UIView animateWithDuration:0.3 animations:^{
            popupchik.frame = popupchikFrame;
        }];
    }
}

@end
