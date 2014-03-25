//
//  ContactUsPageTwoViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/6/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//

#import "ContactUsPageTwoViewController.h"

@interface ContactUsPageTwoViewController ()

-(IBAction) backToMainMenu:(id)sender;

@end

@implementation ContactUsPageTwoViewController

-(void) viewDidLoad {
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(BOOL) prefersStatusBarHidden {
    return YES;
}


#pragma mark - Action methods

-(IBAction) backToMainMenu:(id)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

@end
