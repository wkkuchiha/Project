//
//  ProgramStartViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/15.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "ProgramStartViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/SDImageCacheConfig.h>
#import <SDWebImage/SDWebImageCompat.h>
@interface ProgramStartViewController ()

@end

@implementation ProgramStartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 每个应用启动时都会调用一次 application didFinishLaunchingWithOptions：回调
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    
    // 获取IDFV来唯一的跟踪此设备
    NSString * deviceId = [[[UIDevice currentDevice] identifierForVendor]UUIDString];
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    BOOL firstLauch = ![defaults boolForKey:@"appLaunched"]; // 确保应用是初次启动还是之前就启动过
    if (firstLauch) {
        [defaults setBool:YES forKey:@"appLaunched"]; // 设置标记，表明应用之前就已经启动过
        [defaults synchronize];
        
        // 将设备注册到服务器
    }
    
    // 更多建立
    [[NSURLCache sharedURLCache]setMemoryCapacity:(8 * 1024 * 1024)];
    [[NSURLCache sharedURLCache]setDiskCapacity:(50 * 1024 * 1024)];
    [SDImageCache sharedImageCache].config.maxCacheSize = 8 * 1024 * 1024;
    NSString * accessToken = nil; // 追踪用户登录状态的访问令牌
    if (!firstLauch) {
        accessToken = [defaults stringForKey:@"accessToken"];
    }
    if (accessToken) { // 如果访问令牌存在，则表明用户已经登录过。如果用户修改了密码或从其他的设备远程登出，则需要刷新令牌。为简洁起见，此处省略了部分代码
        // 用户登录
    } else {
        if (firstLauch) { // 如果访问的令牌不存在，则有两种情况，一是应用是初次启动，此时需要展示应用的引导图。二是用户以前的应用会话期间并未登录
            
            // 首次启动
        } else { // 如果用户没有登录且应用也不是初次启动，你可以直接展示登录表单
            // 用户未登录
        }
    }
    return YES;
}

/**
 一些配置项可能需要等应用回到前台时（激活状态）才能被设置
 需要注意，每次应用从后台切换到前台时，此方法都会被调用，并非只是启动时。因此你需要确保不运行懂哈以避免引入重复延迟，因此这可能会惹恼用户
 */
- (BOOL)applicationDidBecomeActive:(UIApplication *)application {
#ifndef RELEASE_BETA // 不是标准的标记，而是自定义标记，用来区分是app store版本还是私有版本

#endif
    return YES;
}


// 处理通知
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    // 查看下一个方法
}

- (void)application:(UIApplication *)application didReceiveRemoteNotification:(nonnull NSDictionary *)userInfo fetchCompletionHandler:(nonnull void (^)(UIBackgroundFetchResult))completionHandler {
    
    // 处理远程通知-应用正在运行
    if (application.applicationState == UIApplicationStateInactive) {
        // 用户点击通知中心的通知或者报警弹窗
        [self processRemoteNotification:userInfo];
    } else if (application.applicationState == UIApplicationStateBackground) {
        // 应用在后台，不存在用户交互--只有获取数据
    } else {
        // 应用已经处于激活状态-显示应用内的更新
    }
}

- (void)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    id notication = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (notication != nil) {
        NSDictionary * userinfo = (NSDictionary *)notication;
        [self processRemoteNotification:userinfo];
    }
}

// 处理通知的核心位置
- (void)processRemoteNotification:(NSDictionary *)userinfo {
    
}
@end
