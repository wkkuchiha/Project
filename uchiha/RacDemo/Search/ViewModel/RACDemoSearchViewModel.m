//
//  RACDemoSearchViewModel.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoSearchViewModel.h"
#import "RACDemoSearchService.h"
#import "RACDemoBookModel.h"
#import "RACDemoDetailViewModel.h"

@interface RACDemoSearchViewModel()
@property(nonatomic,strong)RACDemoSearchService *service;
@end

@implementation RACDemoSearchViewModel
- (instancetype)init {
    if (self = [super init]) {
        [self initialize];
    }
    return self;
}

- (instancetype)initWithNaviImpl:(id<RACDemoNavigationProtocol>)naviImpl {
    if (self = [super init]) {
        _naviImpl = naviImpl;
        [self initialize];
    }
    return self;
}

- (void)initialize {
    self.title = @"搜索";
    _service = [RACDemoSearchService new];
    @weakify(self);
    RACSignal * validSearchSignal = [[RACObserve(self, searchText) map:^id(id value) {
        @strongify(self);
        return @([self isValidSearchText:value]);
    }] distinctUntilChanged];
    
    self.executeSearch = [[RACCommand alloc] initWithEnabled:validSearchSignal signalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self executeSearchSignal];
    }];
    
    self.connectionErrors = self.executeSearch.errors;
    self.executeSelection = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(NSNumber *index) {
        @strongify(self);
        return [self jumpToDetailVCSignalWithIndex:index];
    }];
}

// 跳转到详情页
- (RACSignal * )jumpToDetailVCSignalWithIndex:(NSNumber *)index {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        RACDemoBookModelDetail *bookModel = [self.searchResults objectAtIndex:[index integerValue]];
        RACDemoDetailViewModel *detailModel = [[RACDemoDetailViewModel alloc]initWithDemoDetail:bookModel protocol:self.naviImpl];
        if (self.naviImpl && [self.naviImpl respondsToSelector:@selector(pushViewModel:)]) {
            [self.naviImpl pushViewModel:detailModel];
        }
        [subscriber sendCompleted];
        return nil;
    }];
}

- (RACSignal *)executeSearchSignal {
    @weakify(self);
    return [[self.service searchSignalWithText:self.searchText]doNext:^(RACDemoBookModel *bookModel) {
        @strongify(self);
        self.searchResults = bookModel.data;
    }];
    // 注意如此按钮会不可点击状态持续2s
    return [[[[RACSignal empty]logAll]delay:2.0]logAll];
}

- (BOOL)isValidSearchText:(NSString *)title {
    return title.length > 3;
}
@end
