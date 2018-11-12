//
//  AwesomeTextField.m
//  TrainingWithTextField
//
//  Created by MacBookPro on 21.07.15.
//  Copyright (c) 2015 MacBookPro. All rights reserved.
//

#import "AwesomeTextField.h"
#import "Utils.h"

@interface AwesomeTextField () <UITextFieldDelegate>
{
    UILabel *_placeholderLabel;
    UILabel *_errorMsgLabel;
    UILabel *_charNumberLabel;
    UIView *_lineView;
    UIView *_highLightlineView;
    BOOL _isLifted;
    BOOL _added;
}
@end


@implementation AwesomeTextField

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.translatesAutoresizingMaskIntoConstraints = YES;
        [self setup];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    if (!_added) {
        _textField.frame = CGRectMake(0, 16, UIViewWidth(self), 32);
        _lineView.frame = CGRectMake(0, 48 - [self underlineWidthSet], self.frame.size.width, [self underlineWidthSet]);
        _highLightlineView.frame = CGRectMake(0, 48 - [self underlineWidthSet], 0, [self underlineWidthSet]);
        if (_isLifted) {
            _placeholderLabel.frame = CGRectMake(2, 0, UIViewWidth(self) - 4, 16);
        } else {
            _placeholderLabel.frame = CGRectMake(2, 16, UIViewWidth(self) - 4, 32);
        }
        _errorMsgLabel.frame = CGRectMake(2, 49, UIViewWidth(self) - 4, 15);
        _charNumberLabel.frame = CGRectMake(UIViewWidth(self) - 60, 49, 60, 15);
        _added = YES;
    }
}

- (void)setup
{
    self.underlineColor = [UIColor lightGrayColor];
    self.underlineAlpha = 0.75f;
    self.underlineWidth = 2.f;
    self.placeholderColor = [UIColor grayColor];
    self.animationDuration = 0.25f;

    _textField = [[UITextField alloc] init];
    _textField.delegate = self;
    [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self addSubview:_textField];

    _lineView = [[UIView alloc] init];
    if (self.underlineColor) {
        _lineView.backgroundColor = self.underlineColor;
    } else {
        _lineView.backgroundColor = [UIColor lightGrayColor];
    }
    _lineView.alpha = [self underlineAlphaSet];
    [self addSubview:_lineView];

    _highLightlineView = [[UIView alloc] init];

    if (!_underlineHighLightColor) {
        _underlineHighLightColor = BlueColor;
    }
    _highLightlineView.backgroundColor = _underlineHighLightColor;
    [self addSubview:_highLightlineView];

    _placeholderLabel = [[UILabel alloc] init];
    _placeholderLabel.font = [UIFont systemFontOfSize:14];
    if (self.placeholderColor) {
        _placeholderLabel.textColor = self.placeholderColor;
    } else {
        _placeholderLabel.textColor = [UIColor grayColor];
    }
    _placeholderLabel.alpha = 0.75;

    [self addSubview:_placeholderLabel];
    [self bringSubviewToFront:_placeholderLabel];

    _errorMsgLabel = [[UILabel alloc] init];
    _errorMsgLabel.textColor = RedColor;
    _errorMsgLabel.font = [UIFont boldSystemFontOfSize:12];
    _errorMsgLabel.hidden = YES;
    [self addSubview:_errorMsgLabel];

    _charNumberLabel = [[UILabel alloc] init];
    _charNumberLabel.textColor = LightGrayColor;
    _charNumberLabel.font = [UIFont systemFontOfSize:10];
    _charNumberLabel.textAlignment = NSTextAlignmentRight;
    _charNumberLabel.hidden = YES;
    [self addSubview:_charNumberLabel];
}

- (void)textFieldDidChange:(UITextField *)textField
{
    if (_showCharacterNumber && _maxCharacterNumber > 1) {
        NSString *toBeString = textField.text;
        NSString *lang = [[textField textInputMode] primaryLanguage]; // 键盘输入模式
        if ([lang isEqualToString:@"zh-Hans"]) {                      // 简体中文输入，包括简体拼音，健体五笔，简体手写
            UITextRange *selectedRange = [textField markedTextRange];
            //获取高亮部分
            UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
            // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
            if (!position) {
                if (toBeString.length > _maxCharacterNumber) {
                    textField.text = [toBeString substringToIndex:_maxCharacterNumber];
                }
            }
            // 有高亮选择的字符串，则暂不对文字进行统计和限制
        } else {
            if (toBeString.length > _maxCharacterNumber) {
                textField.text = [toBeString substringToIndex:_maxCharacterNumber];
            }
        }

        [self updateTextNumber];
    }

    if([_delegate respondsToSelector:@selector(textFieldDidChange:)]){
        [_delegate textFieldDidChange:textField];
    }
}
- (NSString *)text
{
    return _textField.text;
}

