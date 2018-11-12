//
//  LoadingStateView.h
//  uchiha
//
//  Created by uchiha on 2017/9/14.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 *  loading动画
 */
#import <UIKit/UIKit.h>

typedef NS_OPTIONS(NSInteger, LoadingViewState) {
   STATE_LOADING = 1,
   STATE_ERROR = 2,
   STATE_EMPTY
};

@interface LoadingStateView : UIView
@property()BOOL isLightStyle;

- (instancetype)initWithFrame:(CGRect)frame isLightStyle:(BOOL)isLightStyle BusinessType:(BusinessType)businessType;
- (void)toLoadingState ;
- (void)toEmptyState:(NSString *)emptyMsg;
- (void)toErrorStateWithCode:(NSInteger)code errorMsg:(NSString *)msg reloadHandle:(void (^)(void))reloadHandle;
- (void)removeSelf;
@end
