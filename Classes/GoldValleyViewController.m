//
//  GoldValleyViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/7/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "GoldValleyViewController.h"

@interface GoldValleyViewController () {
    
    __weak IBOutlet UIImageView *textCol1;
    __weak IBOutlet UIImageView *textCol2;
    
    __weak IBOutlet UIImageView *gvBig_gr;
    __weak IBOutlet UIImageView *gvBig_red;
    __weak IBOutlet UIImageView *gvBig_ye;
    __weak IBOutlet UIImageView *gvBig_bl;
    
    __weak IBOutlet UIImageView *gvSmall_255p;
    __weak IBOutlet UIImageView *gvSmall_015p;
    __weak IBOutlet UIImageView *gvSmall_3p;
    __weak IBOutlet UIImageView *gvSmall_15p;
    
    
    CGRect gvBig_grFrame;
    CGRect gvBig_redFrame;
    CGRect gvBig_yeFrame;
    CGRect gvBig_blFrame;
    
    CGRect gvSmall_255pFrame;
    CGRect gvSmall_015pFrame;
    CGRect gvSmall_3pFrame;
    CGRect gvSmall_15pFrame;
    
    BOOL willDisappear;
    
    NSTimer *timer;
    
    NSUInteger timeIntervalAnimating;
}

- (IBAction)backToMainMenu:(id)sender;

@end

@implementation GoldValleyViewController


-(void) viewDidLoad
{
    [super viewDidLoad];
    
    gvBig_grFrame = gvBig_gr.frame;
    gvBig_redFrame = gvBig_red.frame;
    gvBig_yeFrame = gvBig_ye.frame;
    gvBig_blFrame = gvBig_bl.frame;
    
    gvSmall_255pFrame = gvSmall_255p.frame;
    gvSmall_015pFrame = gvSmall_015p.frame;
    gvSmall_3pFrame = gvSmall_3p.frame;
    gvSmall_15pFrame = gvSmall_15p.frame;
    
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

- (IBAction)backToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}


#pragma mark - Private methods

-(void) setFramesForStartAnimating {
    
    CGRect newFrame = gvBig_grFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    gvBig_gr.frame = newFrame;
    
    newFrame = gvBig_redFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    gvBig_red.frame = newFrame;
    
    newFrame = gvBig_yeFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    gvBig_ye.frame = newFrame;
    
    newFrame = gvBig_blFrame;
    newFrame.origin.x = screenSizeLandscape.width;
    gvBig_bl.frame = newFrame;
    
    newFrame = gvSmall_255pFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    gvSmall_255p.frame = newFrame;
    
    newFrame = gvSmall_015pFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    gvSmall_015p.frame = newFrame;
    
    newFrame = gvSmall_3pFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    gvSmall_3p.frame = newFrame;
    
    newFrame = gvSmall_15pFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    gvSmall_15p.frame = newFrame;
    
    textCol1.alpha = 0.0;
    textCol2.alpha = 0.0;
}

-(void)imageViewsHidden:(BOOL)hidden {
    if (hidden) {
        textCol1.alpha = 0;
        textCol2.alpha = 0;
    }
    textCol1.hidden = hidden;
    textCol2.hidden = hidden;
    
    gvBig_gr.hidden = hidden;
    gvBig_red.hidden = hidden;
    gvBig_ye.hidden = hidden;
    gvBig_bl.hidden = hidden;
    
    gvSmall_255p.hidden = hidden;
    gvSmall_015p.hidden = hidden;
    gvSmall_3p.hidden = hidden;
    gvSmall_15p.hidden = hidden;
}

-(void) startAnimations {
    timeIntervalAnimating++;
    
    if (timeIntervalAnimating == 3) {
        [UIView animateWithDuration:0.2 animations:^{
            gvBig_gr.frame = gvBig_grFrame;
            gvSmall_255p.frame = gvSmall_255pFrame;
        }];
    }
    if (timeIntervalAnimating == 5) {
        [UIView animateWithDuration:0.2 animations:^{
            gvBig_red.frame = gvBig_redFrame;
            gvSmall_015p.frame = gvSmall_015pFrame;
        }];
    }
    if (timeIntervalAnimating == 7) {
        [UIView animateWithDuration:0.2 animations:^{
            gvBig_ye.frame = gvBig_yeFrame;
            gvSmall_3p.frame = gvSmall_3pFrame;
        }];
    }
    if (timeIntervalAnimating == 9) {
        [UIView animateWithDuration:0.2 animations:^{
            gvBig_bl.frame = gvBig_blFrame;
            gvSmall_15p.frame = gvSmall_15pFrame;
        }];
    }
    if (timeIntervalAnimating == 11) {
        [UIView animateWithDuration:0.2 animations:^{
            textCol1.alpha = 1.0;
            textCol2.alpha = 1.0;
        }];
    }
}

@end
