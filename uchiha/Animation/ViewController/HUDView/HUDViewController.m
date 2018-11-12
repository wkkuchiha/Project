//
//  HUDViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/7/22.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "HUDViewController.h"
#import "MBProgressHUD.h"

@interface HUDViewController ()

@end

@implementation HUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    self.navigationItem.title = @"HUD动画展示";
    UIButton * firstBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:firstBtn];
    firstBtn.backgroundColor = [UIColor blueColor];
    firstBtn.frame = CGRectMake(10, 100, 100, 50);
    [firstBtn setTitle:@"Show" forState:UIControlStateNormal];
    [firstBtn addTarget:self action:@selector(show) forControlEvents:UIControlEventTouchUpInside];
}
@end
