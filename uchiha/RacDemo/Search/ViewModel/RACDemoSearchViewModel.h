//
//  RACDemoSearchViewModel.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACDemoNavigationImpl.h"
@interface RACDemoSearchViewModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *searchText;
@property(nonatomic,copy)NSArray *searchResults;

// 执行搜索命令
@property(nonatomic,strong)RACCommand *executeSearch;
@property(nonatomic,strong)RACSignal *connectionErrors;
@property(nonatomic,strong)RACCommand *executeSelection;

// 为了实现页面跳转而创建的属性，于页面无关
@property(nonatomic,strong)id<RACDemoNavigationProtocol>naviImpl;

- (instancetype)initWithNaviImpl:(id<RACDemoNavigationProtocol>)naviImpl;

@end
