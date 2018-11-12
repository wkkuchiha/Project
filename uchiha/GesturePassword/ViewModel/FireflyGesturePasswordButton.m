//
//  FireflyGesturePasswordButton.m
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "FireflyGesturePasswordButton.h"
#define bounds self.bounds
@implementation FireflyGesturePasswordButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _success = YES;
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (_selected)
    {
        if (_success)
        {
            CGContextSetRGBStrokeColor(context, 2 / 255.f, 174 / 255.f, 240 / 255.f, 1);//线条颜色
            CGContextSetRGBFillColor(context, 2 / 255.f, 174 / 255.f, 240 / 255.f, 1);
        }
        else
        {
            CGContextSetRGBStrokeColor(context, 208 / 255.f, 36 / 255.f, 36 / 255.f, 1);//线条颜色
            CGContextSetRGBFillColor(context, 208 / 255.f, 36 / 255.f, 36 / 255.f, 1);
        }
        //小圆圈大小
        CGRect frame = CGRectMake(bounds.size.width / 2 - bounds.size.width / 8 + 1,
                                  bounds.size.height / 2 - bounds.size.height / 8,
                                  bounds.size.width / 4,
                                  bounds.size.height / 4);
        CGContextAddEllipseInRect(context, frame);
        CGContextFillPath(context);
        
    }
    else
    {
        CGContextSetRGBStrokeColor(context, 1, 1, 1, 1);//线条颜色
    }
    
    CGContextSetLineWidth(context, 2);
    CGRect frame =  CGRectMake(2, 2, bounds.size.width - 3, bounds.size.height - 3);
    CGContextAddEllipseInRect(context, frame);
    CGContextStrokePath(context);
    
    if (_success)
    {
        CGContextSetRGBFillColor(context, 30 / 255.f, 175 / 255.f, 235 / 255.f, 0.3);
    }
    else
    {
        CGContextSetRGBFillColor(context, 208 / 255.f, 36 / 255.f, 36 / 255.f, 0.3);
    }
    CGContextAddEllipseInRect(context, frame);
    
    if (_selected)
    {
        CGContextFillPath(context);
    }
}

@end

