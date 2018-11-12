//
//  ThirtyThreeViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/7/20.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "ThirtyThreeViewController.h"

@implementation ThirtyThreeViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  whiteColor];
    self.title = @"数组的深浅拷贝";
    
    [self  test1];
}
//
- (void)test1
{
    NSArray  *  orginArray = [NSArray  arrayWithObjects:@"小红",@"小明",@"小李",@"小张",@"佳滨" ,nil];
    NSArray  *  resultArray = [NSArray  arrayWithArray:orginArray];
    NSArray  *  tempArray = [orginArray  copy];
    NSArray  *  desArray = [orginArray  mutableCopy];
    NSArray  *  toArray = [NSArray  array];
    toArray = orginArray;
    NSLog(@"orginArray:%@",orginArray);
     NSLog(@"resultArray:%@",resultArray);
     NSLog(@"tempArray:%@",tempArray);
     NSLog(@"desArray:%@",desArray);
      NSLog(@"toArray:%@",toArray);
}
@end
