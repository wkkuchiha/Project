//
//  RACDemoNavigationImpl.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACDemoNavigationProtocol.h"

/**
 *  MVVM正确的姿势：以viewmodel层驱动整个项目或者整个模块页面之间的跳转
 *  上面协议的实现类，以非短链的方式控制页面之间的跳转
 */
@interface RACDemoNavigationImpl : NSObject<RACDemoNavigationProtocol>

- (instancetype)initWithRACDemoNavigation:(UINavigationController *)navationController;
@end
