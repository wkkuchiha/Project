//
//  RACDetailViewModel.m
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "RACDetailViewModel.h"

@implementation RACDetailViewModel
- (instancetype)initWithBookModel:(RACBookModel *)bookModel naviImpl:(id<RACNavigationProtocol>)naviImpl {
    if (self = [super init]) {
        [self initialize];
        _bookModel = bookModel;
        _naviImpl = naviImpl;
    }
    return self;
}

- (void)initialize {
    self.title = @"详情页";
}

- (NSString *)bookTitle {
    return self.bookModel.title;
}

- (NSString *)pages {
    return [NSString stringWithFormat:@"%@",self.bookModel.pages];
}

- (NSString *)summary {
    return [NSString stringWithFormat:@"%@",self.bookModel.summary];
}

- (NSString *)pubdate {
    return [NSString stringWithFormat:@"%@",self.bookModel.pubdate];
}

- (NSString *)publisher {
    return [NSString stringWithFormat:@"%@",self.bookModel.publisher];
}

- (NSString *)firstAuthor {
    return [NSString stringWithFormat:@"%@",[self.bookModel.author firstObject]];
}

- (NSString *)imageUrl {
    return [self.bookModel.images objectForKey:@"large"];
}
@end
