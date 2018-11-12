//
//  RacPrimaryController.m
//  uchiha
//
//  Created by 王鹏 on 2018/7/22.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RacPrimaryController.h"
#import "RacPrimaryView.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RacPrimaryController ()
@property(nonatomic,strong)RacPrimaryView *primaryView;
@end

@implementation RacPrimaryController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self bindData];
}

- (void)setupView {
    [self.view addSubview:_primaryView];
}

- (void)bindData {
    [[_primaryView.redBtn rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        NSLog(@"点击了下按钮");
    }];
    
    [[_primaryView.nameTF rac_signalForControlEvents:UIControlEventEditingChanged]subscribeNext:^(id x) {
        UITextField *text = (UITextField *)x;
        NSLog(@"---- %@",text.text);
    }];
    
    [[_primaryView.greenBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [self showAlterGreenView];
    }];
    
    
    [RACObserve(self.primaryView.scrollView, contentOffset)subscribeNext:^(id x) {
        NSNumber * number = (NSNumber *)x;
        NSLog(@"------- %@",(NSNumber *)x);
    }];
}

- (void)showAlterGreenView {
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"弹出框" message:@"啊哈哈哈" preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"cancle" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
    }]];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"请稍后" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"请稍后");
    }]];
}

- (RacPrimaryView *)primaryView {
    if (!_primaryView) {
        _primaryView = [[RacPrimaryView alloc] initWithFrame:self.view.bounds];
    }
    return _primaryView;
}
@end
