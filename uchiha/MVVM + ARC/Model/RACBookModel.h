//
//  RACBookModel.h
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RACBookModel : NSObject

@property (nonatomic, copy) NSString *bid;
@property (nonatomic, copy) NSString *image;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *pages;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *pubdate;
@property (nonatomic, copy) NSString *publisher;

@property (nonatomic, strong) NSArray *author;

@property (nonatomic, strong) NSDictionary *images;

- (instancetype)initWithDict:(NSDictionary *)dict;


@end
