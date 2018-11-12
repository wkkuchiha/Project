//
//  TwentyTwoViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/4/25.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "TwentyTwoViewController.h"

@interface TwentyTwoViewController ()

@end

@implementation TwentyTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"通知的测试";
    self.view.backgroundColor =  [UIColor whiteColor];
    
    NSNotificationCenter  *  center = [NSNotificationCenter  defaultCenter];
    [center  addObserver:self selector:@selector(receiveNotice:) name:@"12345" object:nil];
    [self  test1];
}
- (void)test1
{
    for (int  i = 0; i <=8;i++ ) {
        NSLog(@"%d",i);
        if (i==5) {
            NSDictionary  *  dict = [NSDictionary  dictionaryWithObject:@"Jesse" forKey:@"name"];
            NSNotification  *  notice = [NSNotification  notificationWithName:@"12345" object:nil userInfo:dict];
            [[NSNotificationCenter  defaultCenter]postNotification:notice];
        }
    }
}
- (void)receiveNotice:(NSNotification  *)content
{
    NSLog(@"此时，我已收到通知");
    NSDictionary  *  dict = content.userInfo;
   // NSLog(@"%@",[content objectForKey:@"userInfo"]);
    NSLog(@"%@",dict.allKeys)  ;
   
}
- (void)dealloc{
    //删除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"12345" object:nil];
}


@end
