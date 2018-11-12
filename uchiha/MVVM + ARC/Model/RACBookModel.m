//
//  RACBookModel.m
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "RACBookModel.h"
#import <LinqToObjectiveC/NSArray+LinqExtensions.h>
@implementation RACBookModel
- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self) {
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
