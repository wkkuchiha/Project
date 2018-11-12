//
//  DxRefreshLayer.h
//  uchiha
//
//  Created by uchiha on 2017/8/18.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, LayerState) {
    PULL_TO_TRANSITION = 0,
    PULL_TO_ARC = 1,
    PULL_TO_ROTATE = 2,
    LOADING = 3
};

@interface DxRefreshLayer : CALayer

@property(nonatomic,assign) LayerState state;
@property(nonatomic,strong) UIColor *color;
@property(nonatomic,assign) CGFloat contentOffsetY;
@property(nonatomic,assign) CGFloat lineWidth;
@property(nonatomic,assign) CGFloat arcRadius;

-(void)startLoaingAnimation;

-(void)reset;

-(void)beginRefreshing;

@end
