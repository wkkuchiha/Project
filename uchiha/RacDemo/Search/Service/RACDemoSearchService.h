//
//  RACDemoSearchService.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/11.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>

// 搜索页面，分离出来的专用与api和数据接口
@protocol RACDemoSearchServiceDelegate <NSObject>
- (RACSignal *)searchSignalWithText:(NSString *)searchTitle;
@end
@interface RACDemoSearchService : NSObject<RACDemoSearchServiceDelegate>


@end
