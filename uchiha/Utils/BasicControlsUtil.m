//
//  BasicControlsUtil.m
//  MiuYoga
//
//  Created by uchiha on 2018/2/11.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "BasicControlsUtil.h"
#import "Utils.h"
@implementation BasicControlsUtil
+ (UILabel *)customLabelTextAlignment:(NSTextAlignment)alignment backGroundColor:(UIColor*)color tintColor:(UIColor *)tintColor textFont:(UIFont*)font {
    UILabel * customLabel = [[UILabel alloc]init];
    customLabel.textAlignment = alignment;
    customLabel.backgroundColor = color;
    customLabel.tintColor = tintColor;
    customLabel.font = font;
    return customLabel;
}

+ (UIImageView *)customImageView {
    UIImageView *imgView = [[UIImageView alloc]init];
    imgView.userInteractionEnabled = YES;
    return imgView;
}

+ (UIButton *)customBtnTextColor:(UIColor *)textColor backGroundColor:(UIColor *)backColor titleFont:(UIFont *)font image:(NSString *)imageString {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = backColor;
    btn.titleLabel.textColor = textColor;
    btn.titleLabel.font = font;
    if (![Utils isEmpty:imageString]) {
        [btn setImage:[UIImage imageNamed:imageString] forState:UIControlStateNormal];
    }
    return btn;
}

+ (UITextField *)customTextField:(NSString *)text titleFont:(UIFont *)font{
    UITextField * textField = [[UITextField alloc] init];
    textField.textAlignment = NSTextAlignmentCenter;
    textField.text = text;
    textField.font = font;
    return textField;
}
@end
