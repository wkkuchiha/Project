//
//  RacDemoLoginView.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RacDemoLoginView.h"
#import "BasicControlsUtil.h"
#import "CommonMacro.h"
#import "UIView+SDAutoLayout.h"
@implementation RacDemoLoginView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _username = [BasicControlsUtil customTextField:nil titleFont:MediumFont];
    
    _username.placeholder = @"username";
    [self addSubview:_username];
     _username.sd_layout.centerXEqualToView(self).topSpaceToView(self, 100).widthIs(200).heightIs(44);
    
    _password = [BasicControlsUtil customTextField:nil titleFont:MediumFont];
    _password.placeholder = @"password";
    [self addSubview:_password];
    _password.sd_layout.centerXEqualToView(self).topSpaceToView(_username, 10).widthIs(200).heightIs(44);
    
    _loginBtn = [BasicControlsUtil customBtnTextColor:nil backGroundColor:nil titleFont:MediumFont image:nil];
    [self addSubview:_loginBtn];
    [_loginBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    _loginBtn.sd_layout.centerXEqualToView(self).topSpaceToView(_password, 20).widthIs(200).heightIs(44);
    [_loginBtn setTitle:@"开始登陆" forState:UIControlStateNormal];
    
    _failureLabel = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentCenter backGroundColor:[UIColor yellowColor] tintColor:[UIColor redColor] textFont:MediumFont];
    [self addSubview:_failureLabel];
    _failureLabel.sd_layout.centerXEqualToView(self).topSpaceToView(_loginBtn, 20).widthIs(200).heightIs(44);
    
    
}
@end
