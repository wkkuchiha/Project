//
//  RACSearchService.h
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACNavigationProtocol.h"

@protocol RACSearchServiceDelegate <NSObject>

- (RACSignal *)searchSignalWithText:(NSString *)text;

@end

@interface RACSearchService : NSObject<RACSearchServiceDelegate>

@end
