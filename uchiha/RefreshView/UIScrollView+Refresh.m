//
//  UIScrollView+Refresh.m
//  uchiha
//
//  Created by uchiha on 2017/8/23.
//  Copyright © 2017年 creditease. All rights reserved.
//


#import "UIScrollView+Refresh.h"
#import <objc/runtime.h>

static const char RefreshHeaderKey = 'R';

@implementation UIScrollView(Refresh)

@dynamic refreshHeader;

-(void)setRefreshHeader:(DxRefreshView *)refreshHeader
{
    [self insertSubview:refreshHeader atIndex:0];
    [self willChangeValueForKey:@"refreshHeader"];
    objc_setAssociatedObject(self, &RefreshHeaderKey,
                             refreshHeader, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    [self didChangeValueForKey:@"refreshHeader"];
    [self addObserver:refreshHeader forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
    [self addObserver:refreshHeader forKeyPath:@"contentInset" options:NSKeyValueObservingOptionNew context:nil];
}

- (DxRefreshView*)refreshHeader
{
    return objc_getAssociatedObject(self, &RefreshHeaderKey);
}

-(void)removeScrollObserver
{
    [self removeObserver:self.refreshHeader forKeyPath:@"contentOffset"];
    [self removeObserver:self.refreshHeader forKeyPath:@"contentInset"];
}


@end
