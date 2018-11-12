//
//  BasicControlsUtil.h
//  MiuYoga
//
//  Created by uchiha on 2018/2/11.
//  Copyright © 2018年 creditease. All rights reserved.
//

// 基本控件封装
#import <Foundation/Foundation.h>

@interface BasicControlsUtil : NSObject
+ (UILabel *)customLabelTextAlignment:(NSTextAlignment)alignment backGroundColor:(UIColor*)color tintColor:(UIColor *)tintColor textFont:(UIFont*)font;

+ (UIImageView *)customImageView ;

+ (UIButton *)customBtnTextColor:(UIColor *)textColor backGroundColor:(UIColor *)backColor titleFont:(UIFont *)font image:(NSString *)imageString;

+ (UITextField *)customTextField:(NSString *)text titleFont:(UIFont *)font ;
@end
