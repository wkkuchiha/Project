//
//  RACTableViewBindingHelper.h
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface RACTableViewBindingHelper : NSObject


+ (instancetype)bindingHelperForTableView:(UITableView *)tbView sourceSignal:(RACSignal *)source selectionCommand:(RACCommand *)section templateCell:(UINib *)templateCellNib;
@end
