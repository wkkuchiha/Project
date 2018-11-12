//
//  RacAdvanceView.m
//  uchiha
//
//  Created by 王鹏 on 2018/7/22.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RacAdvanceView.h"
#import "Masonry.h"
@implementation RacAdvanceView

- (instancetype)init {
    if (self = [super init]) {
        [self initview];
    }
    return self;
}

- (void)initview {
    [self addSubview:_textField];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(100);
        make.width.equalTo(@80);
        make.height.equalTo(@40);
    }];
}

- (UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] init];
        _textField.backgroundColor = [UIColor redColor];
    }
    return _textField;
}
@end
