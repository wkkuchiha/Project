//
//  EightViewController.m
//  控件系数-03
//
//  Created by 张玺 on 15/12/17.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "EightViewController.h"
#import "Masonry.h"

@interface EightViewController ()

@property (nonatomic,strong) UIView  *  supView;

@property (nonatomic,strong) UITextField  * filed;

@property (nonatomic,strong) UIImageView  * imageView;

@end


@implementation EightViewController

- (void)viewDidLoad
{
    
    [self.view  setNeedsUpdateConstraints];
}


- (void)updateViewConstraints
{
    
    [super  updateViewConstraints];
    
   [self.supView  mas_makeConstraints:^(MASConstraintMaker *make) {
       make.left.mas_equalTo(self.view).mas_equalTo(10);
       make.right.mas_equalTo(self.view).mas_equalTo(-10);
       make.top.mas_equalTo(64);
       make.height.mas_equalTo(300);
   }];
    
    [self.filed  mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self.supView).offset(15);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(50);
    }];

}

- (UIView  *)supView
{
    if (!_supView) {
        _supView = [[UIView alloc]init];
        [self.view  addSubview:_supView];
        _supView.backgroundColor = [UIColor  blueColor];
        
    }
    return _supView;
}

- (UITextField *)filed
{
    if (!_filed) {
        _filed = [[UITextField  alloc]init];
        _filed.placeholder = @"输入名字";
        _filed.backgroundColor = [UIColor orangeColor];
        [self.supView  addSubview:_filed];
    }
    return _filed;
}

@end
