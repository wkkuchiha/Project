//
//  TwentySixViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/6/1.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "TwentySixViewController.h"

@interface TwentySixViewController ()
{
    UITextField  *  _tf;
}
@end

@implementation TwentySixViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor  whiteColor];
    self.title = @"正则表达式";
    [self  test1];
}

- (void)test1
{
    _tf = [[UITextField  alloc]initWithFrame:CGRectMake(100, 100, 300, 30)];
    [self.view addSubview:_tf];
    _tf.backgroundColor = [UIColor cyanColor];
    
   
    UIButton  *  button = [UIButton  buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(300, 300, 80, 40);
    [button  setTitle:@"开始" forState:UIControlStateNormal];
    [self.view  addSubview:button];
    [button  addTarget:self action:@selector(moveClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)moveClick:(UIButton  *)sender
{//检查手机号码
   // [self  checkePhone];
    //检查区号
    //[self  checkQuHAo];
    //检查规定电话
    [self  checkTell];
}
- (void)checkePhone
{
    NSString *phoneNumRegex = @"(\\+\\d+)?1[345678]\\d{9}$";
    NSPredicate *phoneNumTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", phoneNumRegex];
    NSString *  testData = _tf.text;
    BOOL  result = [phoneNumTest evaluateWithObject:testData];
    NSLog(@"%d",result);
}
- (void)checkQuHAo
{
    NSString *phoneNumRegex = @"(^0\\d{2,3}$)";
    NSPredicate *phoneNumTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", phoneNumRegex];
    NSString *  testData = _tf.text;
    BOOL  result = [phoneNumTest evaluateWithObject:testData];
    NSLog(@"000%d",result);
}

- (void)checkTell
{
    NSString *phoneNumRegex = @"\\d{3}-\\d{8}|\\d{4}-\\d{7,8}";
    NSPredicate *phoneNumTest = [NSPredicate predicateWithFormat:@"SELF MATCHES%@", phoneNumRegex];
    NSString *  testData = _tf.text;
    BOOL  result = [phoneNumTest evaluateWithObject:testData];
    NSLog(@"000%d",result);
}
@end
