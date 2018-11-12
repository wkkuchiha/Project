//
//  UIScrollView+Refresh.h
//  uchiha
//
//  Created by uchiha on 2017/8/23.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DxRefreshView.h"

@interface UIScrollView(Refresh)

@property (nonatomic,strong) DxRefreshView *refreshHeader;

-(void)removeScrollObserver;

@end
