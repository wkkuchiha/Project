
//
//  FireflyUpdateGesturePasswordViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "FireflyUpdateGesturePasswordViewController.h"
#import "FireflyGesturePasswordView.h"
#import "FireflyUserDefaultsManager.h"


@interface FireflyUpdateGesturePasswordViewController ()<FireflyGPOperationDelegate>

@property (nonatomic, strong) FireflyGesturePasswordView *gesturePasswordView;
@property (nonatomic, strong) NSString *password;
@property (nonatomic, strong) NSString *previousString;

- (void)initNavBar;
- (void)initViews;
- (void)initPassword;

@end

@implementation FireflyUpdateGesturePasswordViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initViews];
}


- (void)initPassword
{
    _previousString = [NSString string];
    _password = [FireflyUserDefaultsManager loadUserDefaultDataByKey:@"FireflyGesturePassword"];
}

- (void)initViews
{
    [self initPassword];
    
    if (self.gesturePasswordView)
    {
        [self.gesturePasswordView removeFromSuperview];
        self.gesturePasswordView = nil;
    }
    
    CGRect frame = self.view.frame;
    CGRect gesturePasswordViewFrame = CGRectMake(0,CGRectGetMinY(frame), frame.size.width , frame.size.height);
    self.gesturePasswordView = [[FireflyGesturePasswordView alloc] initWithFrame:gesturePasswordViewFrame];
    self.gesturePasswordView.tentacleView.delegate = self;
    self.gesturePasswordView.tentacleView.style = updateGesturePassword;
    self.gesturePasswordView.state.text = @"请输入原手势密码";
    self.gesturePasswordView.imgView.hidden = YES;
    self.gesturePasswordView.forgetButton.hidden = YES;
    self.gesturePasswordView.changeButton.hidden = YES;
    [self.view addSubview:self.gesturePasswordView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)verifyPassword:(NSString *)result
{
    if ([result isEqualToString:_password])
    {
        [self.gesturePasswordView.state setTextColor:[UIColor colorWithRed:2/255.f green:174/255.f blue:240/255.f alpha:1]];
        [self.gesturePasswordView.state setText:@"输入正确"];
        //根据结果来刷新页面
        [self.gesturePasswordView.tentacleView refreshViews:YES];
        
        //初始化 设置密码 页面
        [self initSetPasswordView];
        
    }
    else
    {
        [_gesturePasswordView.state setTextColor:[UIColor redColor]];
        [_gesturePasswordView.state setText:@"密码错误,请重新输入"];
        //根据结果来刷新页面
        [self.gesturePasswordView.tentacleView refreshViews:NO];
        
    }
    
    
}


- (void)initSetPasswordView
{
    self.gesturePasswordView.tentacleView.style = setGesturePassword;
    self.gesturePasswordView.state.text = @"绘制手势密码";
    self.gesturePasswordView.imgView.hidden = YES;
    self.gesturePasswordView.forgetButton.hidden = YES;
    self.gesturePasswordView.changeButton.hidden = YES;
}

- (void)resetPassword:(NSString *)result
{
    if ([_previousString isEqualToString:@""])
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


#pragma FireflyGPOperationDelegate method

- (void)operationWithStyle:(FireflyGesturePasswordOperateType) style result:(NSString *)result
{
    switch (style)
    {
        case updateGesturePassword:
            [self verifyPassword:result];
            break;
        case setGesturePassword:
            [self resetPassword:result];
            break;
        default:
            break;
    }
    
}

@end
