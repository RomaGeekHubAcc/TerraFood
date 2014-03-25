//
//  FremialleViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/7/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "FremialleViewController.h"

@interface FremialleViewController () {
    
    __weak IBOutlet UIImageView *popup;
    
    __weak IBOutlet UIImageView *textCol1;
    
    __weak IBOutlet UIImageView *textCol2;
    __weak IBOutlet UIImageView *textCol3;
    
    __weak IBOutlet UIImageView *textCol4;
    __weak IBOutlet UIImageView *textCol5;
    
    __weak IBOutlet UIImageView *fetaBig;
    __weak IBOutlet UIImageView *fetaSmall;
    __weak IBOutlet UIImageView *brynza;
    
    __weak IBOutlet UIImageView *vershki10;
    __weak IBOutlet UIImageView *vershki20;
    __weak IBOutlet UIImageView *vershki15;
    __weak IBOutlet UIImageView *shake;
    
    CGRect popupFrame;
    
    CGRect textCol1Frame;
    CGRect textCol2Frame;
    CGRect textCol3Frame;
    CGRect textCol4Frame;
    CGRect textCol5Frame;
    
    CGRect fetaBigFrame;
    CGRect fetaSmallFrame;
    CGRect brynzaFrame;
    
    CGRect vershki10Frame;
    CGRect vershki20Frame;
    CGRect vershki15Frame;
    CGRect shakeFrame;
    
    BOOL willDisappear;
    
    NSTimer *timer;
    
    NSUInteger timeIntervalAnimating;
}

-(IBAction) backToMainMenu:(id)sender;

@end

@implementation FremialleViewController


-(void) viewDidLoad {
    [super viewDidLoad];
	
    popupFrame = popup.frame;
    
    textCol1Frame = textCol1.frame;
    textCol2Frame = textCol2.frame;
    textCol3Frame = textCol3.frame;
    textCol4Frame = textCol4.frame;
    textCol5Frame = textCol5.frame;
    
    fetaBigFrame = fetaBig.frame;
    fetaSmallFrame = fetaSmall.frame;
    brynzaFrame = brynza.frame;
    
    vershki10Frame = vershki10.frame;
    vershki20Frame = vershki20.frame;
    vershki15Frame = vershki15.frame;
    shakeFrame = shake.frame;
    
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


#pragma mark - Private methods

-(void) setFramesForStartAnimating {
    CGRect newFrame = popupFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    popup.frame = newFrame;
    
    ///////////////////////////////////////////////
    textCol1.alpha = 0.0;
    textCol2.alpha = 0.0;
    textCol3.alpha = 0.0;
    textCol4.alpha = 0.0;
    textCol5.alpha = 0.0;
    
    ///////////////////////////////////////////////
    newFrame = fetaBigFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    fetaBig.frame = newFrame;
    
    newFrame = fetaSmallFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    fetaSmall.frame = newFrame;
    
    newFrame = brynzaFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    brynza.frame = newFrame;
    
    ////////////////////////////////////////////////
    newFrame = vershki10Frame;
    newFrame.origin.x = screenSizeLandscape.width;
    vershki10.frame = newFrame;
    
    newFrame = vershki20Frame;
    newFrame.origin.x = screenSizeLandscape.width;
    vershki20.frame = newFrame;
    
    newFrame = vershki15Frame;
    newFrame.origin.x = screenSizeLandscape.width;
    vershki15.frame = newFrame;
    
    newFrame = shakeFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    shake.frame = newFrame;
}

-(void)imageViewsHidden:(BOOL)hidden {
    if (hidden) {
        textCol1.alpha = 0.0;
        textCol2.alpha = 0.0;
        textCol3.alpha = 0.0;
        textCol4.alpha = 0.0;
        textCol5.alpha = 0.0;
    }
    popup.hidden = hidden;
    
    textCol1.hidden = hidden;
    textCol2.hidden = hidden;
    textCol3.hidden = hidden;
    textCol4.hidden = hidden;
    textCol5.hidden = hidden;
    
    fetaBig.hidden = hidden;
    fetaSmall.hidden = hidden;
    brynza.hidden = hidden;
    
    vershki10.hidden = hidden;
    vershki20.hidden = hidden;
    vershki15.hidden = hidden;
    shake.hidden = hidden;
}

-(void) startAnimations {
    timeIntervalAnimating++;
    
    if (timeIntervalAnimating == 3) {
        [UIView animateWithDuration:0.2 animations:^{
            fetaBig.frame = fetaBigFrame;
            vershki10.frame = vershki10Frame;
        }];
    }
    if (timeIntervalAnimating == 5) {
        [UIView animateWithDuration:0.2 animations:^{
            fetaSmall.frame = fetaSmallFrame;
            vershki20.frame = vershki20Frame;
        }];
    }
    if (timeIntervalAnimating == 7) {
        [UIView animateWithDuration:0.2 animations:^{
            brynza.frame = brynzaFrame;
            vershki15.frame = vershki15Frame;
            popup.frame = popupFrame;
        }];
    }
    if (timeIntervalAnimating == 9) {
        [UIView animateWithDuration:0.2 animations:^{
            shake.frame = shakeFrame;
        }];
    }
    if (timeIntervalAnimating == 9) {
        [UIView animateWithDuration:0.5 animations:^{
            textCol1.alpha = 1.0;
            textCol2.alpha = 1.0;
            textCol3.alpha = 1.0;
            textCol4.alpha = 1.0;
            textCol5.alpha = 1.0;
        }];
    }
}

#pragma mark - Action methods

-(IBAction) backToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
