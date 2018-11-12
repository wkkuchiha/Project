//
//  EightTeenController.m
//  控件系数-03
//
//  Created by 张玺 on 16/3/16.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "EightTeenController.h"
#import "ZCDataChache.h"
@interface EightTeenController ()

@end

@implementation EightTeenController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor  whiteColor];
    self.title = @"单列封装";
    
    [self  test1];
}
- (void)test1
{
    ZCDataChache  * dataCache = [ZCDataChache  sharedInstanceZCDataChache];
    [dataCache eat];
}


@end
