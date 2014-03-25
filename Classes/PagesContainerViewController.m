//
//  PagesContainerViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/5/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#import "AboutUsViewController.h"
#import "AboutUsPageTwoViewController.h"
#import "OurProductsViewController.h"

#import "PagesContainerViewController.h"


@interface PagesContainerViewController ()

@end


@implementation PagesContainerViewController

-(void) viewDidLoad {
    [super viewDidLoad];
	
    NSDictionary *options = @{[NSNumber numberWithInteger:UIPageViewControllerSpineLocationMin]: UIPageViewControllerOptionSpineLocationKey};
    self.pageVC = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl
                                                  navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal
                                                                options:options];
    self.pageVC.dataSource = self;
    self.pageVC.delegate = self;
    
    [self setFirstViewControllerWithIndex:_indexOfViewController];
    self.pageVC.view.frame = self.view.bounds;
    [self addChildViewController:self.pageVC];
    [self.view addSubview:self.pageVC.view];
    [self.pageVC didMoveToParentViewController:self];
}

- (BOOL)prefersStatusBarHidden
{
    return YES;
}


#pragma mark - Private methods

-(void) setFirstViewControllerWithIndex:(NSUInteger)index {
    [self.pageVC setViewControllers:[NSArray arrayWithObject:[self.viewControllers objectAtIndex:index]]
                          direction:UIPageViewControllerNavigationDirectionForward
                           animated:YES
                         completion:nil];
}

-(UIViewController*) viewControllerAtIndex:(NSInteger)index {
    return index > self.viewControllers.count - 1 ? nil : [_viewControllers objectAtIndex:index];
}


#pragma mark - UIPageViewControllerDataSource


-(UIViewController *) pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    
    return [self viewControllerAtIndex:index];
}

-(UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    
    NSInteger index = [self.viewControllers indexOfObject:viewController];
    
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    if (index == self.viewControllers.count) {
        return nil;
    }
    
    return [self viewControllerAtIndex:index];
}


#pragma mark - UIPageViewControllerDelegate

-(void) pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray *)previousViewControllers transitionCompleted:(BOOL)completed {

}

@end
