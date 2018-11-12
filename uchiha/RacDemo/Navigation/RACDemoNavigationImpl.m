//
//  RACDemoNavigationImpl.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoNavigationImpl.h"
#import "RACDemoDetailViewModel.h"
#import "RACDemoDetailViewController.h"
@interface RACDemoNavigationImpl()

@property (nonatomic, weak) UINavigationController *navigationController;
@property(nonatomic,copy)NSArray *navigationControllers;

@end

@implementation RACDemoNavigationImpl
- (instancetype)initWithRACDemoNavigation:(UINavigationController *)navationController {
    if (self = [super init]) {
        _navigationController = navationController;
    }
    return self ;
}

- (void)pushViewModel:(id)viewmodel {
    if (!_navigationController) {
        NSLog(@"模态的页面不对呀");
        return ;
    }
    if ([viewmodel isKindOfClass:[RACDemoDetailViewModel class]]) {
        RACDemoDetailViewController *controller = [[RACDemoDetailViewController alloc]initViewModel:viewmodel];
        [self.navigationController pushViewController:controller animated:YES];
    } else {
        NSLog(@"代码出错");
    }
}

- (void)popToRootViewModel {
    
}


- (void)popViewModel {
    
}

@end
