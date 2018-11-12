//
//  OneLoadingAnimation.h
//  OneLoadingAnimationStep1
//
//  Created by thatsoul on 15/11/15.
//  Copyright © 2015年 chenms.m2. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    LargeStyle,
    SmallStyle,
    ExtraSmallStyle
} LoadingViewStyle;

static NSInteger const stateLoading = 0;
static NSInteger const stateSuccess = 1;
static NSInteger const stateFailed = 2;
static NSInteger const stateEmpty = 3;


typedef void(^LoadingAnimFinishedHandler)(void);

@interface OneLoadingAnimationView : UIView

@property (nonatomic,strong) UIColor *normalColor;
//@property (nonatomic,strong) UIColor *successColor;
//@property (nonatomic,strong) UIColor *errorColor;
@property (nonatomic) int state;

@property (nonatomic,copy) LoadingAnimFinishedHandler loadingAnimFinishedHandler;

-(instancetype)initStyle:(LoadingViewStyle)style;

- (void)startAnimation;
- (void)stopAnimating;
- (void)toSuccessViewState;
- (void)toFailedViewState;
- (void)toEmptyViewState;
//直接显示无结果状态，无加载状态和动画
- (void)showEmptyStateNoAnimation;
- (void)showFailedStateNoAnimation;
@end
