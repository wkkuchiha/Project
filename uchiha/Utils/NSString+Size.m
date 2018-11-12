//
//  NSString+Size.m
//  uchiha
//
//  Created by uchiha on 2017/9/14.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
- (CGSize)textSizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size {
    CGSize textSize;
    if (CGSizeEqualToSize(size, CGSizeZero)) {
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        textSize = [self sizeWithAttributes:attributes];
    } else {
        NSStringDrawingOptions option = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName];
        CGRect rect = [self boundingRectWithSize:size
                                         options:option
                                      attributes:attributes
                                         context:nil];
        textSize = rect.size;
    }
    return textSize;
}
@end
