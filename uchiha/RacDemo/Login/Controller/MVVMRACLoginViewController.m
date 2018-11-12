//
//  MVVMRACLoginViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "MVVMRACLoginViewController.h"
#import "RacDemoLoginView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import <ReactiveCocoa/RACEXTScope.h>
#import "RACDemoLoginViewModel.h"
#import "RACDemoSearchViewController.h"
@interface MVVMRACLoginViewController ()<UITextFieldDelegate>
@property(nonatomic,assign)BOOL isUsernameValid;
@property(nonatomic,assign)BOOL isPasswordValid;
@property(nonatomic,strong)RacDemoLoginView *loginView;
@property(nonatomic,strong)RACDemoLoginViewModel *viewModel;

@end

@implementation MVVMRACLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    self.title = @"MVVM RAC Login";
    self.viewModel = [[RACDemoLoginViewModel alloc]init];
    self.loginView = [[RacDemoLoginView alloc]initWithFrame:self.view.bounds];
    
    RAC(self.loginView.username,background) = [self.viewModel.usernameSignal map:^id(NSNumber *usernameValid) {
        return [usernameValid boolValue] ? [UIColor yellowColor] :[UIColor grayColor];
    }];
    
    RAC(self.loginView.password,background) = [self.viewModel.passwordSignal map:^id(NSNumber *passwordValid) {
        return [passwordValid boolValue] ? [UIColor yellowColor] : [UIColor grayColor];
    }];
    
    // 注意：得到结果，是否正在执行，发生错误 是用三个信号来分别表示，虽然麻烦些，但结构相当清晰
    @weakify(self);
    [self.viewModel.loginCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        BOOL success = [x boolValue];
        self.loginView.loginBtn.enabled = success;
        self.loginView.failureLabel.hidden = success;
        if (success) {
            // 跳转到登陆页面
            [self gotoLoginSuccessVC];
        }
    }];
    [[self.viewModel.loginCommand.executing skip:1]subscribeNext:^(id x) {
        if ([x boolValue] == YES) {
            NSLog(@"正在执行登陆操作，请稍后");
        } else {
            NSLog(@"执行完成");
        }
    }];
    [self.viewModel.connectionErrors subscribeNext:^(id x) {
        NSLog(@"登陆错误了 : %@",x);
    }];
    
    // 通常两种方法使用command
    // 一种方法是可以将button的rac_command属性赋值，此时能自动控制enable属性，按钮点击时就执行了
    //    self.loginButton.rac_command = self.viewModel.loginCommand;
    // 另一种方法是直接调用execute:方法，类似[loginCommand execute:@2]，此时还能传进去一个自己可控制的值
    RAC(self.loginView.loginBtn,enabled) = self.viewModel.loginEnabelSignal;
    [[[self.loginView.loginBtn rac_signalForControlEvents:UIControlEventTouchUpInside]doNext:^(id x) {
        @strongify(self);
        [self.view endEditing:YES];
        self.loginView.loginBtn.enabled = YES;
        self.loginView.failureLabel.hidden = YES;
    }] subscribeNext:^(id x) {
        @strongify(self);
        [self.viewModel.loginCommand execute:@2];
    }];
}

- (void)gotoLoginSuccessVC {
    RACDemoSearchViewController * view = [[RACDemoSearchViewController alloc]init];
    [self.navigationController pushViewController:view animated:YES];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}
@end
