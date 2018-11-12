//
//  LoadingStateView.m
//  uchiha
//
//  Created by uchiha on 2017/9/14.
//  Copyright © 2017年 creditease. All rights reserved.
//


#import "LoadingStateView.h"
#import "OneLoadingAnimationView.h"
#import "CommonMacro.h"
#import "NSString+Size.h"

typedef void(^ReloadHandle)();

@interface LoadingStateView ()

@property()int delayTime;
@property(strong)UIColor *textColor;
@property(copy)NSString *telString;
@property(strong)UILabel *errorLabel;
@property(strong)UILabel *tipLabel;
@property()BOOL hasTouchMoved;
@property(strong)UIControl *servicePhoneView;
@property(strong)OneLoadingAnimationView *loadingView;
@property(strong)ReloadHandle reloadHandle;

@end

@implementation LoadingStateView

- (instancetype)initWithFrame:(CGRect)frame isLightStyle:(BOOL)isLightStyle BusinessType:(BusinessType)businessType {
    
    if (self = [super initWithFrame:frame]) {
        _isLightStyle = isLightStyle;
        _delayTime = 1;
        switch (businessType) {
            case BUSINESS_MUSIC_PLAYER:
                _textColor = BlueColor;
                break;
            default:
                _textColor = BlueColor;
                break;
        }
        [self initViews];
        [self toLoadingState];
    }
    return self;
}

- (void)initViews {
    _loadingView = [[OneLoadingAnimationView alloc] initStyle:LargeStyle];
    if (_isLightStyle) {
        _loadingView.normalColor = WhiteColor;
    } else {
        _loadingView.normalColor = DarkGrayColor;
    }
    [_loadingView setCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2-56)];
    [self addSubview:_loadingView];
    
    _errorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, UIControlYLength(_loadingView)+10, UIViewWidth(self), 20)];
    _errorLabel.font = MediumFont;
    _errorLabel.backgroundColor = [UIColor clearColor];
    _errorLabel.textAlignment = NSTextAlignmentCenter;
    
    if (_isLightStyle) {
        _errorLabel.textColor = [UIColor whiteColor];
    } else {
        _errorLabel.textColor = DarkGrayColor;
    }
    _errorLabel.layer.opacity = 0;
    [self addSubview:_errorLabel];
    
    _tipLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, UIControlYLength(_errorLabel) + 5, 180, 32)];
    _tipLabel.textColor = _textColor;
    _tipLabel.font = BigFont;
    _tipLabel.textAlignment = NSTextAlignmentCenter;
    _tipLabel.text = @"点击重试";
    _tipLabel.layer.opacity = 0;
    [self addSubview:_tipLabel];
    
    _servicePhoneView = [[UIControl alloc] initWithFrame:CGRectMake(0, UIControlYLength(_tipLabel) + 5, 180, 60)];
    _servicePhoneView.center = CGPointMake(self.frame.size.width/2, UIControlYLength(_tipLabel) + 30);
    _servicePhoneView.backgroundColor = [UIColor clearColor];
    [_servicePhoneView addTarget:self action:@selector(showCallServiceView) forControlEvents:UIControlEventTouchUpInside];
    _servicePhoneView.layer.opacity = 0;
    [self addSubview:_servicePhoneView];
    
    UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(0, 9.8, UIViewWidth(_servicePhoneView)/2 - 20, 0.5)];
    leftLine.backgroundColor = GrayColor;
    [_servicePhoneView addSubview:leftLine];
    
    UILabel *midView = [[UILabel alloc] initWithFrame:CGRectMake(UIControlXLength(leftLine), 0, 40, 20)];
    midView.text = @"或";
    midView.textColor = GrayColor;
    midView.font = [UIFont systemFontOfSize:14];
    midView.textAlignment = NSTextAlignmentCenter;
    [_servicePhoneView addSubview:midView];
    
    UIView *rightLine = [[UIView alloc] initWithFrame:CGRectMake(UIViewWidth(_servicePhoneView)/2 + 20, 9.8, UIViewWidth(_servicePhoneView)/2 - 20, 0.5)];
    rightLine.backgroundColor = GrayColor;
    [_servicePhoneView addSubview:rightLine];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _hasTouchMoved = NO;
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    _hasTouchMoved = YES;
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if(!_hasTouchMoved && _reloadHandle && _loadingView.state >= 2){
        _delayTime = 1.5;
        [self hideFailedMsg];
        [self toLoadingState];
        _reloadHandle();
    }
}

- (void)hideFailedMsg {
    [UIView animateWithDuration:0.1 animations:^{
        _errorLabel.layer.opacity = 0;
        _tipLabel.layer.opacity = 0;
        _servicePhoneView.layer.opacity = 0;
    }];
}

- (void)toLoadingState {
    [_loadingView startAnimation];
}

- (void)toEmptyState:(NSString *)emptyMsg {
    dispatch_time_t poptime = dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2);
    dispatch_after(poptime, dispatch_get_main_queue(), ^{
        [_loadingView  toEmptyViewState];
        
    });
}

- (void)showFailedViewWithCode:(NSInteger)code errorMsg:(NSString *)msg {
    CGFloat height = [msg textSizeWithFont:_errorLabel.font constrainedToSize:CGSizeMake(_errorLabel.frame.size.width, 0)].height + 10;
    _errorLabel.frame = CGRectMake(_errorLabel.frame.origin.x, _errorLabel.frame.origin.y, _errorLabel.frame.size.width, height);
    _tipLabel.frame = CGRectMake(_errorLabel.frame.origin.x, UIControlYLength(_errorLabel) + 8, _errorLabel.frame.size.width, 32);
    _servicePhoneView.center = CGPointMake(self.frame.size.width/2, UIControlYLength(_tipLabel) + 38);
    [self showFailedMsgWithCode:code];
    _delayTime = 1;
}

- (void)showFailedMsgWithCode:(NSInteger)code {
    [UIView animateWithDuration:1 animations:^{
        _errorLabel.layer.opacity = 1;
        if (code != -1) {
            _tipLabel.layer.opacity = 1;
            _servicePhoneView.layer.opacity = 1;
        }
    }];
}

- (void)removeSelf {
    if (self.superview) {
        [self removeFromSuperview];
    }
}
@end

