//
//  RACDemoTableViewBindingHelper.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/12.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

/**
 tableview绑定工具类
 */
@interface RACDemoTableViewBindingHelper : NSObject
@property(nonatomic,weak)id<UITableViewDelegate>delegate;
+ (instancetype)bindingViewModel:(UITableView *)tableView sourceSignal:(RACSignal *)source selectionCommand:(RACCommand *)selection;
@end
