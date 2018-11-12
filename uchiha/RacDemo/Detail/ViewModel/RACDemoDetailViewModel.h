//
//  RACDemoDetailViewModel.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RACDemoBookModel.h"
#import "RACDemoNavigationImpl.h"
/**
 详情页面中分离出用于处理逻辑的类
 注意命名规则，一个controller和对应的viewmodel最好只能controller和model的区别
 注意每个viewmodel都要写清楚初始化的方法，或者初始化时必须有外界传入的值
 */
@interface RACDemoDetailViewModel : NSObject
// 对应controller的title
@property (nonatomic, copy) NSString *title;

// 如下几个属性能体现出MVVM的精髓
@property (nonatomic, copy) NSString *bookTitle;
@property (nonatomic, copy) NSString *pages;
@property (nonatomic, copy) NSString *price;
@property (nonatomic, copy) NSString *summary;
@property (nonatomic, copy) NSString *pubdate;
@property (nonatomic, copy) NSString *publisher;
@property (nonatomic, copy) NSString *firstAuthor;
@property (nonatomic, copy) NSString *imageUrl;

@property(nonatomic,strong)RACDemoBookModelDetail * modelDeatil;

// 如下实现页面跳转而创建的属性，和本身页面的逻辑无关
@property(nonatomic,strong)id<RACDemoNavigationProtocol>protocol;
- (instancetype)initWithDemoDetail:(RACDemoBookModelDetail *)detailModel protocol:(id<RACDemoNavigationProtocol>)protocol;

@end
