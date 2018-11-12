//
//  AwesomeTextField.h
//  TrainingWithTextField
//
//  Created by MacBookPro on 21.07.15.
//  Copyright (c) 2015 MacBookPro. All rights reserved.
//

#import <UIKit/UIKit.h>

IB_DESIGNABLE

@protocol AwesomeTextFieldDelegate <NSObject>

@optional
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField;
- (void)textFieldDidBeginEditing:(UITextField *)textField;
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField;
- (void)textFieldDidEndEditing:(UITextField *)textField;
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string;
- (BOOL)textFieldShouldClear:(UITextField *)textField;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (void)textFieldDidChange:(UITextField *)textField;

@end


/**
 *   material desigen样式的textField,高度必须为64，否则会错位
 */
@interface AwesomeTextField : UIView

@property (weak, nonatomic) id<AwesomeTextFieldDelegate> delegate;

@property (strong, nonatomic) UITextField *textField;

@property (strong, nonatomic) IBInspectable UIColor *underlineColor;
@property (assign, nonatomic) IBInspectable CGFloat underlineWidth;
@property (assign, nonatomic) IBInspectable CGFloat underlineAlpha;
@property (strong, nonatomic) IBInspectable UIColor *underlineHighLightColor;
@property (strong, nonatomic) IBInspectable UIColor *placeholderColor;
@property (assign, nonatomic) IBInspectable CGFloat animationDuration;

@property (strong, nonatomic) IBInspectable UIColor *textColor;
@property (strong, nonatomic) IBInspectable UIFont *font;
@property (strong, nonatomic) IBInspectable NSString *text;
@property (strong, nonatomic) IBInspectable NSString *placeholder;
@property (assign, nonatomic) BOOL secureTextEntry;
@property (assign, nonatomic) BOOL showCharacterNumber;      //是否显示输入的字符串长度
@property (assign, nonatomic) NSUInteger maxCharacterNumber; //最大输入字符长度

@property (strong, nonatomic) NSString *errorMsg;

@end
