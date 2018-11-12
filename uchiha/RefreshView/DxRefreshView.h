//
//  DxRefreshView.h
//  uchiha
//
//  Created by uchiha on 2017/8/18.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DxRefreshLayer.h"

typedef void(^ActionHandler)(void);

@interface DxRefreshView : UIView

@property(nonatomic,copy) ActionHandler  actionHandler;
@property(nonatomic,strong) UIColor  *color;

-(void)beginRefreshing;
-(void)endRefreshing;

@end
