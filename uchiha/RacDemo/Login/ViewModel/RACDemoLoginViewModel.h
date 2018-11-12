//
//  RACDemoLoginViewModel.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface RACDemoLoginViewModel : NSObject
@property(nonatomic,copy)NSString *username;
@property(nonatomic,copy)NSString *password;

// signal
@property(nonatomic,strong)RACSignal *usernameSignal;
@property(nonatomic,strong)RACSignal *passwordSignal;
@property(nonatomic,strong)RACSignal *loginEnabelSignal;
@property(nonatomic,strong)RACSignal *connectionErrors;

// command
@property(nonatomic,strong)RACCommand *loginCommand;
@end
