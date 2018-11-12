//
//  TwentyNineViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/7/1.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "TwentyNineViewController.h"
#import "UIButton+DelayControl.h"
@interface TwentyNineViewController ()

@end

@implementation TwentyNineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  whiteColor];
    self.title = @"控制点击时间间隔";
    [self  test1];
}
//测试1
- (void)test1
{
    UIButton  *  button = [UIButton  buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(300, 600, 80, 40);
    [self.view addSubview:button];
  //  button.delayTimeInterval = 4;
    [button  setTitle:@"动画开始" forState:UIControlStateNormal];
    [self.view  addSubview:button];
    [button  addTarget:self action:@selector(moveClick) forControlEvents:UIControlEventTouchUpInside];
//    UIControl  *  trol = [[UIControl  alloc]initWithFrame:CGRectMake(60, 200, 50, 30)];
//    [self.view  addSubview:trol];
//    trol.backgroundColor = [UIColor cyanColor];
//    [trol   addTarget:self action:@selector(moveClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)moveClick
{
   NSLog(@"%s",__func__);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
