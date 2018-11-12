
//
//  FireflyTentacleView.m
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "FireflyTentacleView.h"
#import "FireflyGesturePasswordButton.h"

@interface FireflyTentacleView()
{
    CGPoint lineStartPoint;
    CGPoint lineEndPoint;
    
    NSMutableArray * touchesArray;
    NSMutableArray * touchedArray;
    BOOL success;
}

@end


@implementation FireflyTentacleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        touchesArray = [[NSMutableArray alloc]initWithCapacity:0];
        touchedArray = [[NSMutableArray alloc]initWithCapacity:0];
        
        [self setBackgroundColor:[UIColor clearColor]];
        [self setUserInteractionEnabled:YES];
        success = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint;
    UITouch *touch = [touches anyObject];
    [touchesArray removeAllObjects];
    [touchedArray removeAllObjects];
    //手势开始
    [self.touchBeginDelegate gestureTouchBegin];
    
    success = YES;
    if (touch)
    {
        touchPoint = [touch locationInView:self];
        for (int i = 0 ; i < self.buttonArray.count; i++)
        {
            FireflyGesturePasswordButton *buttonTemp  = (FireflyGesturePasswordButton *)[self.buttonArray objectAtIndex:i];
            buttonTemp.selected = NO;
            buttonTemp.success = YES;
            
            if (CGRectContainsPoint(buttonTemp.frame, touchPoint))
            {
                CGRect frameTemp = buttonTemp.frame;
                CGPoint point = CGPointMake(frameTemp.origin.x + frameTemp.size.width / 2,
                                            frameTemp.origin.y + frameTemp.size.height / 2);
                
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [NSString stringWithFormat:@"%f",point.x],@"x",
                                      [NSString stringWithFormat:@"%f",point.y],@"y", nil];
                [touchesArray addObject:dict];
                lineStartPoint = touchPoint;
            }
            [buttonTemp setNeedsDisplay];
        }
        [self setNeedsDisplay];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint;
    UITouch *touch = [touches anyObject];
    if (touch)
    {
        touchPoint = [touch locationInView:self];
        for (int i = 0; i < self.buttonArray.count; i++)
        {
            FireflyGesturePasswordButton *buttonTemp  = (FireflyGesturePasswordButton *)[self.buttonArray objectAtIndex:i];
            if (CGRectContainsPoint(buttonTemp.frame,touchPoint ))
            {
                if ([touchedArray containsObject:[NSString stringWithFormat:@"num%d",i]])
                {
                    lineEndPoint = touchPoint;
                    [self setNeedsDisplay];
                    return;
                }
                [touchedArray addObject:[NSString stringWithFormat:@"num%d",i]];
                buttonTemp.selected = YES;
                [buttonTemp setNeedsDisplay];
                CGRect frameTemp = buttonTemp.frame;
                CGPoint point = CGPointMake(frameTemp.origin.x + frameTemp.size.width / 2 ,
                                            frameTemp.origin.y + frameTemp.size.height / 2);
                NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                                      [NSString stringWithFormat:@"%f",point.x],@"x",
                                      [NSString stringWithFormat:@"%f",point.y],@"y",
                                      [NSString stringWithFormat:@"%d",i] , @"num",nil];
                
                [touchesArray addObject:dict];
                break;
            }
            
        }
        lineEndPoint = touchPoint;
        [self setNeedsDisplay];
    }
}


- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //结果str
    NSMutableString *resultStr = [NSMutableString string];
    for (NSDictionary *num in  touchesArray)
    {
        if (![num objectForKey:@"num"])
            break;
        [resultStr appendString:[num objectForKey:@"num"]];
    }
    
    [self.delegate operationWithStyle:self.style result:resultStr];
    
    //    if (self.style == verifyGesturePassword)
    //    {
    //        //验证
    //        [self.delegate verifyPassword:resultStr];
    //
    //    }
    //    else if(self.style == setGesturePassword) //重新设置密码
    //    {
    //        //重设密码
    //        [self.delegate resetPassword:resultStr];
    //    }
    //    else if(self.style == updateGesturePassword) //修改密码
    //    {
    //        //重设密码
    //        [self.delegate u:resultStr];
    //    }
    
    
    
}

//根据判断的结果 来重新显示 按钮的颜色和状态
- (void)refreshViews:(BOOL)result
{
    for (int i=0 ; i < touchesArray.count; i++)
    {
        NSInteger selection = [[[touchesArray objectAtIndex:i] objectForKey:@"num"] intValue];
        FireflyGesturePasswordButton *buttonTemp  = (FireflyGesturePasswordButton *)[self.buttonArray objectAtIndex:selection];
        buttonTemp.success = result;
        [buttonTemp setNeedsDisplay];
    }
    
    [self setNeedsDisplay];
    [self enterArgin];
}

- (void)drawRect:(CGRect)rect
{
    for (int i = 0 ; i < touchesArray.count; i++)
    {
        CGContextRef context = UIGraphicsGetCurrentContext();
        if(![[touchesArray objectAtIndex:i] objectForKey:@"num"])
        {
            [touchesArray removeObjectAtIndex:i];
            continue;
        }
        
        if (success)
        {
            CGContextSetRGBStrokeColor(context, 2 / 255.f, 174 / 255.f, 240 / 255.f, 0.7);//线条颜色
        }
        else
        {
            CGContextSetRGBStrokeColor(context, 208 / 255.f, 36 / 255.f, 36 / 255.f, 0.7);//线条颜色
        }
        
        CGContextSetLineWidth(context, 5);
        CGContextMoveToPoint(context,
                             [[[touchesArray objectAtIndex:i] objectForKey:@"x"] floatValue],
                             [[[touchesArray objectAtIndex:i] objectForKey:@"y"] floatValue]);
        
        if (i < touchesArray.count - 1)
        {
            CGContextAddLineToPoint(context,
                                    [[[touchesArray objectAtIndex:i+1] objectForKey:@"x"] floatValue],
                                    [[[touchesArray objectAtIndex:i+1] objectForKey:@"y"] floatValue]);
        }
        else
        {
            if (success)
            {
                CGContextAddLineToPoint(context, lineEndPoint.x,lineEndPoint.y);
            }
        }
        
        CGContextStrokePath(context);
    }
}

- (void)enterArgin
{
    [touchesArray removeAllObjects];
    [touchedArray removeAllObjects];
    for (int i = 0; i < self.buttonArray.count ; i++)
    {
        FireflyGesturePasswordButton *buttonTemp = (FireflyGesturePasswordButton *)[self.buttonArray objectAtIndex:i];
        [buttonTemp setSelected:NO];
        [buttonTemp setSuccess:YES];
        [buttonTemp setNeedsDisplay];
    }
    [self setNeedsDisplay];
}

@end
