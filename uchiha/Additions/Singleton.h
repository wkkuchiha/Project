//
//  Singleton.h
//  控件系数-03
//
//  Created by 张玺 on 16/3/16.
//  Copyright © 2016年 张玺. All rights reserved.
//
//.h文件
#define  SingletonH_Create(name)  +(instancetype)sharedInstance##name;

//.m文件
#define SingletonM_Create(name) \
static id _instace; \
\
+ (instancetype)allocWithZone:(struct _NSZone *)zone \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [super allocWithZone:zone]; \
}); \
return _instace; \
} \
\
+ (instancetype)sharedInstance##name \
{ \
static dispatch_once_t onceToken; \
dispatch_once(&onceToken, ^{ \
_instace = [[self alloc] init]; \
}); \
return _instace; \
} \
\
- (id)copyWithZone:(NSZone *)zone \
{ \
return _instace; \
}
