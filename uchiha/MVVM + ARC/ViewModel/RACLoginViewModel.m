//
//  RACLoginViewModel.m
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//


#import "RACLoginViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@implementation RACLoginViewModel
- (instancetype)init {
    if (self = [super init]) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    @weakify(self)
    self.usernameSignal = [[RACObserve(self, username) map:^id(id value) {
        @strongify(self);
        return @([self isValueUsername:value]);
    }]distinctUntilChanged];
    self.passwordSignal = [[RACObserve(self, password) map:^id(id value) {
        @strongify(self);
        return @([self isValuePassword:value]);
    }]distinctUntilChanged];
    
    self.loginEnableSignal = [RACSignal combineLatest:@[self.usernameSignal,self.passwordSignal] reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid){
        return @([usernameValid boolValue] && [passwordValid boolValue]);
    }];
    
    
    self.loginCommon = [[RACCommand alloc]initWithEnabled:self.loginEnableSignal signalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self loginEnableSignal];
    }];
    self.connectionErrors = self.loginCommon.errors;
}

/**
 * 处理登录业务逻辑
 */
- (RACSignal *)loginSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)  {
         [self loginWithUsername:self.username password:self.password complete:^(BOOL result) {
             [subscriber sendNext:@(result)];
             // 数据传送完毕，必须调用完成，否则命令永远处于执行状态
             [subscriber sendCompleted];
         }];
        return nil;
    }];
}

/**
 * 模拟网络延迟
 */
- (void)loginWithUsername:(NSString *)username password:(NSString *)password complete:(void (^)(BOOL result))loginResult {
    double delay = 1.0f;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delay *NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue() , ^{
        BOOL success = [username isEqualToString:@"username"] && [password isEqualToString:@"password"];
        loginResult(success);
    });
}

- (BOOL)isValueUsername:(id)text {
    return [NSString stringWithFormat:@"%@",text].length > 6;
}

- (BOOL)isValuePassword:(id)text {
    return [NSString stringWithFormat:@"%@",text].length > 6;
}


@end
