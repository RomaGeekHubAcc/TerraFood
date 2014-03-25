//
//  OurProductsViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/6/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)


#import "OurProductsViewController.h"


@interface OurProductsViewController () {
    UIImageView *ourProdLabel;
    UIImageView *column1;
    UIImageView *column2;
    
    CGRect ourProdLabelFrame;
    CGRect column1Frame;
    CGRect column2Frame;
    
    NSTimer *timer;
    
    NSUInteger timeIntervalAnimating;
    
    BOOL willDisappear;
}
-(IBAction) backToMainMenu:(id)sender;

@end


@implementation OurProductsViewController

-(void) viewDidLoad
{
    [super viewDidLoad];
	
    ourProdLabel = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"OurProductsLabel.png"]];
    column1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"OurProdsColumn1.png"]];
    column2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"OurProdsColumn2.png"]];
    
    ourProdLabelFrame = CGRectMake(186, 442, 515, 48);
    column1Frame = CGRectMake(406, 514, 206, 109);
    column2Frame = CGRectMake(648, 514, 218, 211);
    
    willDisappear = NO;
}

-(BOOL) prefersStatusBarHidden
{
    return YES;
}

-(void) viewWillDisappear:(BOOL)animated {
    willDisappear = YES;
}

-(void) viewDidAppear:(BOOL)animated {
    if (willDisappear) {
        ourProdLabel.hidden = NO;
        column1.hidden = NO;
        column2.hidden = NO;
        
        ourProdLabel.frame = ourProdLabelFrame;
        column1.frame = column1Frame;
        column2.frame = column2Frame;
        
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
            
            ourProdLabel.frame = ourProdLabelFrame;
        }];
    }
    if (timeIntervalAnimating == 8) {
        [UIView animateWithDuration:0.2 animations:^{
            column1.frame = column1Frame;
        }];
    }
    if (timeIntervalAnimating == 10) {
        [UIView animateWithDuration:0.2 animations:^{
            column2.frame = column2Frame;
        }];
    }
}


#pragma mark - Private methods

-(void) hideViewsForAnimating {
    CGRect newFrame = ourProdLabelFrame;
    newFrame.origin.x = newFrame.size.width * (-1);
    ourProdLabel.frame = newFrame;
    
    newFrame = column1Frame;
    newFrame.origin.y = screenSizeLandscape.height + newFrame.size.height;
    column1.frame = newFrame;
    
    newFrame = column2Frame;
    newFrame.origin.y = screenSizeLandscape.height + newFrame.size.height;
    column2.frame = newFrame;
}

-(void)addSubViews {
    [self.view addSubview:ourProdLabel];
    [self.view addSubview:column1];
    [self.view addSubview:column2];
}

-(void) removeSubViews {
    [ourProdLabel removeFromSuperview];
    [column1 removeFromSuperview];
    [column2 removeFromSuperview];
}

@end
