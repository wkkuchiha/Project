//
//  UIView+CustomMethod.m
//  MiuTrip
//
//  Created by MiutripMacMini on 15/7/2.
//  Copyright (c) 2015年 apple. All rights reserved.
//

#import "UIView+CustomMethod.h"

@implementation UIView(CustomMethod)

- (void)setScaleX:(CGFloat)sx scaleY:(CGFloat)sy
{
    CGAffineTransform currentTransform = self.transform;
    CGAffineTransform newTransform     = CGAffineTransformScale(currentTransform, sx, sy);
    [self setTransform:newTransform];
}

- (void)setShaowColor:(UIColor*)color offset:(CGSize)offset opacity:(CGFloat)opacity radius:(CGFloat)radius
{
    [self.layer setShadowColor:color.CGColor];
    [self.layer setShadowOffset:offset];
    [self.layer setShadowOpacity:opacity];
    [self.layer setShadowRadius:radius];
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
}

- (void)setBorderColor:(UIColor*)color width:(CGFloat)width
{
    [self.layer setBorderColor:color.CGColor];
    [self.layer setBorderWidth:width];
}

- (void)setCornerRadius:(CGFloat)radius
{
    if (radius > 0) {
        [self.layer setMasksToBounds:YES];
        [self.layer setCornerRadius:radius];
    }else{
        [self.layer setMasksToBounds:NO];
        [self.layer setCornerRadius :radius];
    }
}

- (UIView*)createLineWithColor:(UIColor*)color frame:(CGRect)frame
{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    [line setBackgroundColor:color];
    [line setAlpha:0.5];
    [self addSubview:line];
    return line;
}

- (CGRect)getViewFrameInBaseView
{
    CGRect frame = self.frame;
    UIView *elemView = self;
    while (elemView.superview) {
        elemView = elemView.superview;
        frame.origin.x += elemView.frame.origin.x;
        frame.origin.y += elemView.frame.origin.y;
    }
    return frame;
}

- (CGRect)frameInSuperview:(CGRect)rect
{
    CGRect frame = rect;
    UIView *elemView = self;
    while (elemView.superview) {
        elemView = elemView.superview;
        frame.origin.x += elemView.frame.origin.x;
        frame.origin.y += elemView.frame.origin.y;
    }
    return frame;
}

@end
