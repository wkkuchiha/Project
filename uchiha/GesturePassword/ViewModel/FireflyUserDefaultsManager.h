//
//  FireflyUserDefaultsManager.h
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FireflyUserDefaultsManager : NSObject
//以 key-value的形式保存
+ (void)saveUserDefaultsData:(id )value forKey:(NSString *)key;

//根据 key 来获取对应的值
+ (id)loadUserDefaultDataByKey:(NSString *)key;

//删除 key - value
+ (void)deleteUserDefaultDataByKey:(NSString *)key;
@end
