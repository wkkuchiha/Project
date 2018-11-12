//
//  UIView+CustomMethod.h
//  MiuTrip
//
//  Created by MiutripMacMini on 15/7/2.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface UIView(CustomMethod)

//缩放
- (void)setScaleX:(CGFloat)sx scaleY:(CGFloat)sy;

//设置阴影
- (void)setShaowColor:(UIColor*)color offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius;

//设置边框颜色
- (void)setBorderColor:(UIColor*)color width:(CGFloat)width;

// 设置圆角
- (void)setCornerRadius:(CGFloat)radius;

// 创建line的方法,参数可为UIColor或者UIImage(image需要自己进行拉伸操作)
- (UIView*)createLineWithColor:(UIColor*)color frame:(CGRect)frame;

// 获取某个UIView的实例相对于最下层视图的frame
- (CGRect)getViewFrameInBaseView;
//在父view中的位置大小
- (CGRect)frameInSuperview:(CGRect)rect;


@end
