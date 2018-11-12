//
//  RACDemoBookModel.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/11.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol RACDemoBookModelDetail
@end


@interface RACDemoBookModel:NSObject
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign)NSInteger  total;
@property(nonatomic,strong)NSArray * data;

@end

// 这是一个最基本的model
@interface RACDemoBookModelDetail : NSObject

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
