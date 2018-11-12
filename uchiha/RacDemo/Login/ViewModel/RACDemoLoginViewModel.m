//
//  RACDemoLoginViewModel.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoLoginViewModel.h"

@implementation RACDemoLoginViewModel
- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (void)initialize {
    @weakify(self);
    self.usernameSignal = [[RACObserve(self, username) map:^id(id value) {
        @strongify(self);
        return @([self isValidUsername:value]);
    }]distinctUntilChanged];
    
    self.passwordSignal = [[RACObserve(self, password) map:^id(id value) {
        @strongify(self);
        return @([self isValidPassword:value]);
    }]distinctUntilChanged];
    
    self.loginEnabelSignal = [RACSignal combineLatest:@[self.usernameSignal,self.passwordSignal] reduce:^id(NSNumber*usernameValid, NSNumber *passwordValid){
        return @([usernameValid boolValue] && [passwordValid boolValue]);
    }];
    
    self.loginCommand = [[RACCommand alloc]initWithEnabled:self.loginEnabelSignal signalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self loginSignal];
    }];
    self.connectionErrors = self.loginCommand.errors;
}

- (RACSignal *)loginSignal {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        [self loginWithUserName:self.username password:self.password complete:^(bool result) {
            [subscriber sendNext:@(result)];
            [subscriber sendCompleted];
        }];
        return  nil;
    }];
}

- (void)loginWithUserName:(NSString *)username password:(NSString *)password complete:(void(^)(bool result))loginReslut{
    double delayInseconds = 1.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInseconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^{
        BOOL success = [username isEqualToString:@"username"] && [password isEqualToString:@"password"];
        loginReslut(success);
    });
}

- (BOOL)isValidUsername:(NSString *)username {
    return username.length > 6;
}

- (BOOL)isValidPassword:(NSString *)password {
    return password.length > 6;
}
@end
