//
//  RefreshLayer.m
//  MiuTrip
//
//  Created by Miutrip on 2016/9/9.
//  Copyright © 2016年 apple. All rights reserved.
//

#import "RefreshLayer.h"


@interface RefreshLayer()
{
    CGFloat _lineWidth;
    CGFloat _lineLength;
    CGFloat _defautRadius;
    CGFloat _left,_top,_right,_moveDistance;
    CGFloat _centerX,_centerY;
    CGFloat _angle;
}
@end


@implementation RefreshLayer


-(instancetype)init
{
    self = [super init];
    if(self){
        _lineWidth = 1.3f;
        _defautRadius = 6.0f;
    }
    return self;
}

+(BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progress"]) {
        return YES;
    } else if ([key isEqualToString:@"color"]) {
        return YES;
    } else if ([key isEqualToString:@"lineWidth"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSaveGState(ctx);
    CGContextSetShouldAntialias(ctx, true);
    CGContextSetAllowsAntialiasing(ctx, true);
    CGContextSetFillColorWithColor(ctx, ClearColor.CGColor);
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    CGContextSetLineWidth(ctx, _lineWidth);
                                     
    if(_state == PULL_TO_TRANSITION){
        [self drawPullStateWithContext:ctx];
    }
    
    if(_state == PULL_TO_ARC){
        [self drawPullState2WithContext:ctx];
    }
    
    if(_state == RELEASED || _state == LOADING){
        [self drawReleaseStateWithContext:ctx];
    }
    CGContextDrawPath(ctx,kCGPathStroke);
    CGContextRestoreGState(ctx);
}

-(void)startLoaingAnimation
{
    
    if(_state != RELEASED || _state == LOADING){
        return;
    }
    [self playRotateAnimation];
    _state = LOADING;
}


-(void)displayAndLoaing
{
    [self initData];
    _state = LOADING;
    [self setNeedsDisplay];
    [self playRotateAnimation];
}

-(void)setProgress:(CGFloat)progress
{
    _progress = progress;
    if(_state == PULL_TO_TRANSITION && _progress > 0.5){
        _state = PULL_TO_ARC;
    }
    
    if(_state == PULL_TO_ARC && _progress <= 0.5){
        _state = PULL_TO_TRANSITION;
    }
    
    if(_state == PULL_TO_ARC){
        _angle = (_progress-0.5)*2*150;
        if(_angle >= 150){
            _angle = 150;
            _state = RELEASED;
        }
    }
    [self setNeedsDisplay];
}

-(void)reset
{
    self.progress = 0;
    _angle = 0;
    _state = PULL_TO_TRANSITION;
    [self setNeedsDisplay];
}

-(void)initData
{
    if(_lineLength == 0){
        CGFloat width = self.bounds.size.width;
        CGFloat height = self.bounds.size.height;
        
        _centerX = self.bounds.size.width/2;
        _centerY = self.bounds.size.height/2;
        
        _lineLength = _defautRadius*2;
        
        _left = (width - _defautRadius*2)/2.0;
        _top = (height - _defautRadius*2)/2.0;
        _right = _left + _defautRadius*2;
        _moveDistance = _lineLength/2+_top+2;
    }
}

-(void)playRotateAnimation
{
    CABasicAnimation *rotateAnimation = [[CABasicAnimation alloc] init];
    rotateAnimation.keyPath = @"transform.rotation.z";
    rotateAnimation.removedOnCompletion = NO;
    rotateAnimation.duration = 0.8;
    rotateAnimation.repeatCount = CGFLOAT_MAX;
    rotateAnimation.fillMode = kCAFillModeRemoved;
    rotateAnimation.fromValue = [NSNumber numberWithFloat:0.0];
    rotateAnimation.toValue = [NSNumber numberWithFloat:2*M_PI];
    [self addAnimation:rotateAnimation forKey:nil];
}


-(void)drawPullStateWithContext:(CGContextRef)ctx
{
    [self initData];
    
    CGFloat leftLineY = self.bounds.size.height+2.0f-_moveDistance*_progress*2;
    CGFloat rightLineY = -_lineLength-2+_moveDistance*_progress*2;
    
    CGContextMoveToPoint(ctx, _left, leftLineY);
    CGContextAddLineToPoint(ctx, _left, leftLineY+_lineLength);
    
    CGContextMoveToPoint(ctx, _right, rightLineY);
    CGContextAddLineToPoint(ctx, _right, rightLineY+_lineLength);
    
    CGContextMoveToPoint(ctx, _left-2, leftLineY+2);
    CGContextAddLineToPoint(ctx,_left,leftLineY);
    
    CGContextMoveToPoint(ctx, _right+2, rightLineY+_lineLength-2);
    CGContextAddLineToPoint(ctx,_right,rightLineY+_lineLength);
    
}

-(void)drawPullState2WithContext:(CGContextRef)ctx
{
    CGFloat radian = M_PI/180.0*(180+_angle);
    CGFloat rx = cos(radian)*_defautRadius;
    CGFloat ry = sin(radian)*_defautRadius;
    
    CGFloat lx = _centerX + rx - 3*sin((_angle+30)/180.0 * M_PI);
    CGFloat ty = _centerY + ry + 3*cos((_angle+30)/180.0 * M_PI);
    
    CGFloat radian2 = M_PI/180.0*_angle;
    CGFloat rx2 = cos(radian2)*_defautRadius;
    CGFloat ry2 = sin(radian2)*_defautRadius;
    
    CGFloat ra2x = _centerX + rx2 + 3*cos((_angle-60)/180.0 * M_PI);
    CGFloat ra2y = _centerY + ry2 + 3*sin((_angle-60)/180.0 * M_PI);
    
    //left line
    CGFloat bottom = self.bounds.size.height-_top+_defautRadius;
    CGContextMoveToPoint(ctx,_left,bottom-(_angle/150.0*_lineLength));
    CGContextAddLineToPoint(ctx,_left,bottom-_lineLength);
    
    //right line
    CGContextMoveToPoint(ctx,_right,_top-_defautRadius+(_angle/150.0*_lineLength));
    CGContextAddLineToPoint(ctx,_right,_top-_defautRadius+_lineLength);
    
    //lef arrow
    CGContextMoveToPoint(ctx,lx,ty);
    CGContextAddLineToPoint(ctx,_centerX + rx,_centerY + ry);
    
    //right arrow
    CGContextMoveToPoint(ctx,ra2x,ra2y);
    CGContextAddLineToPoint(ctx,_centerX + rx2,_centerY+ry2);
    
    //bottom arc
    CGContextMoveToPoint(ctx,_centerX+_defautRadius,_centerY);
    CGContextAddArc(ctx,_centerX, _centerY, _defautRadius, 0, _angle/180.0*M_PI, false);
    //top arc
    CGContextMoveToPoint(ctx,_left,_centerY);
    CGContextAddArc(ctx,_centerX, _centerY, _defautRadius,M_PI,_angle/180.0*M_PI-M_PI,false);
}

-(void)drawReleaseStateWithContext:(CGContextRef)ctx
{
    CGFloat radian = M_PI/180.0*330.0;
    CGFloat rx = cos(radian)*_defautRadius;
    CGFloat ry = sin(radian)*_defautRadius;
    
    CGFloat radian2 = M_PI/180.0*150.0;
    CGFloat rx2 = cos(radian2)*_defautRadius;
    CGFloat ry2 = sin(radian2)*_defautRadius;
    
    CGFloat ra2x = _centerX + rx2 + 3*cos(90/180.0 * M_PI);
    CGFloat ra2y = _centerY + ry2 + 3*sin(90/180.0 * M_PI);
    
    CGContextMoveToPoint(ctx,_centerX + rx - 3*sin(M_PI),_centerY + ry + 3*cos(M_PI));
    CGContextAddLineToPoint(ctx,_centerX + rx,_centerY + ry);
    
    CGContextMoveToPoint(ctx,ra2x,ra2y);
    CGContextAddLineToPoint(ctx,_centerX + rx2,_centerY+ry2);
    
    CGContextMoveToPoint(ctx,_left,_centerY);
    CGContextAddArc(ctx,_centerX,_centerY,_defautRadius,M_PI,150.0/180.0*M_PI-M_PI,false);
    
    CGContextMoveToPoint(ctx,_centerX+_defautRadius,_centerY);
    CGContextAddArc(ctx,_centerX,_centerY,_defautRadius, 0, 150.0/180.0*M_PI,false);
}



@end
