//
//  RACDemoDetailViewController.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 详情页面主要是演示跨页面值传递
 注意命名规则，一个controller和他对应的viewmodel最好是controller和model的差别
 */
@interface RACDemoDetailViewController : UIViewController
- (instancetype)initViewModel:(id)viewModel;
@end
