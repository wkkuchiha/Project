//
//  RefreshView.h
//  MiuTrip
//
//  Created by Miutrip on 2016/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RefreshLayer.h"

typedef void(^ActionHandler)(void);

@interface RefreshView : UIView

-(instancetype)initWithActionHander:(ActionHandler)handler;

@property(nonatomic,strong)UIColor *color;

-(void)endRefreshing;

-(void)beginRefreshing;

@end
