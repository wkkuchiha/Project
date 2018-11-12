//
//  TwentyEightViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/6/20.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "TwentyEightViewController.h"
#import "TwentyEightSonViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface TwentyEightViewController ()

@end

@implementation TwentyEightViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"传值方法练习";
    self.view.backgroundColor = [UIColor  whiteColor];
    [self  test1];
}
- (void)test1
{
    UIButton  *  button = [UIButton  buttonWithType:UIButtonTypeSystem];
    [button  setTitle:@"动画开始" forState:UIControlStateNormal];
    [self.view  addSubview:button];
    button.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 84).widthIs(100).heightIs(44);
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [self moveClick];
    }];
}

- (void)moveClick
{
    TwentyEightSonViewController  *  sonVc = [[TwentyEightSonViewController  alloc]initVCWithName:@"到阿斯顿发哈"];
    sonVc.address = @"觅优信息科技";
    [self.navigationController  pushViewController:sonVc animated:YES];
}


@end
