//
//  FireflyUserDefaultsManager.m
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "FireflyUserDefaultsManager.h"

@implementation FireflyUserDefaultsManager
//以 key-value的形式保存
+ (void)saveUserDefaultsData:(id )value forKey:(NSString *)key {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:value forKey:key];
    [userDefault synchronize];
}

//根据 key 来获取对应的值
+ (id)loadUserDefaultDataByKey:(NSString *)key {
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    id result = [userDefault objectForKey:key];
    return result;
}

//删除 key - value
+ (void)deleteUserDefaultDataByKey:(NSString *)key {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
}
@end
