//
//  UICustomItemView.h
//  控件系数-03
//
//  Created by 张玺 on 16/8/1.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICustomItemView : UIView
/**
 *  存放标题
 */
@property (nonatomic,strong) NSMutableArray  * titileData;
/**
 *  存放标题下对应内容，和标题一一对应
 */
@property (nonatomic,strong) NSMutableArray  * contentData;
- (instancetype)initWithFrame:(CGRect)frame;

@end
