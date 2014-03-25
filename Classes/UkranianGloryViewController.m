//
//  UkranianGloryViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/7/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//

#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)

#import "UkranianGloryViewController.h"



@interface UkranianGloryViewController () {
    
    __weak IBOutlet UIImageView *textColumn1;
    __weak IBOutlet UIImageView *textColumn2;
    
    __weak IBOutlet UIImageView *fullTasteExtra;
    __weak IBOutlet UIImageView *fullTaste;
    __weak IBOutlet UIImageView *fullTasteLight;
    __weak IBOutlet UIImageView *fullTasteLightHF;
    
    __weak IBOutlet UIImageView *standartExtra;
    __weak IBOutlet UIImageView *standartLight;
    __weak IBOutlet UIImageView *chocolate;
    
    __weak IBOutlet UIImageView *standart;
    __weak IBOutlet UIImageView *standartLightHF;
    
    CGRect fullTasteExtraFrame;
    CGRect fullTasteFrame;
    CGRect fullTasteLightFrame;
    CGRect fullTasteLightHFFrame;
    
    CGRect standartExtraFrame;
    CGRect standartLightFrame;
    CGRect chocolateFrame;
    
    CGRect standartFrame;
    CGRect standartLightHFFrame;
    
    BOOL willDisappear;
    
    NSTimer *timer;

    NSUInteger timeIntervalAnimating;
}

- (IBAction)backTomainMenu:(id)sender;

@end


@implementation UkranianGloryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    fullTasteExtraFrame = fullTasteExtra.frame;
    fullTasteFrame = fullTaste.frame;
    fullTasteLightFrame = fullTasteLight.frame;
    fullTasteLightHFFrame = fullTasteLightHF.frame;
    
    standartExtraFrame = standartExtra.frame;
    standartLightFrame = standartLight.frame;
    chocolateFrame = chocolate.frame;
    
    standartFrame = standart.frame;
    standartLightHFFrame = standartLightHF.frame;
    
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

-(IBAction) backTomainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

-(void) startAnimations {
    timeIntervalAnimating++;
    if (timeIntervalAnimating == 3) {
        [UIView animateWithDuration:0.2 animations:^{
            fullTasteExtra.frame = fullTasteExtraFrame;
        }];
    }
    if (timeIntervalAnimating == 4) {
        [UIView animateWithDuration:0.2 animations:^{
            fullTaste.frame = fullTasteFrame;
        }];
    }
    if (timeIntervalAnimating == 5) {
        [UIView animateWithDuration:0.2 animations:^{
            fullTasteLight.frame = fullTasteLightFrame;
        }];
    }
    if (timeIntervalAnimating == 6) {
        [UIView animateWithDuration:0.2 animations:^{
            fullTasteLightHF.frame = fullTasteLightHFFrame;
        }];
    }
    if (timeIntervalAnimating == 7) {
        [UIView animateWithDuration:0.2 animations:^{
            standartExtra.frame = standartExtraFrame;
        }];
    }
    if (timeIntervalAnimating == 8) {
        [UIView animateWithDuration:0.2 animations:^{
            standartLight.frame = standartLightFrame;
        }];
    }
    if (timeIntervalAnimating == 9) {
        [UIView animateWithDuration:0.2 animations:^{
            chocolate.frame = chocolateFrame;
        }];
    }
    if (timeIntervalAnimating == 10) {
        [UIView animateWithDuration:0.2 animations:^{
            standart.frame = standartFrame;
        }];
    }
    if (timeIntervalAnimating == 11) {
        [UIView animateWithDuration:0.2 animations:^{
            standartLightHF.frame = standartLightHFFrame;
        }];
    }
    if (timeIntervalAnimating == 12) {
        [UIView animateWithDuration:0.2 animations:^{
            textColumn1.alpha = 1;
            textColumn2.alpha = 1;
        }];
    }
}

#pragma mark - Private methods

-(void) setFramesForStartAnimating {
    CGRect newFrame = fullTasteExtraFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    fullTasteExtra.frame = newFrame;
    
    newFrame = fullTasteFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    fullTaste.frame = newFrame;
    
    newFrame = fullTasteLightFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    fullTasteLight.frame = newFrame;
    
    newFrame = fullTasteLightHFFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    fullTasteLightHF.frame = newFrame;
    ////////////////
    newFrame = standartExtraFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    standartExtra.frame = newFrame;
    
    newFrame = standartLightFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    standartLight.frame = newFrame;
    
    newFrame = chocolateFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    chocolate.frame = newFrame;
    ///////////////////////
    newFrame = standartFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    standart.frame = newFrame;
    
    newFrame = standartLightHFFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    standartLightHF.frame = newFrame;
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
    fullTasteExtra.hidden = hidden;
    fullTaste.hidden = hidden;
    fullTasteLight.hidden = hidden;
    fullTasteLightHF.hidden = hidden;
    
    standartExtra.hidden = hidden;
    standartLight.hidden = hidden;
    chocolate.hidden = hidden;
    
    standart.hidden = hidden;
    standartLightHF.hidden = hidden;
}



@end
