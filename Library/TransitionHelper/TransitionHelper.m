//
//  TransitionHelper.m
//  MiuTrip
//
//  Created by apple on 14-7-17.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import "TransitionHelper.h"


@implementation TransitionHelper

+ (TransitionHelper *)shareInstance
{
    static TransitionHelper *transitionHelper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        transitionHelper = [[TransitionHelper alloc] init];
        transitionHelper.params = [NSMutableDictionary dictionary];
    });
    return transitionHelper;
}

@end
