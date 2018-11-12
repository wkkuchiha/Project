//
//  RACLoginViewModel.h
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 登录页面
 */
#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACLoginViewModel : NSObject
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *password;

@property(nonatomic,strong)RACSignal *usernameSignal;
@property(nonatomic,strong)RACSignal *passwordSignal;
@property(nonatomic,strong)RACSignal *loginEnableSignal;
@property(nonatomic,strong)RACSignal *connectionErrors;
@property(nonatomic,strong)RACCommand *loginCommon;

@end
