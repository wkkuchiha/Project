//
//  SevenGrannChildVC.m
//  控件系数-03
//
//  Created by 张玺 on 16/4/11.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "SevenGrannChildVC.h"

@interface SevenGrannChildVC ()

@end

@implementation SevenGrannChildVC
- (void)viewWillAppear:(BOOL)animated
{
    [super  viewWillAppear:animated];
    
    [self.navigationController  setNavigationBarHidden:NO animated:animated];
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super  viewWillDisappear:animated];
    self.isPop = YES;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"第三页";
    self.isPop = NO;
    self.view.backgroundColor = [UIColor  orangeColor];
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
