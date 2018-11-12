//
//  FifteenViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/2/27.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "FifteenViewController.h"
#import "DateScrollView.h"
#import "UIView+Extension.h"
@interface FifteenViewController ()

@end

@implementation FifteenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view  setBackgroundColor:[UIColor  whiteColor]];
    self.title = @"scrollView测试";
    [self  setUpView];
}

- (void)setUpView
{
    DateScrollView *  dateView =[[DateScrollView  alloc]initWithFrame:CGRectMake(0, 64,self.view.width, 48)];
    [self.view  addSubview:dateView];
  NSDate  *  date = [NSDate  date];
    NSMutableArray  * dateArray =[NSMutableArray  array];
    for (int  i=0; i<10; i++) {
         NSDate  * obj = [date  dateByAddingTimeInterval:i*24*60*60];
        [dateArray  addObject:obj];
    }
    NSLog(@"--%@",[dateArray objectAtIndex:3]);
   
   
    
    
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
