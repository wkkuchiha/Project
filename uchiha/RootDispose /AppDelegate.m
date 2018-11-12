//
//  AppDelegate.m
//  uchiha
//
//  Created by uchiha on 2017/8/10.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "AppDelegate.h"
#import "FourViewController.h"
#import "RootViewController.h"
#import "BookInViewController.h"
#import "UserDetailViewController.h"
#import "BookInNewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window=[[UIWindow  alloc]initWithFrame:[UIScreen  mainScreen].bounds];
    self.window.backgroundColor=[UIColor  whiteColor];
    
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:[AppDelegate createIndexViewController]];
    
//    PlayerBaseController *baseController = [PlayerBaseController new];
    self.window.rootViewController= nvc;
    [self.window  makeKeyAndVisible];
    
   
    return YES;
}

+ (RootViewController *)createIndexViewController {
    RootViewController *rootController = [[RootViewController alloc]init];
    BookInNewController *bookInCtril = [[BookInNewController alloc]init];
    UserDetailViewController *userDetailCtril = [[UserDetailViewController alloc]init];
    rootController.viewControllers = @[bookInCtril,userDetailCtril];
    UITabBar *tabBar = rootController.tabBar;
    [tabBar setBarStyle:UIBarStyleDefault];
    [tabBar setBackgroundColor:[UIColor whiteColor]];
    
    UITabBarItem * item0 = [tabBar.items objectAtIndex:0];
    UITabBarItem * item1 = [tabBar.items objectAtIndex:1];
    
    item0.image = [UIImage imageNamed:@"home.png"];
    item0.selectedImage = [UIImage imageNamed:@"home_selected.png"];
    item1.image = [UIImage imageNamed:@"tab_user.png"];
    item1.selectedImage = [UIImage imageNamed:@"tab_user_selected.png"];
    
    item0.title = @"首页";
    item1.title = @"我的";

    return rootController;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
