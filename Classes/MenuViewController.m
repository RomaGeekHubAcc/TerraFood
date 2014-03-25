//
//  MenuViewController.m
//  TerraFoodR
//
//  Created by Roman Rybachenko on 3/4/14.
//  Copyright (c) 2014 Roman Rybachenko. All rights reserved.
//


#define screenSize [[UIScreen mainScreen] bounds].size
#define screenSizeLandscape CGSizeMake(screenSize.height, screenSize.width)

#define titleKey @"titleName"
#define imageKey @"image"
#define TEXT_COLOR [UIColor colorWithRed:161/255.0f green:46/255.0 blue:129/255.0 alpha:1]


#import "CustomCell.h"
#import "AboutUsViewController.h"
#import "AboutUsPageTwoViewController.h"
#import "OurProductsViewController.h"
#import "OurProductsPageTwoViewController.h"
#import "ContactUsPageTwoViewController.h"
#import "ContactUsViewController.h"
#import "PagesContainerViewController.h"
#import "UkranianGloryViewController.h"
#import "UkraniagGloryPageTwoViewController.h"
#import "GoldValleyViewController.h"
#import "GoldValleyViewControllerPageTwo.h"
#import "HundredKowsViewController.h"
#import "FermaViewController.h"
#import "FremialleViewController.h"

#import "MenuViewController.h"


@interface MenuViewController () {
    NSArray *companies, *viewControllers;
    
    __weak IBOutlet UIImageView *moveScreenImg;
    
    NSTimer *timer;
    
    CGRect moveImgStartFrame;
    CGRect moveImgFinishFrame;
    
    BOOL otherButtonHighlited;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *aboutUsOutlet;
@property (weak, nonatomic) IBOutlet UIButton *ourProductOutlet;
@property (weak, nonatomic) IBOutlet UIButton *contactOutlet;

- (IBAction)aboutUs:(id)sender;
- (IBAction)ourProduct:(id)sender;
- (IBAction)contact:(id)sender;


@end


@implementation MenuViewController


-(void) viewDidLoad {
    [super viewDidLoad];
    
    otherButtonHighlited = NO;
	
    [self.navigationController setNavigationBarHidden:YES];
    
    companies = [self fillCompanies];
    viewControllers = [self createViewControllers];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    moveImgStartFrame = moveScreenImg.frame;
    moveImgStartFrame.origin.x = screenSizeLandscape.width;
    
    moveImgFinishFrame = moveScreenImg.frame;
    moveImgFinishFrame.origin.x = moveImgFinishFrame.size.width * (-1);

}

-(void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self setFrameForStartAnimatingMoveView];
    moveScreenImg.hidden = NO;
    
    [self startAnimations];
    
    timer = [NSTimer scheduledTimerWithTimeInterval:5.2 target:self selector:@selector(startAnimations) userInfo:nil repeats:YES];
    [self.tableView deselectRowAtIndexPath:self.tableView.indexPathForSelectedRow animated:YES];
}

-(void)viewDidDisappear:(BOOL)animated {
    moveScreenImg.hidden = YES;
    [self setFrameForStartAnimatingMoveView];

    [timer invalidate];
    timer = nil;
    otherButtonHighlited = NO;
}

-(BOOL) prefersStatusBarHidden {
    return YES;
}


#pragma mark - TableViewDataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return companies.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"CustomCell";
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *company = [companies objectAtIndex:indexPath.row];
    
    cell.customLabel.textColor = TEXT_COLOR;
    cell.customLabel.font = [UIFont fontWithName:@"MyriadPro-Light" size:53];
    cell.customLabel.text = [company objectForKey:titleKey];
    
    cell.customImageView.image = [company objectForKey:imageKey];
    
    return cell;
}


#pragma mark - UITableViewDelegate

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 130.0f;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PagesContainerViewController *pagesContailerVc = nil;
    
    if (indexPath.row == 0) {
        pagesContailerVc = [self createPageContainerVcWithIndex:[self getIndexOfViewController:[[UkranianGloryViewController class]description]]];
    }
    else if (indexPath.row == 1) {
        pagesContailerVc = [self createPageContainerVcWithIndex:[self getIndexOfViewController:[[GoldValleyViewController class]description]]];
    }
    else if (indexPath.row == 2) {
        pagesContailerVc = [self createPageContainerVcWithIndex:[self getIndexOfViewController:[[HundredKowsViewController class]description]]];
    }
    else if (indexPath.row == 3) {
        pagesContailerVc = [self createPageContainerVcWithIndex:[self getIndexOfViewController:[[FermaViewController class]description]]];
    }
    else if (indexPath.row == 4) {
        pagesContailerVc = [self createPageContainerVcWithIndex:[self getIndexOfViewController:[[FremialleViewController class]description]]];
    }
    
    [self.navigationController pushViewController:pagesContailerVc animated:YES];
}


#pragma mark - Action methods

-(IBAction) aboutUs:(id)sender {
    if (otherButtonHighlited == YES) {
        return;
    }
    if (_contactOutlet.highlighted || _ourProductOutlet.highlighted) {
        otherButtonHighlited = YES;
    }
    PagesContainerViewController *pagesContailerVc = [self createPageContainerVcWithIndex:0];
    [self.navigationController pushViewController:pagesContailerVc animated:YES];
}

