//
//  RACDemoBookModel.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/11.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoBookModel.h"
#import <LinqToObjectiveC/NSArray+LinqExtensions.h>


@implementation RACDemoBookModel

@end

@implementation RACDemoBookModelDetail
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.bid = [dict valueForKeyPath:@"id"];
        self.image = [dict valueForKeyPath:@"image"];
        self.title = [dict valueForKeyPath:@"title"];
        self.pages = [dict valueForKeyPath:@"pages"];
        self.price = [dict valueForKeyPath:@"price"];
        self.summary = [dict valueForKeyPath:@"summary"];
        self.pubdate = [dict valueForKeyPath:@"pubdate"];
        self.publisher = [dict valueForKeyPath:@"publisher"];
        NSArray *author =  [dict valueForKeyPath:@"author"];
        self.author = [author linq_select:^id(NSString *oneAuthor) {
            return oneAuthor;
        }];
        self.images = [dict valueForKeyPath:@"images"];
        
    }
    return self;
}
@end
