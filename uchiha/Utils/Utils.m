//
//  Utils.m
//  uchiha
//
//  Created by uchiha on 2017/9/15.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "Utils.h"

@implementation Utils
+ (BOOL)isEmpty:(NSObject *)object {
    if (object == nil || [object isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([object isKindOfClass:[NSString class]]) {
        NSString *objc = (NSString *)object;
        if ([objc isKindOfClass:[NSNull class]]) {
            return YES;
        }
        return NO;
    }
    return NO;
}

@end
