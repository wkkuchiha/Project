//
//  RacPrimaryView.m
//  uchiha
//
//  Created by 王鹏 on 2018/7/22.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RacPrimaryView.h"
#import "BasicControlsUtil.h"
#import "CommonMacro.h"
#import "SDAutoLayout.h"
#import "Masonry.h"
@implementation RacPrimaryView

- (instancetype)init {
    if (self = [super init]) {
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:_redBtn];
    [self addSubview:_greenBtn];
    [self addSubview:_yellowBtn];
    [self addSubview:_nameTF];
    [self addSubview:_scrollView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.redBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(100);
        make.height.equalTo(@40);
        make.width.equalTo(@80);
    }];
    
    [self.nameTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.redBtn.mas_bottom).offset(10);
        make.left.right.height.equalTo(self.redBtn);
    }];
    
    [self.greenBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.redBtn.mas_right).offset(20);
        make.top.equalTo(self.redBtn.mas_top);
        make.height.equalTo(@40);
        make.width.equalTo(@80);
    }];
    
    [self.yellowBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.greenBtn.mas_left);
        make.top.equalTo(self.redBtn.mas_bottom).offset(10);
        make.height.equalTo(@40);
        make.width.equalTo(@80);
    }];
    
}

- (UIButton *)redBtn {
    if (!_redBtn) {
        _redBtn = [BasicControlsUtil customBtnTextColor:nil backGroundColor:[UIColor redColor] titleFont:SmallFont image:nil];
        [_redBtn setTitle:@"测试一" forState:UIControlStateNormal];
    }
    return _redBtn;
}

- (UIButton *)greenBtn {
    if (!_greenBtn) {
        _greenBtn = [BasicControlsUtil customBtnTextColor:nil backGroundColor:[UIColor greenColor] titleFont:SmallFont image:nil];
        [_greenBtn setTitle:@"测试二" forState:UIControlStateNormal];
    }
    return _greenBtn;
}

- (UIButton *)yellowBtn {
    if (!_yellowBtn) {
        _yellowBtn = [BasicControlsUtil customBtnTextColor:nil backGroundColor:[UIColor yellowColor] titleFont:SmallFont image:nil];
        [_yellowBtn setTitle:@"测试三" forState:UIControlStateNormal];
    }
    return _yellowBtn;
}

- (UITextField *)nameTF {
    if (_nameTF) {
        _nameTF = [BasicControlsUtil customTextField:nil titleFont:SmallFont];
    }
    return _nameTF;
}

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(10, 150, 100, 200)];
        _scrollView.contentSize = CGSizeMake(200, 700);
        _scrollView.backgroundColor = [UIColor greenColor];
    }
    return _scrollView;
}
@end

