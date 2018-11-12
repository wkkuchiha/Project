//
//  TransitionHelper.h
//  MiuTrip
//
//  Created by apple on 14-7-17.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TransitionHelper : NSObject

+ (TransitionHelper *)shareInstance;

@property (strong, nonatomic) NSMutableDictionary *params;

@end

void TransitionScalePush(UIViewController *fromViewController, UIViewController *toViewController, UIView *tempView, void (^completion)(void));
