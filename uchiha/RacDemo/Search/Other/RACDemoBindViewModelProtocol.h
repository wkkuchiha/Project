//
//  RACDemoBindViewModelProtocol.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/12.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 将mvvm的核心方法定义成一个协议，只需要遵守此方法就可以保证方法的统一
 */
@protocol RACDemoBindViewModelProtocol <NSObject>
- (void)bindViewModel:(id)viewModel;
@end
