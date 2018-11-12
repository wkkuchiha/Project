//
//  FireflyGesturePasswordViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "FireflyGesturePasswordViewController.h"
#import "NSString+Adtion.h"
#import "FireflyGesturePasswordView.h"
#import "FireflyUpdateGesturePasswordViewController.h"
#import "FireflyUserDefaultsManager.h"


@interface FireflyGesturePasswordViewController ()<FireflyGPOperationDelegate,GesturePasswordDelegate>

@property (nonatomic, strong) NSString *previousString;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) FireflyGesturePasswordView *gesturePasswordView;

- (void)initNavBar;
- (void)initViews;
- (void)initPassword;
- (void)initResetView;
- (void)initVerifyView;
- (void)clearGesturePassword;

@end

@implementation FireflyGesturePasswordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)viewWillAppear:(BOOL)animated
{
    [self initPassword];
    [self initViews];
    [super viewWillAppear:animated];
}


- (void)initPassword
{
    _previousString = [NSString string];
    _password = [FireflyUserDefaultsManager loadUserDefaultDataByKey:@"[self initViews];"];
}

- (void)initViews
{
    CGRect gesturePasswordViewFrame = CGRectMake(0,64, iphoneScreenWidth , iphoneScreenHeight );
    
    if (self.gesturePasswordView)
    {
        [self.gesturePasswordView removeFromSuperview];
        self.gesturePasswordView = nil;
    }
    self.gesturePasswordView = [[FireflyGesturePasswordView alloc] initWithFrame:gesturePasswordViewFrame];
    
    if ([NSString strNilOrEmpty:_password])
    {
        [self initResetView];
    }
    else
    {
        [self initVerifyView];
    }
    
}

//重置手势密码
- (void)initResetView
{
    self.gesturePasswordView.tentacleView.delegate = self;
    self.gesturePasswordView.tentacleView.style = setGesturePassword;
    self.gesturePasswordView.state.text = @"设置密码";
    self.gesturePasswordView.imgView.hidden = YES;
    self.gesturePasswordView.forgetButton.hidden = YES;
    self.gesturePasswordView.changeButton.hidden = YES;
    [self.view addSubview:self.gesturePasswordView];
}

//验证手势密码
- (void)initVerifyView
{
    self.gesturePasswordView.tentacleView.delegate = self;
    self.gesturePasswordView.tentacleView.style = verifyGesturePassword;
    self.gesturePasswordView.delegate = self;
    [self.view addSubview:self.gesturePasswordView];
}

//清空记录
- (void)clearGesturePassword
{
    [FireflyUserDefaultsManager deleteUserDefaultDataByKey:@"[self initViews];"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma GesturePasswordDelegate method
//忘记手势密码
- (void)forgetGeturePassword
{
    [self clearGesturePassword];
    [self initViews];
}

//修改手势密码
- (void)changeGeturePassword
{
    FireflyUpdateGesturePasswordViewController *updateController = [[FireflyUpdateGesturePasswordViewController alloc]init];
    [self.navigationController pushViewController:updateController animated:YES];
}


#pragma FireflyGPOperationDelegate method
- (void)operationWithStyle:(FireflyGesturePasswordOperateType) style result:(NSString *)result
{
    switch (style)
    {
        case setGesturePassword:
            [self resetPassword:result];
            break;
        case verifyGesturePassword:
            [self verifyPassword:result];
            break;
        default:
            break;
    }
    
}

- (void)resetPassword:(NSString *)result
{
    if ([NSString strNilOrEmpty:_previousString])
    {
        _previousString = result;
        [self.gesturePasswordView.tentacleView enterArgin];
        [self.gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
        [self.gesturePasswordView.state setText:@"请再次绘制手势密码"];
    }
    else
    {
        if ([result isEqualToString:_previousString])
        {
            //保存手势密码
            [FireflyUserDefaultsManager saveUserDefaultsData:result forKey:@"FireflyGesturePassword"];
            [self.gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
            [self.gesturePasswordView.state setText:@"已保存手势密码"];
            //根据结果来刷新页面
            [self.gesturePasswordView.tentacleView refreshViews:YES];
            
            [self initViews];
        }
        else
        {
            _previousString = @"";
            [self.gesturePasswordView.state setTextColor:[UIColor redColor]];
            [self.gesturePasswordView.state setText:@"两次密码不一致，请重新输入"];
            //根据结果来刷新页面
            [self.gesturePasswordView.tentacleView refreshViews:NO];
        }
    }
}

- (void)verifyPassword:(NSString *)result
{
    if ([result isEqualToString:_password])
    {
        [self.gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
        [self.gesturePasswordView.state setText:@"输入正确"];
        //根据结果来刷新页面
        [self.gesturePasswordView.tentacleView refreshViews:YES];
        
    }
    else
    {
        [_gesturePasswordView.state setTextColor:[UIColor redColor]];
        [_gesturePasswordView.state setText:@"手势密码错误"];
        //根据结果来刷新页面
        [self.gesturePasswordView.tentacleView refreshViews:NO];
    }
}



@end
