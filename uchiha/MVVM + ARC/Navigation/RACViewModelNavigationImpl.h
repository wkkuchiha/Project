//
//  RACViewModelNavigationImpl.h
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACNavigationProtocol.h"
/**
 * MVVM正确用法：以ViewModel层驱动项目或者模块页面之间的跳转
   上面协议的实现类，以非短链的方式控制页面的跳转
 */
@interface RACViewModelNavigationImpl : NSObject<RACNavigationProtocol>
@property(nonatomic,weak)UINavigationController *controller;
@property(nonatomic,copy)NSMutableArray *navigationControllers;
- (instancetype)initWithNavigationController:(UINavigationController *)controller;
@end
