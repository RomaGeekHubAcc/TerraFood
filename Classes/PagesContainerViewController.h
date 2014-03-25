//
//  PagesContainerViewController.h
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/5/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PagesContainerViewController : UIViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (nonatomic, strong) UIPageViewController *pageVC;
@property (nonatomic) NSArray *viewControllers;
@property (nonatomic) NSUInteger indexOfViewController;


@end
