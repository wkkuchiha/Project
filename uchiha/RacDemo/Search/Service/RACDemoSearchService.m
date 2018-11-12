//
//  RACDemoSearchService.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/11.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoSearchService.h"
#import "AFNetworking.h"
#import "RACDemoBookModel.h"
#import <LinqToObjectiveC/NSArray+LinqExtensions.h>
@implementation RACDemoSearchService
- (RACSignal *)searchSignalWithText:(NSString *)searchTitle {
    return [RACSignal  createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        NSMutableDictionary *param = [NSMutableDictionary dictionary];
        param[@"q"] = searchTitle;
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        [manager GET:@"https://api.douban.com/v2/book/search" parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            
            // 此处可以把原始的数据转换为model，或者传给viewmodel，但是不能转为viewmodel
            
            RACDemoBookModel *bookmodel = [[RACDemoBookModel alloc]init];
            bookmodel.start = [[responseObject valueForKeyPath:@"start"] integerValue];
            bookmodel.total = [[responseObject valueForKeyPath:@"total"] integerValue];
            bookmodel.count = [[responseObject valueForKeyPath:@"count"] integerValue];
            
            NSArray *books = [responseObject valueForKeyPath:@"books"];
            __block NSDictionary *dict = [NSDictionary dictionary];
            bookmodel.data = [books linq_select:^id(NSDictionary *bookDict) {
                RACDemoBookModelDetail *bookmodelNew = [[RACDemoBookModelDetail alloc]initWithDict:dict];
                return bookmodelNew ;
            }];
            [subscriber sendNext:bookmodel];
            [subscriber sendCompleted];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendError:error];
        }];
        return nil;
    }];
}
@end
