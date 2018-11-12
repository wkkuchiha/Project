//
//  RACNavigationProtocol.h
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 *  MVVM正确的姿势：以viewmodel层驱动整个项目或者整个模块页面之间的跳转
 *  为此创建了此协议
 *  进行页面跳转需要3要素：本身页面的navigationController，新的页面Controller的名字，需要的初始化方法或者必须要传的值
 *  A1:将根（appdelegate或一个模块首页页面的）navigation用初始化方法传给实现者? 做成一个导航的堆栈?
 *  A2:以命名规则解决从viewmodel到controller映射的问题？
 *  A3:controller初始化方法统一为用viewmodel初始化！
 */
#import <Foundation/Foundation.h>

@protocol RACNavigationProtocol <NSObject>
- (void)pushViewModel:(id)viewModel;
- (void)popViewModel;
- (void)popToRootViewModel;
@end
