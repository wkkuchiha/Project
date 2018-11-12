//
//  SevenViewController.m
//  控件系数-03
//
//  Created by 张玺 on 15/12/15.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "SevenViewController.h"
#import "SevenChrildViewController.h"
@implementation SevenViewController
- (void)viewDidLoad
{
  self.title = @"第一页";
    self.view.backgroundColor = [UIColor  whiteColor];
    [self setUpView];
    
}
- (void)setUpView
{
    UIButton  *  button = [UIButton  buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake( 100, 100, 180, 30);
    [button  setTitle:@"跳到第二页" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor  blueColor] forState:UIControlStateNormal];
   // button.backgroundColor = [UIColor  blueColor];
    [button  addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:button];
}
- (void)click
{
    SevenChrildViewController  * chrildVc = [[SevenChrildViewController alloc]init];
    [self.navigationController  pushViewController:chrildVc animated:YES];
}
@end
