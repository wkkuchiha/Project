//
//  ThirtyViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/7/2.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "ThirtyViewController.h"
#import "CircleTimer.h"
@interface ThirtyViewController ()<CircleTimerDelegate>

@property (nonatomic,strong) CircleTimer *timeCircle;
@end
@implementation ThirtyViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"倒计时测试";
    self.view.backgroundColor = [UIColor  whiteColor];
    self.timeCircle = [[CircleTimer  alloc]initWithFrame:CGRectMake(100, 200, 100, 100)];
    [self.view addSubview:self.timeCircle];
    self.timeCircle.delegate = self;
    self.timeCircle.active = YES;
    [self updateCircleTimer];
    
    [self  addbtn];
}
- (void)addbtn
{
    UIButton  *  button = [UIButton  buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(100, 600, 80, 40);
    [button  setTitle:@"动画开始1" forState:UIControlStateNormal];
    [self.view  addSubview:button];
    [button  addTarget:self action:@selector(moveClick1) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton  *  button2 = [UIButton  buttonWithType:UIButtonTypeSystem];
    button2.frame = CGRectMake(200, 600, 80, 40);
    [button2  setTitle:@"动画开始2" forState:UIControlStateNormal];
    [self.view  addSubview:button2];
    [button2  addTarget:self action:@selector(moveClick2) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton  *  button3 = [UIButton  buttonWithType:UIButtonTypeSystem];
    button3.frame = CGRectMake(300, 600, 80, 40);
    [button3  setTitle:@"动画开始3" forState:UIControlStateNormal];
    [self.view  addSubview:button3];
    [button3  addTarget:self action:@selector(moveClick3) forControlEvents:UIControlEventTouchUpInside];
}
- (void)moveClick1
{
   [self.timeCircle start];
}
- (void)moveClick2
{
    [self.timeCircle resume];
}
- (void)moveClick3
{
     [self.timeCircle stop];
}
- (void)updateCircleTimer {
    
    self.timeCircle.totalTime =  20;
    self.timeCircle.elapsedTime = 5;
}
@end
