//
//  RACSearchViewModel.m
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 *  搜索页面中分离出的用于处理逻辑的类
 *  注意命名规则，一个controller和其对应的viewmodel最好只是Controller和Model的差别
 *  一般来说，viewmodel中主要是三种类型变量：普通的property，signal，command。当然还有可能有一堆方法
 *  此类中控制页面的跳转
 */

#import "RACSearchViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACSearchService.h"
#import "RACSearchResult.h"
#import "RACBookModel.h"
#import "RACDetailViewModel.h"

@implementation RACSearchViewModel

- (instancetype)init {
    if (self = [super init]) {
        [self initSubViews];
    }
    return self;
}

- (instancetype)initWIthNavImpl:(id<RACNavigationProtocol>)navImpl {
    if (self = [super init]) {
        [self initSubViews];
        _navImpl = navImpl;
    }
    return self;
}

- (void)initSubViews {
    self.title = @"先试下";
    _searchService = [RACSearchService new];
    @weakify(self);
    RACSignal *searchSignal = [[RACObserve(self, searchText) map:^id(id value) {
        @strongify(self);
        return @([self searchText:value]);
    }]distinctUntilChanged];
    
    _executeSearch = [[RACCommand alloc]initWithEnabled:searchSignal signalBlock:^RACSignal *(id input) {
        @strongify(self);
        return [self executeSearchSignal];
    }];
    
    self.connectionErrors = self.executeSearch.errors;
    
    _executeSelection = [[RACCommand alloc]initWithSignalBlock:^RACSignal *(id input) {
        // 跳转到详情页
        @strongify(self);
        return [self executeSelectionSignalWithIndex:input];
    }];
}

- (BOOL)searchText:(id)text {
    return [NSString stringWithFormat:@"%@",text].length > 3;
}

- (RACSignal *)executeSearchSignal {
    @weakify(self);
    return [[_searchService searchSignalWithText:_searchText]doNext:^(id x) {
        @strongify(self);
        RACSearchResult *results = (RACSearchResult *)x;
        _searchResults = results.booksArray;
    }];
    // 按钮在两秒钟内不可连续点击
    return [[[[RACSignal empty] logAll] delay:2.0] logAll];
}

- (RACSignal *)executeSelectionSignalWithIndex:(NSNumber *)index {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        RACBookModel *bookModel = [_searchResults objectAtIndex:[index integerValue]];
        RACDetailViewModel *detailViewModel = [[RACDetailViewModel alloc]initWithBookModel:bookModel naviImpl:self.navImpl];
        if (_navImpl && [_navImpl respondsToSelector:@selector(pushViewModel:)]) {
            [_navImpl pushViewModel:detailViewModel];
        }
        [subscriber sendCompleted];
        return nil;
    }];
}
@end
