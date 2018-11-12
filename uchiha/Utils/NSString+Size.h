//
//  NSString+Size.h
//  uchiha
//
//  Created by uchiha on 2017/9/14.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Size)
- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;
@end
