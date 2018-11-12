//
//  ThirteenViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/2/16.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "ThirteenViewController.h"

@interface ThirteenViewController ()

@end

@implementation ThirteenViewController

- (void)viewDidAppear:(BOOL)animated
{
    [self  test1];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"简单动画";
    self.view.backgroundColor = [UIColor  whiteColor];
}
//最基本的登录动画
- (void)test1
{
    CGFloat screenWidth  = self.view.frame.size.width;
    
    UITextField * accounterFD = [[UITextField  alloc]initWithFrame:CGRectMake(screenWidth/2-60, 200, 120, 40)];
    [self.view  addSubview:accounterFD];
    accounterFD.backgroundColor = [UIColor cyanColor];
    
    UITextField * passwordFD = [[UITextField  alloc]initWithFrame:CGRectMake(accounterFD.frame.origin.x, 260, 120, 40)];
    [self.view  addSubview:passwordFD];
    passwordFD.backgroundColor = [UIColor  orangeColor];
    
    
    UIButton  *  loginBtn = [UIButton  buttonWithType:UIButtonTypeSystem];
    loginBtn.frame = CGRectMake(screenWidth/2-40, 320, 80, 40);
    [loginBtn  setTitle:@"LOGIN" forState:UIControlStateNormal];
    loginBtn.backgroundColor = [UIColor  blueColor];
    [self.view  addSubview:loginBtn];
    loginBtn.alpha = 0.0f;
    
    
    CGPoint accountCenter = accounterFD.center;
    CGPoint psdCenter = passwordFD.center;
    accountCenter.x -= 400;
    psdCenter.x -= 400;
    accounterFD.center = accountCenter;
    passwordFD.center = psdCenter;
    
    CGPoint loginCenter = loginBtn.center;
    loginCenter.y +=400;
    loginBtn.center = loginCenter;
    
    
    accountCenter.x += 400;
    psdCenter.x += 400;
    loginCenter.y -=400;
    
    [UIView  animateWithDuration:0.5 animations:^{
        accounterFD.center = accountCenter;
              passwordFD.center = psdCenter;
    } completion:^(BOOL finished) {
        [UIView  animateWithDuration:0.2 delay:0 usingSpringWithDamping:0 initialSpringVelocity:0 options:UIViewAnimationOptionCurveLinear animations:^{
            loginBtn.center = loginCenter;
            loginBtn.alpha = 1.0f;
        } completion:nil];
    }];
    
}


@end
