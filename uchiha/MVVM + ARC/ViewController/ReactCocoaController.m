//
//  ReactCocoaController.m
//  uchiha
//
//  Created by uchiha on 2017/8/31.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "ReactCocoaController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACLoginViewModel.h"
#import "RACSearchViewController.h"

@interface ReactCocoaController ()
@property(nonatomic,strong)UITextField *usernameTextField;
@property(nonatomic,strong)UITextField *passwordTextField;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UIButton *errorBtn;
@property(nonatomic,strong)RACLoginViewModel *viewModel;

@end

@implementation ReactCocoaController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"响应式函数式编程";
    self.view.backgroundColor = [UIColor colorWithRed:245.0f/255 green:247.0f/255 blue:251.0f/255 alpha:1.0];
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self initViews];
}

- (void)initViews {
    _usernameTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 74, iphoneScreenWidth - 20, 44)];
    [self.view addSubview:_usernameTextField];
    
    _passwordTextField = [[UITextField alloc]init];
    [self.view addSubview:_passwordTextField];
    _passwordTextField.sd_layout.leftEqualToView(_usernameTextField).rightEqualToView(_usernameTextField).topSpaceToView(_usernameTextField, 15).heightIs(44);
//    [_passwordTextField.rac_textSignal subscribeNext:^(id x) {
//        NSLog(@"--------用户密码:%@",x);
//    }];
    
    _loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_loginBtn];
    _loginBtn.sd_layout.topSpaceToView(_passwordTextField, 15).centerXEqualToView(self.view).widthIs(88).heightIs(34);
    [_loginBtn setTitle:@"登  录" forState:UIControlStateNormal];
    [_loginBtn setBackgroundColor:[UIColor grayColor]];
    _loginBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        NSLog(@"用户登录");
    }];
    
    // 应用RAC的宏定义
    _viewModel = [[RACLoginViewModel alloc]init];
    RAC(_viewModel,username) = self.usernameTextField.rac_textSignal;
    RAC(_viewModel,password) = self.passwordTextField.rac_textSignal;
    RAC(_usernameTextField,backgroundColor) = [_viewModel.usernameSignal map:^id(id value) {
        return [value boolValue]?[UIColor whiteColor]:[UIColor colorWithRed:235/255.0f green:244/255.0f blue:251/255.0f alpha:1.0f];
    }];
    RAC(_passwordTextField,backgroundColor) = [_viewModel.passwordSignal map:^id(id value) {
        return [value boolValue]?[UIColor whiteColor]:[UIColor colorWithRed:235/255.0f green:244/255.0f blue:251/255.0f alpha:1.0f];
    }];
    
    // 监听登录产生的数据
    @weakify(self)
    [_viewModel.loginCommon.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        BOOL success = [x boolValue];
        _loginBtn.enabled = YES;
        _errorBtn.hidden = success;
        if (success) {
            [self gotoLoginSuccessView];
        }
    }];
    
    
    // 监听登录状态
    [[_viewModel.loginCommon.executing skip:1] subscribeNext:^(id x) {
        if ([x boolValue]) {
            NSLog(@"正在登录");
        } else {
            NSLog(@"登录结束");
        }
    }];

     
    [_viewModel.connectionErrors subscribeNext:^(id x) {
        NSLog(@"登录错误，提示信息如下 : %@",x);
    }];
    
    RAC(_loginBtn,enabled) = _viewModel.loginEnableSignal;
    [[[_loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]doNext:^(id x) {
        @strongify(self);
        [self.view endEditing:YES];
        _loginBtn.enabled = NO;
        _errorBtn.hidden = YES;
    }] subscribeNext:^(id x) {
        @strongify(self);
        [_viewModel.loginCommon execute:@2];
    }];
}

- (void)gotoLoginSuccessView {
    RACSearchViewController *searchView = [RACSearchViewController new];
    [self.navigationController pushViewController:searchView animated:NO];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
