//
//  FireflyTentacleView.h
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//


#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, FireflyGesturePasswordOperateType)
{
    setGesturePassword = 0,
    verifyGesturePassword,
    updateGesturePassword,
};

@protocol FireflyGPOperationDelegate  <NSObject>

- (void)operationWithStyle:(FireflyGesturePasswordOperateType) style result:(NSString *)result;


@end

@protocol FireflyGPTouchBeginDelegate <NSObject>

- (void)gestureTouchBegin;

@end

@interface FireflyTentacleView : UIView

@property (nonatomic, strong) NSArray *buttonArray;
@property (nonatomic, assign) id<FireflyGPOperationDelegate> delegate;
@property (nonatomic, assign) id<FireflyGPTouchBeginDelegate> touchBeginDelegate;
@property (nonatomic, assign) FireflyGesturePasswordOperateType style;

- (void)enterArgin;
- (void)refreshViews:(BOOL)result;


@end
