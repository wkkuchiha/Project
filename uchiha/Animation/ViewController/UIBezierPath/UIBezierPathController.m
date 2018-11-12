//
//  UIBezierPathController.m
//  uchiha
//
//  Created by uchiha on 2018/7/11.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "UIBezierPathController.h"
#import "UIBezierPathCustomView.h"
@interface UIBezierPathController ()

@end

@implementation UIBezierPathController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setuiView];
}

- (void)setuiView {
    self.view.backgroundColor = [UIColor whiteColor];
    UIBezierPathCustomView * view = [[UIBezierPathCustomView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height-64)];
    [self.view addSubview:view];
    view.backgroundColor = [UIColor whiteColor];
}
@end
