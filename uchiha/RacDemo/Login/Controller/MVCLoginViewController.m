//
//  MVCLoginViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "MVCLoginViewController.h"
#import "RacDemoLoginView.h"
@interface MVCLoginViewController ()<UITextFieldDelegate>
@property(nonatomic,assign)BOOL isUsernameValid;
@property(nonatomic,assign)BOOL isPasswordValid;
@property(nonatomic,strong)RacDemoLoginView *loginView;
@end

@implementation MVCLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    self.title = @"MVC Login";
   
    _loginView = [[RacDemoLoginView alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:_loginView];
    _loginView.userInteractionEnabled = YES;
    
    [_loginView.username addTarget:self action:@selector(clickUsername) forControlEvents:UIControlEventValueChanged];
    _loginView.username.delegate = self;
    _loginView.username.enabled = YES;
    
    [_loginView.password addTarget:self action:@selector(clickPasswprd) forControlEvents:UIControlEventValueChanged];
    _loginView.password.delegate = self;
    
    [_loginView.loginBtn addTarget:self action:@selector(clickLogin) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)clickLogin {
    [self.view endEditing:YES];
    _loginView.loginBtn.enabled = NO;
    _loginView.failureLabel.hidden = YES;
    [self loginWithUsername:_loginView.username.text password:_loginView.password.text complete:^(BOOL success) {
        _loginView.loginBtn.enabled = YES;
        _loginView.failureLabel.hidden = success;
        if (success) {
            [self gotoLoginVC];
        }
    }];
}

- (void)gotoLoginVC {
    
}

- (void)clickUsername {

    self.isUsernameValid = [self isValidUsername:_loginView.username.text];
}

- (void)clickPasswprd {
    self.isPasswordValid = [self isValidPassword:_loginView.password.text];
}

- (void)updateUI {
    _loginView.username.backgroundColor = self.isUsernameValid ? [UIColor yellowColor] : [UIColor grayColor];
    _loginView.password.backgroundColor = self.isPasswordValid ? [UIColor yellowColor] : [UIColor grayColor];
    _loginView.loginBtn.enabled = _isUsernameValid && _isPasswordValid;
}

- (void)loginWithUsername:(NSString *)username password:(NSString *)password complete:(void (^)(BOOL success))loginResult {
    double delayInSeconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        BOOL success = [username isEqualToString:@"username"] && [password isEqualToString:@"password"];
        loginResult(success);
    });
}

// 这两个判断都属于逻辑范畴，和UI无关
- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 6;
}

- (BOOL)isValidPassword:(NSString *)password {
    return password.length > 6;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // 此处编写弹出日期选择器的代码。
    NSLog(@"hahah");
    return NO;
}
@end
