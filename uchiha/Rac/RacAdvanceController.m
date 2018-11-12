//
//  RacAdvanceController.m
//  uchiha
//
//  Created by 王鹏 on 2018/7/22.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RacAdvanceController.h"
#import "RacAdvanceView.h"
@interface RacAdvanceController ()
@property(nonatomic,strong)RacAdvanceView * advanceView;
@end

@implementation RacAdvanceController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    self.advanceView = [[RacAdvanceView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.advanceView];
    [self test1];
    [self bindData];
}

- (void)test1 {
    // 创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSLog(@"看看吧");
        [subscriber sendNext:@"我要发送一个信号"];
        NSLog(@"信号");
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"收到了");
        }];
    }];
    
    // 订阅信号
    NSLog(@"我");
    RACDisposable * disposable = [signal subscribeNext:^(id x) {
        NSLog(@"是的");
    }];
    // 移除信号
    [disposable dispose];
}

- (void)bindData {
    [[[self.advanceView.textField rac_textSignal]filter:^BOOL(id value) {
        NSString * valueString = (NSString *)value;
        return valueString.length > 3 ? YES : NO;
    }] subscribeNext:^(id x) {
        NSString * string = (NSString *)x;
        NSLog(@"------- %@",string);
    }];
    
    [[[[self.advanceView.textField  rac_textSignal]filter:^BOOL(id value) {
        NSString *valueString = (NSString *)value;
        return valueString.length > 5 ? YES : NO;
    }] map:^id(id value) {
        NSString *valueString = (NSString *)value;
        return valueString.length > 6 ?[UIColor grayColor] : [UIColor yellowColor];
    }] subscribeNext:^(id x) {
        self.advanceView.textField.backgroundColor = x;
    }];
}
@end
