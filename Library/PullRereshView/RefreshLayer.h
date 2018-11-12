//
//  RefreshLayer.h
//  MiuTrip
//
//  Created by Miutrip on 2016/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

typedef NS_ENUM(NSInteger, LayerState) {
     PULL_TO_TRANSITION = 0,
     PULL_TO_ARC = 1,
     RELEASED = 2,
     LOADING = 3
};


@interface RefreshLayer : CALayer

@property(nonatomic,assign)LayerState state;
@property(nonatomic,strong)UIColor *color;
@property(nonatomic,assign)CGFloat progress;

-(void)startLoaingAnimation;

-(void)reset;

-(void)displayAndLoaing;
@end
