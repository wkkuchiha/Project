//
//  NSString+Adtion.m
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "NSString+Adtion.h"

@implementation NSString (Adtion)
+ (BOOL)strNilOrEmpty:(NSString *)string {
    if ([string isKindOfClass:[NSString class]]) {
        if (string.length > 0) {
            return YES;
        }
        return NO;
    }
    return NO;
}
@end
