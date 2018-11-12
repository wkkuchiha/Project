//
//  RACDemoNavigationProtocol.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RACDemoNavigationProtocol <NSObject>

- (void)pushViewModel:(id)viewmodel;
- (void)popViewModel;
- (void)popToRootViewModel;
@end
