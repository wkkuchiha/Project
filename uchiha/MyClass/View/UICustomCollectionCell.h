//
//  UICustomCollectionCell.h
//  控件系数-03
//
//  Created by 张玺 on 16/8/2.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICustomCollectionCell : UICollectionViewCell
@property (nonatomic,strong) UILabel * titleLB;

@property (nonatomic,strong) UILabel * contentLB;

- (instancetype)initWithFrame:(CGRect)frame;

- (void)setItemTitleWithData:(NSString *)str;

- (void)setItemContentWithData:(NSString *)str;
@end
