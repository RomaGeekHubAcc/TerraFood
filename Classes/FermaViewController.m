//
//  FermaViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/7/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "FermaViewController.h"

@interface FermaViewController () {
    
    __weak IBOutlet UIImageView *textCol1;
    __weak IBOutlet UIImageView *textCol2;
    __weak IBOutlet UIImageView *textCol3;
    
    __weak IBOutlet UIImageView *popup;
    
    __weak IBOutlet UIImageView *cheeseRos;
    __weak IBOutlet UIImageView *cheeseSmetan;
    __weak IBOutlet UIImageView *cheeseGoll;
    
    __weak IBOutlet UIImageView *cheeseSmetanPack;
    __weak IBOutlet UIImageView *cheeseRosPack;
    __weak IBOutlet UIImageView *cheeseGollPack;
    
    __weak IBOutlet UIImageView *cheesePlavlZelen;
    __weak IBOutlet UIImageView *cheesePlavlVershki;
    __weak IBOutlet UIImageView *cheesePlavlGrybi;
    
    CGRect textCol1Frame;
    CGRect textCol2Frame;
    CGRect textCol3Frame;
    
    CGRect popupFrame;
    
    CGRect cheeseRosFrame;
    CGRect cheeseSmetanFrame;
    CGRect cheeseGollFrame;
    
    CGRect cheeseSmetanPackFrame;
    CGRect cheeseRosPackFrame;
    CGRect cheeseGollPackFrame;
    
    CGRect cheesePlavlZelenFrame;
    CGRect cheesePlavlVershkiFrame;
    CGRect cheesePlavlGrybiFrame;
    
    BOOL willDisappear;
    
    NSTimer *timer;
    
    NSUInteger timeIntervalAnimating;
}

- (IBAction)backToMainMenu:(id)sender;

@end

@implementation FermaViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    textCol1Frame = textCol1.frame;
    textCol2Frame = textCol2.frame;
    textCol3Frame = textCol3.frame;
    
    popupFrame = popup.frame;
    
    cheeseRosFrame = cheeseRos.frame;
    cheeseSmetanFrame = cheeseSmetan.frame;
    cheeseGollFrame = cheeseGoll.frame;
    
    cheeseSmetanPackFrame = cheeseSmetanPack.frame;
    cheeseRosPackFrame = cheeseRosPack.frame;
    cheeseGollPackFrame = cheeseGollPack.frame;
    
    cheesePlavlZelenFrame = cheesePlavlZelen.frame;
    cheesePlavlVershkiFrame = cheesePlavlVershki.frame;
    cheesePlavlGrybiFrame = cheesePlavlGrybi.frame;
    
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
    CGRect newFrame = textCol1Frame;
    newFrame.origin.y = screenSizeLandscape.height;
    textCol1.frame = newFrame;
    
    newFrame = textCol2Frame;
    newFrame.origin.y = screenSizeLandscape.height;
    textCol2.frame = newFrame;
    
    newFrame = textCol3Frame;
    newFrame.origin.y = screenSizeLandscape.height;
    textCol3.frame = newFrame;
    
    newFrame = popupFrame;
    newFrame.origin.y = newFrame.size.height * (-1);
    popup.frame = newFrame;
    /////////////////////////////////
    newFrame = cheeseRosFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    cheeseRos.frame = newFrame;
    
    newFrame = cheeseSmetanFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    cheeseSmetan.frame = newFrame;
    
    newFrame = cheeseGollFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    cheeseGoll.frame = newFrame;
    /////////////////////////////////
    newFrame = cheeseSmetanPackFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    cheeseSmetanPack.frame = newFrame;
    
    newFrame = cheeseRosPackFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    cheeseRosPack.frame = newFrame;
    
    newFrame = cheeseGollPackFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    cheeseGollPack.frame = newFrame;
    /////////////////////////////////
    newFrame = cheesePlavlZelenFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    cheesePlavlZelen.frame = newFrame;
    
    newFrame = cheesePlavlVershkiFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    cheesePlavlVershki.frame = newFrame;
    
    newFrame = cheesePlavlGrybiFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    cheesePlavlGrybi.frame = newFrame;
}

-(void)imageViewsHidden:(BOOL)hidden {
    textCol1.hidden = hidden;
    textCol2.hidden = hidden;
    textCol3.hidden = hidden;
    
    popup.hidden = hidden;
    
    cheeseRos.hidden = hidden;
    cheeseSmetan.hidden = hidden;
    cheeseGoll.hidden = hidden;
    
    cheeseSmetanPack.hidden = hidden;
    cheeseRosPack.hidden = hidden;
    cheeseGollPack.hidden = hidden;
    
    cheesePlavlZelen.hidden = hidden;
    cheesePlavlVershki.hidden = hidden;
    cheesePlavlGrybi.hidden = hidden;
}

-(void) startAnimations {
    timeIntervalAnimating++;
    
    if (timeIntervalAnimating == 3) {
        [UIView animateWithDuration:0.2 animations:^{
            textCol1.frame = textCol1Frame;
            cheeseRos.frame = cheeseRosFrame;
            cheeseSmetanPack.frame = cheeseSmetanPackFrame;
        }];
    }
    if (timeIntervalAnimating == 5) {
        [UIView animateWithDuration:0.2 animations:^{
            textCol2.frame = textCol2Frame;
            cheeseSmetan.frame = cheeseSmetanFrame;
            cheeseRosPack.frame = cheeseRosPackFrame;
        }];
    }
    if (timeIntervalAnimating == 7) {
        [UIView animateWithDuration:0.2 animations:^{
            textCol3.frame = textCol3Frame;
            cheeseGoll.frame = cheeseGollFrame;
            cheeseGollPack.frame = cheeseGollPackFrame;
            popup.frame = popupFrame;
        }];
    }
    if (timeIntervalAnimating == 9) {
        [UIView animateWithDuration:0.2 animations:^{
            cheesePlavlZelen.frame = cheesePlavlZelenFrame;
            cheesePlavlVershki.frame = cheesePlavlVershkiFrame;
            cheesePlavlGrybi.frame = cheesePlavlGrybiFrame;
        }];
    }
        
}


#pragma mark - Action methods

- (IBAction)backToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
