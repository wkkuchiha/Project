//
//  BaseUIViewController.m
//  uchiha
//
//  Created by uchiha on 2017/9/14.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "BaseUIViewController.h"

@interface BaseUIViewController ()

@end

@implementation BaseUIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)addLoadingStateViewWithStyle:(IndicatorStyle)style BusinessType:(BusinessType)businessType {
    if (_loadingView && _loadingView.superview) {
        [_loadingView removeSelf];
        _loadingView = nil;
    }
    BOOL isLightStyle = YES;
    if (style == GrayStyle) {
        isLightStyle = NO;
    }
    if (!_loadingView && _loadingView.isLightStyle != isLightStyle) {
        _loadingView = [[LoadingStateView alloc]initWithFrame:self.view.frame isLightStyle:YES BusinessType:businessType];
    }
    [_loadingView toLoadingState];
    [self.view addSubview:_loadingView];
    [self.view bringSubviewToFront:_loadingView];
}

- (void)addLoadingStateViewWithStyle:(IndicatorStyle)style frame:(CGRect)frame BusinessType:(BusinessType)businessType {
    if (_loadingView && _loadingView.superview) {
        [_loadingView removeSelf];
        _loadingView = nil;
    }
    BOOL isLightStyle = YES;
    if (style == GrayStyle) {
        isLightStyle = NO;
    }
    if (!_loadingView && _loadingView.isLightStyle != isLightStyle) {
        _loadingView = [[LoadingStateView alloc]initWithFrame:frame isLightStyle:YES BusinessType:businessType];
    }
    [_loadingView toLoadingState];
    [self.view addSubview:_loadingView];
    [self.view bringSubviewToFront:_loadingView];
}

- (void)removeLoadingStateView {
    if (_loadingView) {
        [_loadingView removeFromSuperview];
    }
}

- (void)setBackBarButtonWithText:(NSString *)text {
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"" style:UIBarButtonItemStylePlain target:nil action:nil];
}
@end

