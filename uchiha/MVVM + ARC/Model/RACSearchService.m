//
//  RACSearchService.m
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 *  搜索页面分离出来的专用于和API／数据库交互的类，隶属于model层
 */
#import "RACSearchService.h"
#import "RACBookModel.h"
#import <AFNetworking/AFNetworking.h>
#import "RACSearchResult.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import <LinqToObjectiveC/NSArray+LinqExtensions.h>

@implementation RACSearchService
- (RACSignal *)searchSignalWithText:(NSString *)text {
    return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[@"q"] = text;
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager POST:@"https://api.douban.com/v2/book/search" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            RACSearchResult *result = [[RACSearchResult alloc]init];
            result.start = [[responseObject objectForKey:@"start"]integerValue];
            result.total = [[responseObject objectForKey:@"total"]integerValue];
            result.count = [[responseObject objectForKey:@"count"]integerValue];
            NSArray *books = [responseObject objectForKey:@"books"];
            result.booksArray = [books linq_select:^id(NSDictionary *bookDict) {
                RACBookModel *book = [[RACBookModel alloc] initWithDict:bookDict];
                return book;
            }];
            [subscriber sendNext:result];
            [subscriber sendCompleted];
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendNext:error];
            [subscriber sendCompleted];
        }];
        return nil;
    }];
}
@end