- (void)setText:(NSString *)text
{
    _textField.text = text;
    if (![Utils isEmpty:text]) {
        _placeholderLabel.frame = CGRectMake(2, 0, _placeholderLabel.frame.size.width, 16);
        _placeholderLabel.font = [UIFont systemFontOfSize:10];
        _isLifted = YES;
    }

    if ([Utils isEmpty:text]) {
        _placeholderLabel.frame = CGRectMake(2, 16, UIViewWidth(self) - 4, 32);
        _placeholderLabel.font = [UIFont systemFontOfSize:15];
        _isLifted = NO;
    }

    if (_showCharacterNumber) {
        [self updateTextNumber];
    }
}

- (void)updateTextNumber
{
    _charNumberLabel.text = [NSString stringWithFormat:@"%ld/%ld", (long)_textField.text.length, (long)_maxCharacterNumber];
}

- (void)setPlaceholder:(NSString *)placeholder
{
    _placeholderLabel.text = placeholder;
    _textField.placeholder = nil;
}

- (NSString *)placeholder
{
    return _textField.placeholder;
}

- (void)setFont:(UIFont *)font
{
    _textField.font = font;
}

- (UIFont *)font
{
    return _textField.font;
}

- (void)setTextColor:(UIColor *)textColor
{
    _textField.textColor = textColor;
}

- (UIColor *)textColor
{
    return _textField.textColor;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    _placeholderLabel.textColor = placeholderColor;
}

- (void)setSecureTextEntry:(BOOL)secureTextEntry
{
    _textField.secureTextEntry = secureTextEntry;
}

- (void)setErrorMsg:(NSString *)errorMsg
{
    if (!errorMsg) {
        _errorMsgLabel.text = nil;
        _errorMsgLabel.hidden = YES;

        _highLightlineView.frame = CGRectMake(0, _highLightlineView.frame.origin.y, 0, _highLightlineView
                                                                                           .frame.size.height);
        _highLightlineView.backgroundColor = RedColor;
    } else {
        _errorMsgLabel.text = errorMsg;
        _errorMsgLabel.hidden = NO;

        _highLightlineView.frame = CGRectMake(0, _highLightlineView.frame.origin.y, UIViewWidth(self), _highLightlineView
                                                                                                           .frame.size.height);
        _highLightlineView.backgroundColor = RedColor;
    }
}

- (void)setShowCharacterNumber:(BOOL)showCharacterNumber
{
    _showCharacterNumber = showCharacterNumber;
    if (_showCharacterNumber) {
        _charNumberLabel.text = [NSString stringWithFormat:@"%d/%d", 0, (int)_maxCharacterNumber];
        _charNumberLabel.hidden = NO;
        [self updateTextNumber];
    } else {
        _charNumberLabel.text = nil;
        _charNumberLabel.hidden = YES;
    }
}


- (void)setUnderlineColor:(UIColor *)underlineColor
{
    _lineView.backgroundColor = underlineColor;
}

- (void)setUnderlineWidth:(CGFloat)underlineWidth
{
    _lineView.frame = CGRectMake(0, 48 - underlineWidth, UIViewWidth(self), underlineWidth);
}

- (void)setUnderlineAlpha:(CGFloat)underlineAlpha
{
    _lineView.alpha = underlineAlpha;
}

- (void)setUnderlineHighLightColor:(UIColor *)underlineHighLightColor
{
    _highLightlineView.backgroundColor = underlineHighLightColor;
}

