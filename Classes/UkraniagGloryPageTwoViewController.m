//
//  UkraniagGloryPageTwoViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/11/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "UkraniagGloryPageTwoViewController.h"


@interface UkraniagGloryPageTwoViewController () {
    
    __weak IBOutlet UIImageView *popUp;
    
    __weak IBOutlet UIImageView *textColumn1;
    __weak IBOutlet UIImageView *textColumn2;
    
    __weak IBOutlet UIImageView *fullTasteLightCF;
    __weak IBOutlet UIImageView *fullTasteLight;
    __weak IBOutlet UIImageView *standart;
    
    __weak IBOutlet UIImageView *fullTaste;
    __weak IBOutlet UIImageView *chocolate;
    __weak IBOutlet UIImageView *fullTasteExtra;
    
    __weak IBOutlet UIImageView *standatLightCF;
    __weak IBOutlet UIImageView *standartLight;
    __weak IBOutlet UIImageView *standartExtra;
    
    
    CGRect popUpFrame;
    
    CGRect fullTasteLightCFFrame;
    CGRect fullTasteLightFrame;
    CGRect standartFrame;
    
    CGRect fullTasteFrame;
    CGRect chocolateFrame;
    CGRect fullTasteExtraFrame;
    
    CGRect standatLightCFFrame;
    CGRect standartLightFrame;
    CGRect standartExtraFrame;
    
    BOOL willDisappear;
    
    NSTimer *timer;
    
    NSUInteger timeIntervalAnimating;
}

- (IBAction)backToMainMenu:(id)sender;

@end


@implementation UkraniagGloryPageTwoViewController

-(void) viewDidLoad {
    [super viewDidLoad];
	
    popUpFrame = popUp.frame;
    
    fullTasteLightCFFrame = fullTasteLightCF.frame;
    fullTasteLightFrame = fullTasteLight.frame;
    standartFrame = standart.frame;
    
    fullTasteFrame = fullTaste.frame;
    chocolateFrame = chocolate.frame;
    fullTasteExtraFrame = fullTasteExtra.frame;
    
    standatLightCFFrame = standatLightCF.frame;
    standartLightFrame = standartLight.frame;
    standartExtraFrame = standartExtra.frame;
    
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
    
    CGRect newFrame = fullTasteLightCFFrame;
    newFrame.origin.y = screenSizeLandscape.height;
    fullTasteLightCF.frame = newFrame;
    
    newFrame = fullTasteLightFrame;
    newFrame.origin.y = screenSizeLandscape.height;
    fullTasteLight.frame = newFrame;
    
    newFrame = standartFrame;
    newFrame.origin.y = screenSizeLandscape.height;
    standart.frame = newFrame;
    ////////////////////////////
    newFrame = fullTasteFrame;
    newFrame.origin.y = screenSizeLandscape.height;
    fullTaste.frame = newFrame;

    newFrame = chocolateFrame;
    newFrame.origin.y = screenSizeLandscape.width;
    chocolate.frame = newFrame;
    
    newFrame = fullTasteExtraFrame;
    newFrame.origin.y = screenSizeLandscape.width;
    standartLight.frame = newFrame;
    
    newFrame = chocolateFrame;
    newFrame.origin.y = screenSizeLandscape.width;
    fullTasteExtra.frame = newFrame;
    ///////////////////////
    newFrame = standatLightCFFrame;
    newFrame.origin.y = screenSizeLandscape.width;
    standatLightCF.frame = newFrame;
    
    newFrame = standartLightFrame;
    newFrame.origin.y = screenSizeLandscape.width;
    standartLight.frame = newFrame;
    
    newFrame = standartExtraFrame;
    newFrame.origin.y = screenSizeLandscape.width;
    standartExtra.frame = newFrame;
    
    newFrame = popUpFrame;
    newFrame.origin.y = newFrame.size.height *(-1);
    popUp.frame = newFrame;
    
    ////////////////////////
    textColumn1.alpha = 0;
    textColumn2.alpha = 0;
}

-(void)imageViewsHidden:(BOOL)hidden {
    if (hidden) {
        textColumn1.alpha = 0;
        textColumn2.alpha = 0;
    }
    textColumn1.hidden = hidden;
    textColumn2.hidden = hidden;
    
    popUp.hidden = hidden;
    
    fullTasteLightCF.hidden = hidden;
    fullTasteLight.hidden = hidden;
    standart.hidden = hidden;
    
    fullTaste.hidden = hidden;
    chocolate.hidden = hidden;
    fullTasteExtra.hidden = hidden;
    
    standatLightCF.hidden = hidden;
    standartLight.hidden = hidden;
    standartExtra.hidden = hidden;
}

-(void) startAnimations {
    timeIntervalAnimating++;
    
    if (timeIntervalAnimating == 3) {
        [UIView animateWithDuration:0.2 animations:^{
            fullTasteLightCF.frame = fullTasteLightCFFrame;
        }];
    }
    if (timeIntervalAnimating == 4) {
        [UIView animateWithDuration:0.2 animations:^{
            fullTaste.frame = fullTasteFrame;
        }];
    }
    if (timeIntervalAnimating == 5) {
        [UIView animateWithDuration:0.2 animations:^{
            standatLightCF.frame = standatLightCFFrame;
        }];
    }
    if (timeIntervalAnimating == 6) {
        [UIView animateWithDuration:0.2 animations:^{
            fullTasteLight.frame= fullTasteLightFrame;
        }];
    }
    if (timeIntervalAnimating == 7) {
        [UIView animateWithDuration:0.2 animations:^{
            chocolate.frame = chocolateFrame;
        }];
    }
    if (timeIntervalAnimating == 8) {
        [UIView animateWithDuration:0.2 animations:^{
            standartLight.frame = standartLightFrame;
        }];
    }
    if (timeIntervalAnimating == 9) {
        [UIView animateWithDuration:0.2 animations:^{
            standart.frame = standartFrame;
        }];
    }
    if (timeIntervalAnimating == 10) {
        [UIView animateWithDuration:0.2 animations:^{
            fullTasteExtra.frame = fullTasteExtraFrame;
        }];
    }
    if (timeIntervalAnimating == 11) {
        [UIView animateWithDuration:0.2 animations:^{
            standartExtra.frame = standartExtraFrame;
        }];
    }
    if (timeIntervalAnimating == 12) {
        [UIView animateWithDuration:0.2 animations:^{
            textColumn1.alpha = 1;
            textColumn2.alpha = 1;
        }];
    }
    if (timeIntervalAnimating == 13) {
        [UIView animateWithDuration:0.2 animations:^{
            popUp.frame = popUpFrame;
        }];
    }
}

@end
