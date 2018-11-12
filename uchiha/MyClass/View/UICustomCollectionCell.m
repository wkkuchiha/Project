//
//  UICustomCollectionCell.m
//  控件系数-03
//
//  Created by 张玺 on 16/8/2.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "UICustomCollectionCell.h"
#import "UIView+Extension.h"
@implementation UICustomCollectionCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}
- (void)initView
{
    _titleLB = [[UILabel  alloc]initWithFrame:CGRectMake(8, 6, self.contentView.width-4, 15)];
    [self.contentView  addSubview:_titleLB];
    _titleLB.font = [UIFont  systemFontOfSize:13];
    _titleLB.textColor = [UIColor  grayColor];
    //_titleLB.text = @"起飞日期";
    
    _contentLB = [[UILabel  alloc]initWithFrame:CGRectMake(_titleLB.x, 15+4+6, self.contentView.width-4, 17)];
    [self.contentView addSubview:_contentLB];
    _contentLB.font  = [UIFont  systemFontOfSize:15];
    _contentLB.textColor = [UIColor  blackColor];
    //_contentLB.text = @"2016年12月23日";
}
- (void)setItemTitleWithData:(NSString *)str
{
    _titleLB.text = str;
}
- (void)setItemContentWithData:(NSString *)str
{
    _contentLB.text = str;
}
@end
