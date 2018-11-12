//
//  MyNavigationItem.m
//  uchiha
//
//  Created by uchiha on 2017/9/22.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "MyNavigationItem.h"
@implementation MyNavigationItem

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        //文字居中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        //字体大小
        self.imageView.sd_layout.centerXEqualToView(self).centerYEqualToView(self).widthIs(20).heightIs(20);
        self.titleLabel.font = AllOrderBigFont ;
    }
    return self;
}

//将父类操作屏蔽,再次点击没有效果
- (void)setHighlighted:(BOOL)highlighted
{
    // [super setHighlighted:highlighted];
}
@end
