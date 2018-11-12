//
//  RACSearchViewModel.h
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACNavigationProtocol.h"
#import "RACSearchService.h"

@interface RACSearchViewModel : NSObject
@property(nonatomic,copy)NSString *title;
@property(nonatomic,copy)NSString *searchText;
@property(nonatomic,copy)NSArray *searchResults;
@property(nonatomic,strong)RACSignal *connectionErrors; // api交互时候产生的错误
@property(nonatomic,strong)RACCommand *executeSearch; // 执行搜索的命令
@property(nonatomic,strong)RACCommand *executeSelection; // 点击cell时候的命令

@property(nonatomic,strong)RACSearchService *searchService;

@property(nonatomic,weak)id<RACNavigationProtocol>navImpl; // 实现页面跳转
- (instancetype)initWIthNavImpl:(id<RACNavigationProtocol>)navImpl;

@end
