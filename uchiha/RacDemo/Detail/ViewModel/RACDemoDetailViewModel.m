//
//  RACDemoDetailViewModel.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoDetailViewModel.h"

@implementation RACDemoDetailViewModel
- (instancetype)initWithDemoDetail:(RACDemoBookModelDetail *)detailModel protocol:(id<RACDemoNavigationProtocol>)protocol {
    if (self = [super init]) {
        _protocol = protocol;
        _modelDeatil = detailModel;
    }
    return self;
}

- (void)initialize {
    self.title = @"详情";
}

- (NSString *)bookTitle {
    return self.modelDeatil.title;
}

- (NSString *)pages {
    return [NSString stringWithFormat:@"%@页",self.modelDeatil.pages];
}

- (NSString *)price {
    return [NSString stringWithFormat:@"%@元",self.modelDeatil.price];
}

- (NSString *)summary {
    return self.modelDeatil.summary;
}

- (NSString *)pubdate {
    return self.modelDeatil.pubdate;
}

- (NSString *)publisher {
    return self.modelDeatil.publisher;
}

- (NSString *)firstAuthor {
    return [self.modelDeatil.author firstObject];
}

- (NSString *)imageUrl {
    return [self.modelDeatil.images objectForKey:@"large"];
}
@end
