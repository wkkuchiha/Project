//
//  TwentyEightSonViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/6/20.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "TwentyEightSonViewController.h"

@interface TwentyEightSonViewController ()
{
    NSString  *  _myName;
}
@end

@implementation TwentyEightSonViewController
- (instancetype)initVCWithName:(NSString  *)name
{
    if (self = [super init]) {
        _myName = name;
        NSLog(@"名字：%@",name);
        NSLog(@"地址：%@",_address);
        NSLog(@"地址2：%@",self.address);
         NSLog(@"name2：%@",_myName);
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"传值练习子VIew";
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"地址3：%@",_address);
    NSLog(@"地址4：%@",self.address);
     NSLog(@"name2：%@",_myName);
}



@end
