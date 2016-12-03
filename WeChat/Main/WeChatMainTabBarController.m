//
//  WeChatMainTabBarController.m
//  WeChat
//
//  Created by 李亚东 on 16/11/26.
//  Copyright © 2016年 李亚东. All rights reserved.
//

#import "WeChatMainTabBarController.h"

#import "MessageMainViewController.h"
#import "AddressMainViewController.h"
#import "DiscoverMainViewController.h"
#import "MineMainViewController.h"



@interface WeChatMainTabBarController ()

@end

@implementation WeChatMainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addBasicViewController];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)addBasicViewController {

    MessageMainViewController *messageMainVC = [[MessageMainViewController alloc] init];
    messageMainVC.view.backgroundColor = MainBackgroundColor;
    UINavigationController *messageNavigation = [[UINavigationController alloc] initWithRootViewController:messageMainVC];
    messageNavigation.navigationBar.barStyle = UIBarStyleBlack;
    messageNavigation.title = @"微信";
    [messageNavigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_back_image"] forBarMetrics:UIBarMetricsDefault];
    messageNavigation.tabBarItem.image = [UIImage imageNamed:@"tabBar_message_image"];
    messageMainVC.navigationItem.title = @"微信";
    [self addChildViewController:messageNavigation];
    
    
    AddressMainViewController *addressMainVC = [[AddressMainViewController alloc] init];
    addressMainVC.view.backgroundColor = MainBackgroundColor;
    UINavigationController *addressNavigation = [[UINavigationController alloc] initWithRootViewController:addressMainVC];
    addressNavigation.navigationBar.barStyle = UIBarStyleBlack;
    addressNavigation.title = @"通讯录";
    [addressNavigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_back_image"] forBarMetrics:UIBarMetricsDefault];
    addressNavigation.tabBarItem.image = [UIImage imageNamed:@"tabBar_addressr_image"];
    addressMainVC.navigationItem.title = @"通讯录";
    [self addChildViewController:addressNavigation];

    
    
    
    DiscoverMainViewController *discoverMainVC = [[DiscoverMainViewController alloc] init];
    discoverMainVC.view.backgroundColor = MainBackgroundColor;
    UINavigationController *discoverNavigation = [[UINavigationController alloc] initWithRootViewController:discoverMainVC];
    discoverNavigation.title = @"发现";
    discoverNavigation.navigationBar.barStyle = UIBarStyleBlack;
    [discoverNavigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_back_image"] forBarMetrics:UIBarMetricsDefault];
    discoverNavigation.tabBarItem.image = [UIImage imageNamed:@"tabBar_discover_image"];
    discoverMainVC.navigationItem.title = @"发现";
    [self addChildViewController:discoverNavigation];

    
    
    MineMainViewController *mineMainVC = [[MineMainViewController alloc] init];
    mineMainVC.view.backgroundColor = MainBackgroundColor;
    UINavigationController *mineNavigation = [[UINavigationController alloc] initWithRootViewController:mineMainVC];
    mineNavigation.title = @"我";
    mineNavigation.navigationBar.barStyle = UIBarStyleBlack;
    [mineNavigation.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_back_image"] forBarMetrics:UIBarMetricsDefault];

    mineNavigation.tabBarItem.image = [UIImage imageNamed:@"tabBar_mine_image"];
    mineMainVC.navigationItem.title = @"我";
    [self addChildViewController:mineNavigation];

    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
