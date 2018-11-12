//
//  FireflyGesturePasswordView.h
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "FireflyTentacleView.h"

@protocol GesturePasswordDelegate <NSObject>

- (void)forgetGeturePassword;
- (void)changeGeturePassword;

@end

@interface FireflyGesturePasswordView : UIView <FireflyGPTouchBeginDelegate>

@property (nonatomic, strong) UILabel *state;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIButton *forgetButton;
@property (nonatomic, strong) UIButton *changeButton;
@property (nonatomic, strong) FireflyTentacleView *tentacleView;
@property (nonatomic, assign) id<GesturePasswordDelegate> delegate;

@end
