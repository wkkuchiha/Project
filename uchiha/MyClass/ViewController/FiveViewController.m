//
//  FiveViewController.m
//  控件系数-03
//
//  Created by 张玺 on 15/12/8.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "FiveViewController.h"
#import "UIDevice-Hardware.h"
#import "SecondViewController.h"
#import "ThirdViewController.h"
@interface FiveViewController ()
{
    UIViewController  *  rootVC;
    BOOL    _isHomeVc;
}
@end

@implementation FiveViewController

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDefault;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title=@"获取硬件信息";
    self.view.backgroundColor=[UIColor  whiteColor];
    [self  setUpView1];
    [self  test2];
}

- (void)setUpView1
{
    NSLog(@"当前版本号%@",[[UIDevice  currentDevice]  platformString]);
}
- (void)test2
{
    UIDevice  *  currentDevice=[UIDevice  currentDevice];
    NSLog(@"totalDiskSpace%f G--freeDiskSpace%f G",[[currentDevice  totalDiskSpace] floatValue]/1024/1024/1024,[[currentDevice  freeDiskSpace] floatValue]/1024/1024/1024);
}
@end
