//
//  FireflyGesturePasswordView.m
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.

#import "FireflyGesturePasswordView.h"
#import "FireflyGesturePasswordButton.h"
#import "FireflyTentacleView.h"

@interface FireflyGesturePasswordView()
{
    CGPoint lineStartPoint;
    CGPoint lineEndPoint;
    NSMutableArray *buttonArray;
}

- (void)initSubViews;
- (void)forgetGeturePassword;
- (void)changeGeturePassword;

@end

@implementation FireflyGesturePasswordView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews
{
    //图像
    CGRect imageFrame = CGRectMake((self.frame.size.width - 70)/ 2 ,
                                   20,
                                   70,
                                   70);
    self.imgView = [[UIImageView alloc] initWithFrame:imageFrame];
    [self.imgView setBackgroundColor:[UIColor whiteColor]];
    [self.imgView.layer setCornerRadius:35];
    [self.imgView.layer setBorderColor:[UIColor grayColor].CGColor];
    [self.imgView.layer setBorderWidth:3];
    [self addSubview:self.imgView];
    
    //状态
    CGRect stateFrame = CGRectMake((self.frame.size.width - 280)/ 2 ,
                                   CGRectGetMaxY(imageFrame) + 10 ,
                                   280,
                                   30);
    self.state = [[UILabel alloc]initWithFrame:stateFrame];
    [self.state setTextAlignment:NSTextAlignmentCenter];
    [self.state setFont:[UIFont systemFontOfSize:14.f]];
    [self addSubview:self.state];
    
    //九个按钮
    buttonArray = [[NSMutableArray alloc]initWithCapacity:0];
    CGRect viewFrame = CGRectMake(self.frame.size.width / 2 - 160 ,
                                  CGRectGetMaxY(stateFrame) + 15,
                                  320,
                                  320);
    UIView *view = [[UIView alloc] initWithFrame:viewFrame];
    for(NSInteger i = 0; i < 9; i++)
    {
        NSInteger row  = i / 3;
        NSInteger col = i % 3;
        
        NSInteger distance = 320 / 3;
        NSInteger size = distance / 1.5;
        NSInteger margin = size / 4;
        
        CGRect buttonFrame = CGRectMake(col * distance + margin,
                                        row * distance,
                                        size,
                                        size);
        FireflyGesturePasswordButton *gesturePasswordButton = [[FireflyGesturePasswordButton alloc] initWithFrame:buttonFrame];
        
        [gesturePasswordButton setTag:i];
        [view addSubview:gesturePasswordButton];
        [buttonArray addObject:gesturePasswordButton];
    }
    [self addSubview:view];
    
    
    //忘记密码 按钮
    CGRect forgetBtnFrame = CGRectMake(30,
                                       CGRectGetMaxY(viewFrame),
                                       120,
                                       30);
    self.forgetButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.forgetButton.frame = forgetBtnFrame;
    [self.forgetButton.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
    [self.forgetButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.forgetButton setTitle:@"忘记手势密码" forState:UIControlStateNormal];
    [self.forgetButton addTarget:self action:@selector(forgetGeturePassword) forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.forgetButton];
    
    CGRect changeBtnFrame = CGRectMake(self.frame.size.width - 150,
                                       CGRectGetMaxY(viewFrame),
                                       120,
                                       30);
    self.changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.changeButton.frame = changeBtnFrame;
    [self.changeButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
    [self.changeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.changeButton setTitle:@"修改手势密码" forState:UIControlStateNormal];
    [self.changeButton addTarget:self action:@selector(changeGeturePassword) forControlEvents:UIControlEventTouchDown];
    [self addSubview:self.changeButton];
    
    self.tentacleView = [[FireflyTentacleView alloc]initWithFrame:viewFrame];
    [self.tentacleView setButtonArray:buttonArray];
    [self.tentacleView setTouchBeginDelegate:self];
    [self addSubview:self.tentacleView];
}

- (void)drawRect:(CGRect)rect
{
    //背景 颜色 渐变
    // Drawing code
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        134 / 255.0, 157 / 255.0, 147 / 255.0, 1.00,
        3 / 255.0,  3 / 255.0, 37 / 255.0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb,
     colors,
     NULL,
     sizeof(colors) / (sizeof(colors[0])*4));
    
    CGColorSpaceRelease(rgb);
    
    CGContextDrawLinearGradient(context,
                                gradient,
                                CGPointMake(0.0,0.0) ,
                                CGPointMake(0.0,self.frame.size.height),
                                kCGGradientDrawsBeforeStartLocation);
}


-(void)forgetGeturePassword
{
    [self.delegate forgetGeturePassword];
}

-(void)changeGeturePassword
{
    [self.delegate changeGeturePassword];
}


#pragma FireflyGPTouchBeginDelegate method
- (void)gestureTouchBegin
{
    [self.state setText:@""];
}

@end