#pragma textfield delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self didBeginChangeTextField];
    if([_delegate respondsToSelector:@selector(textFieldShouldBeginEditing:)]){
        [_delegate textFieldShouldBeginEditing:textField];
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if([_delegate respondsToSelector:@selector(textFieldDidBeginEditing:)]){
        [_delegate textFieldDidBeginEditing:textField];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    [self didEndChangeTextField];
    if([_delegate respondsToSelector:@selector(textFieldShouldEndEditing:)]){
        [_delegate textFieldShouldEndEditing:textField];
    }
    return YES;
}


- (void)textFieldDidEndEditing:(UITextField *)textField
{
    if([_delegate respondsToSelector:@selector(textFieldDidEndEditing:)]){
        [_delegate textFieldDidEndEditing:textField];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    if (!_errorMsgLabel.hidden) {
        _highLightlineView.frame = CGRectMake(0, _highLightlineView.frame.origin.y, UIViewWidth(self), _highLightlineView.frame.size.height);
        _highLightlineView.backgroundColor = _underlineHighLightColor;
        _errorMsgLabel.hidden = YES;
    }


    if([_delegate respondsToSelector:@selector(textField:shouldChangeCharactersInRange:replacementString:)]){
        return [_delegate textField:textField shouldChangeCharactersInRange:(range) replacementString:string];

    }
    return true;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    if([_delegate respondsToSelector:@selector(textFieldShouldClear:)]){
        return [_delegate textFieldShouldClear:textField];
    }
    return true;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    if([_delegate respondsToSelector:@selector(textFieldShouldReturn:)]){
        return [_delegate textFieldShouldReturn:textField];
    }
    return true;
}


#pragma mark - Delegate

- (void)didBeginChangeTextField
{
    if (!_errorMsgLabel.hidden) {
        _highLightlineView.frame = CGRectMake(0, _highLightlineView.frame.origin.y, 0, _highLightlineView
                                                                                           .frame.size.height);
        _highLightlineView.backgroundColor = _underlineHighLightColor;
        _errorMsgLabel.hidden = YES;
    }

    if (!_isLifted) {
        [UIView animateWithDuration:[self animationDurationSet] animations:^{
            _placeholderLabel.alpha = 1;
            _placeholderLabel.frame = CGRectMake(2, 0, _placeholderLabel.frame.size.width, 16);
            _placeholderLabel.font = [UIFont systemFontOfSize:10];
            _lineView.alpha = 1.f;
            _highLightlineView.frame = CGRectMake(0, _highLightlineView.frame.origin.y, _lineView.frame.size.width, _highLightlineView.frame.size.height);

        } completion:^(BOOL finished) {
            _isLifted = YES;
        }];
    } else {
        [UIView animateWithDuration:[self animationDurationSet] animations:^{
            _highLightlineView.frame = CGRectMake(0, _highLightlineView.frame.origin.y, _lineView.frame.size.width, _highLightlineView.frame.size.height);
            _lineView.alpha = 1.f;
        }];
    }
}

- (void)didEndChangeTextField
{
    if (_isLifted && ![_textField hasText]) {
        [UIView animateWithDuration:[self animationDurationSet] animations:^{
            _placeholderLabel.alpha = 0.6;
            _placeholderLabel.frame = CGRectMake(2, 16, UIViewWidth(self) - 4, 32);
            _placeholderLabel.font = [UIFont systemFontOfSize:15];
            _lineView.alpha = [self underlineAlphaSet];
            _highLightlineView.frame = CGRectMake(0, _highLightlineView.frame.origin.y, 0, _highLightlineView.frame.size.height);

        } completion:^(BOOL finished) {
            if (finished) {
                _isLifted = NO;
            }
        }];
    } else {
        [UIView animateWithDuration:[self animationDurationSet] animations:^{

            _lineView.alpha = [self underlineAlphaSet];
            _highLightlineView.frame = CGRectMake(0, _highLightlineView.frame.origin.y, 0, _highLightlineView.frame.size.height);
        }];
    }
}

#pragma mark - New Methods

- (CGFloat)animationDurationSet
{
    if (self.animationDuration && self.animationDuration >= 0) {
        return self.animationDuration;
    } else {
        return 0.3;
    }
}

- (CGFloat)underlineAlphaSet
{
    if (self.underlineAlpha && self.underlineAlpha > 0 && self.underlineAlpha <= 1) {
        return self.underlineAlpha;
    } else {
        return 0.75;
    }
}

- (CGFloat)underlineWidthSet
{
    if (self.underlineWidth && self.underlineWidth >= 0) {
        return self.underlineWidth;
    } else {
        return 2.f;
    }
}

@end
