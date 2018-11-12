//
//  RACSearchResult.h
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 在bookModel上面再次加了一层
 */
#import <Foundation/Foundation.h>

@interface RACSearchResult : NSObject
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, assign) NSInteger start;
@property (nonatomic, assign) NSInteger total;

@property (nonatomic, strong) NSArray *booksArray;
@end