-(IBAction) ourProduct:(id)sender {
    if (otherButtonHighlited == YES) {
        return;
    }
    if (_contactOutlet.highlighted || _aboutUsOutlet.highlighted) {
        otherButtonHighlited = YES;
    }
    PagesContainerViewController *pagesContailerVc = [self createPageContainerVcWithIndex:2];
    [self.navigationController pushViewController:pagesContailerVc animated:YES];
}

-(IBAction) contact:(id)sender {
    if (otherButtonHighlited == YES) {
        return;
    }
    if (_ourProductOutlet.highlighted || _aboutUsOutlet.highlighted) {
        otherButtonHighlited = YES;
    }
    PagesContainerViewController *pagesContailerVc = [self createPageContainerVcWithIndex:viewControllers.count - 2];
    [self.navigationController pushViewController:pagesContailerVc animated:YES];
}


#pragma mark - Private methods

-(void) setFrameForStartAnimatingMoveView {
    CGRect newFrame = moveScreenImg.frame;
    newFrame.origin.x = newFrame.size.width * (-1);
    moveScreenImg.frame = newFrame;
}

-(void) startAnimations {
    
    [UIView animateWithDuration:5.0 animations:^{
        moveScreenImg.hidden = NO;
        moveScreenImg.frame = moveImgStartFrame;
    }completion:^(BOOL finished) {
        moveScreenImg.hidden = YES;
        moveScreenImg.frame = moveImgFinishFrame;
    }];
}

-(PagesContainerViewController*) createPageContainerVcWithIndex:(NSUInteger)index {
    PagesContainerViewController *pagesContailerVc = [self.storyboard instantiateViewControllerWithIdentifier:@"PagesContainerViewController"];
    pagesContailerVc.indexOfViewController = index;
    pagesContailerVc.viewControllers = viewControllers;
    
    return pagesContailerVc;
}

-(NSArray*) fillCompanies {
    NSDictionary *dict1 = @{titleKey : @"Blended Butter",
                            imageKey : [UIImage imageNamed:@"UkranianGloryLogo.png"]};
    NSDictionary *dict2 = @{titleKey : @"Butter-\n Vegetables Ghee",
                            imageKey : [UIImage imageNamed:@"GoldValleyLogo.png"]};
    NSDictionary *dict3 = @{titleKey : @"Blended Butter",
                            imageKey : [UIImage imageNamed:@"100kowsLogo.png"]};
    NSDictionary *dict4 = @{titleKey : @"Cheese",
                            imageKey : [UIImage imageNamed:@"FermaLogo.png"]};
    NSDictionary *dict5 = @{titleKey : @"Feta, Brynza, Cream",
                            imageKey : [UIImage imageNamed:@"FremialleMilkLogo.png"]};
    
    return [NSArray arrayWithObjects:dict1, dict2, dict3, dict4, dict5, nil];
}

-(NSArray*) createViewControllers {
    AboutUsViewController *aboutUsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsViewController"];
    AboutUsPageTwoViewController *aboutUsPageTwoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"AboutUsPageTwoViewController"];
    OurProductsViewController *ourProductVC  = [self.storyboard instantiateViewControllerWithIdentifier:@"OurProductsViewController"];
    OurProductsPageTwoViewController *ourProdsPageTwoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"OurProductsPageTwoViewController"];
    
    UkranianGloryViewController *ukGloryVC = [self.storyboard instantiateViewControllerWithIdentifier:@"UkranianGloryViewController"];
    UkraniagGloryPageTwoViewController *ukrGloryP2VC = [self.storyboard instantiateViewControllerWithIdentifier:@"UkraniagGloryPageTwoViewController"];
    GoldValleyViewController *goldValleyVC = [self.storyboard instantiateViewControllerWithIdentifier:@"GoldValleyViewController"];
    GoldValleyViewControllerPageTwo *goldValleyVCp2 = [self.storyboard instantiateViewControllerWithIdentifier:@"GoldValleyViewControllerPageTwo"];
    HundredKowsViewController *hundredKowsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"HundredKowsViewController"];
    FermaViewController *fermaVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FermaViewController"];
    FremialleViewController *fremailleVC = [self.storyboard instantiateViewControllerWithIdentifier:@"FremialleViewController"];
    
    ContactUsViewController *contactUsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsViewController"];
    ContactUsPageTwoViewController *contaxtUsPageTwoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"ContactUsPageTwoViewController"];
    
    return [NSArray arrayWithObjects:aboutUsVC, aboutUsPageTwoVC, ourProductVC, ourProdsPageTwoVC, ukGloryVC, ukrGloryP2VC, goldValleyVC, goldValleyVCp2, hundredKowsVC, fermaVC, fremailleVC, contactUsVC, contaxtUsPageTwoVC,  nil];
}

-(NSInteger) getIndexOfViewController:(NSString*)viewController {
    NSUInteger index = 0;
    
    for (NSInteger i = 0; i < viewControllers.count; i++) {
        UIViewController *vc = [viewControllers objectAtIndex:i];
        if ([viewController isEqualToString:[[vc class] description]]) {
            return i;
        }
    }
    
    return index;
}

@end
