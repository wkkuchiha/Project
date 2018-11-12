//
//  BaseUIViewController.h
//  uchiha
//
//  Created by uchiha on 2017/9/14.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 *  设置项目中UI统一风格
 */
#import <UIKit/UIKit.h>
#import "LoadingStateView.h"
typedef enum {
    LightStyle,
    GrayStyle
} IndicatorStyle;

@interface BaseUIViewController : UIViewController
@property(strong)LoadingStateView *loadingView;
@property(strong)UIControl *servicePhoneView;
@property(strong)UIAlertView *alerView;

/**
 *  在ViewController.view内显示一个loading的IndicatorView。
 *  该view分两个状态，loading状态和请求失败或空数据状态。根据不同的状态显示不同的视图。
 *  IndicatorStyle:指定IndicatorView的样式，LightStyle 白色，GrayStyle 灰色。
 */
- (void)addLoadingStateViewWithStyle:(IndicatorStyle)style BusinessType:(BusinessType)businessType;

- (void)addLoadingStateViewWithStyle:(IndicatorStyle)style frame:(CGRect)frame BusinessType:(BusinessType)businessType;

// 从ViewController.view 中移除IndicatorView
- (void)removeLoadingStateView;

- (void)setBackBarButtonWithText:(NSString *)title;

@end
