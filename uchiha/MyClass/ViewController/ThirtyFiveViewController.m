//
//  ThirtyFiveViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/8/1.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "ThirtyFiveViewController.h"
#import "UIView+Extension.h"
#import "UICustomItemView.h"

@implementation ThirtyFiveViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor  grayColor];
    self.title = @"collectView使用";
    
    [self setUpCollectionView];
}
- (void)setUpCollectionView
{
    UICustomItemView *  collectionView = [[UICustomItemView  alloc]initWithFrame:CGRectMake(0, 100, self.view.width, 220)];
    [self.view addSubview:collectionView];
}
@end
