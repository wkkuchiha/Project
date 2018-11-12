//
//  RACViewModelNavigationImpl.m
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "RACViewModelNavigationImpl.h"
#import "RACDetailViewModel.h"
#import "RACDetailViewController.h"
@implementation RACViewModelNavigationImpl
- (instancetype)initWithNavigationController:(UINavigationController *)controller {
    if (self = [super init]) {
        _controller = controller;
    }
    return  self;
}

- (void)pushViewModel:(id)viewModel {
    if (!_controller) {
        return;
    }
    if ([viewModel isKindOfClass:[RACDetailViewModel class]]) {
        RACDetailViewController *controller = [[RACDetailViewController alloc]initWithViewModel:viewModel];
        [_controller pushViewController:controller animated:YES];
    } else {
        NSLog(@"跳转失败");
    }
}

- (void)popViewModel {
    
}

- (void)popToRootViewModel {
    
}
@end
