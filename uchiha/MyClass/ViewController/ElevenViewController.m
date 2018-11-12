//
//  ElevenViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/1/13.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "ElevenViewController.h"

@interface ElevenViewController ()

@end

@implementation ElevenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"编解码";
    self.view.backgroundColor = [UIColor  orangeColor];
    [self  test1];
}

- (void)test1
{
  NSString  *  str1= @"https://www.cloudsafe.co+m/文件夹";
    NSString  * str2=[str1 stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString  *  str3=[str1  stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * str4= [str2  stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"\n11::%@\n22::%@\n33::%@\n44%@",str1,str2,str3,str4);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
