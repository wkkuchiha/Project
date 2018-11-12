//
//  RACBindViewModelProtocol.h
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 将mvvm的核心方法定义成为一个协议，只需要遵守这个协议就可以保证用统一方法
 */
#import <Foundation/Foundation.h>

@protocol RACBindViewModelProtocol <NSObject>
- (void)bindViewModel:(id)ViewModel;
@end
