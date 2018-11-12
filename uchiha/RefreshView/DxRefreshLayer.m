//
//  DxRefreshLayer.m
//  uchiha
//
//  Created by uchiha on 2017/8/18.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "DxRefreshLayer.h"

const static CGFloat MAX_ANGLE = 150.0f;
const static CGFloat ARROW_LENGTH = 3.0f;

@interface DxRefreshLayer()

@property(nonatomic,assign) CGFloat lineLength;
@property(nonatomic,assign) CGFloat left,top,right;
@property(nonatomic,assign) CGFloat moveDistance;
@property(nonatomic,assign) CGFloat centerX,centerY;
@property(nonatomic,assign) CGFloat angle,rotateAngle;
@property(nonatomic,assign) CGFloat height;

@end

@implementation DxRefreshLayer

-(instancetype)init
{
    self = [super init];
    if(self){
        _lineWidth = 1.3f;
        _arcRadius = 6.0f;
        _rotateAngle = 0;
        _state = PULL_TO_TRANSITION;
    }
    return self;
}

+(BOOL)needsDisplayForKey:(NSString *)key {
    if ([@"progress" isEqualToString:key] || [@"color" isEqualToString:key] ||[@"lineWidth" isEqualToString:key] || [@"arcRadius" isEqualToString:key]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

- (void)drawInContext:(CGContextRef)ctx
{
    CGContextSaveGState(ctx);
    CGContextSetShouldAntialias(ctx, true);
    CGContextSetAllowsAntialiasing(ctx, true);
    CGContextSetFillColorWithColor(ctx, [UIColor clearColor].CGColor);
    CGContextSetStrokeColorWithColor(ctx, self.color.CGColor);
    CGContextSetLineWidth(ctx, _lineWidth);
    
    if(_state == PULL_TO_TRANSITION){
        [self drawPullDownArrowWithContext:ctx];
    }
    
    if(_state == PULL_TO_ARC){
        [self drawLineToArcWithContext:ctx];
    }
    
    if(_state == PULL_TO_ROTATE || _state == LOADING){
        [self drawReleaseStateWithContext:ctx];
    }
    CGContextDrawPath(ctx,kCGPathStroke);
    CGContextRestoreGState(ctx);
}


#pragma mark ----- public

-(void)startLoaingAnimation
{
    if(_state == LOADING){
        return;
    }
    [self playRotateAnimation];
    _state = LOADING;
}

-(void)beginRefreshing
{
    [self initData];
    _state = LOADING;
    [self setNeedsDisplay];
    [self playRotateAnimation];
}

-(void)reset
{
    self.contentOffsetY = 0;
    _angle = 0;
    _state = PULL_TO_TRANSITION;
    [self setNeedsDisplay];
}

#pragma mark ----- private
-(void)initData
{
    if(_lineLength == 0){
        CGFloat width = self.bounds.size.width;
        _height = self.bounds.size.height;
        
        _centerX = self.bounds.size.width/2;
        _centerY = self.bounds.size.height/2;
        
        _lineLength = _arcRadius*2;
        
        _left = (width - _lineLength)/2.0;
        _top = (_height - _lineLength)/2.0;
        _right = _left + _lineLength;
        _moveDistance = _lineLength/2+_top;
    }
}

-(void)setContentOffsetY:(CGFloat)contentOffsetY
{
    _contentOffsetY = contentOffsetY;
    CGFloat rate = _contentOffsetY/self.bounds.size.height;
    if(rate < 0.5){
        _state = PULL_TO_TRANSITION;
        _angle = 0;
    }
    
    if(rate >= 0.5 && rate <= 1){
        _state = PULL_TO_ARC;
        _angle = (rate-0.5)*2*MAX_ANGLE;
    }
    
    if(rate > 1){
        _state = PULL_TO_ROTATE;
        _angle = MAX_ANGLE;
        _rotateAngle = (rate-1.0)*180;
    }
    
    [self setNeedsDisplay];
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


-(void)drawPullDownArrowWithContext:(CGContextRef)ctx
{
    [self initData];
    
    CGFloat leftLineY = self.bounds.size.height+2.0f-_moveDistance*_contentOffsetY/_height*2;
    CGFloat rightLineY = -_lineLength-2+_moveDistance*_contentOffsetY/_height*2;
    
    CGContextMoveToPoint(ctx, _left, leftLineY);
    CGContextAddLineToPoint(ctx, _left, leftLineY+_lineLength);
    
    CGContextMoveToPoint(ctx, _right, rightLineY);
    CGContextAddLineToPoint(ctx, _right, rightLineY+_lineLength);
    
    CGContextMoveToPoint(ctx, _left-2, leftLineY+2);
    CGContextAddLineToPoint(ctx,_left,leftLineY);
    
    CGContextMoveToPoint(ctx, _right+2, rightLineY+_lineLength-2);
    CGContextAddLineToPoint(ctx,_right,rightLineY+_lineLength);
    
}

-(void)drawLineToArcWithContext:(CGContextRef)ctx
{
    CGFloat radian = [self angleToRadian:180+_angle];
    CGFloat radian2 = [self angleToRadian:_angle];
    
    CGFloat leftArrowRadian = [self angleToRadian:_angle+30];
    CGFloat rx = [self getXFromRadian:radian];
    CGFloat ry = [self getYFromRadian:radian];
    CGFloat lx = rx - ARROW_LENGTH * sin(leftArrowRadian);
    CGFloat ty = ry + ARROW_LENGTH * cos(leftArrowRadian);
    
    CGFloat rightArrowRadian = [self angleToRadian:_angle-60];
    CGFloat rx2 = [self getXFromRadian:radian2];
    CGFloat ry2 = [self getYFromRadian:radian2];
    CGFloat ra2x = rx2 + ARROW_LENGTH * cos(rightArrowRadian);
    CGFloat ra2y = ry2 + ARROW_LENGTH * sin(rightArrowRadian);
    
    //left line
    CGFloat bottom = self.bounds.size.height-_top+_arcRadius;
    CGContextMoveToPoint(ctx,_left,bottom-(_angle/MAX_ANGLE*_lineLength));
    CGContextAddLineToPoint(ctx,_left,bottom-_lineLength);
    
    //right line
    CGContextMoveToPoint(ctx,_right,_top-_arcRadius+(_angle/MAX_ANGLE*_lineLength));
    CGContextAddLineToPoint(ctx,_right,_top-_arcRadius+_lineLength);
    
    //lef arrow
    CGContextMoveToPoint(ctx,lx,ty);
    CGContextAddLineToPoint(ctx,rx,ry);
    
    //right arrow
    CGContextMoveToPoint(ctx,ra2x,ra2y);
    CGContextAddLineToPoint(ctx,rx2,ry2);
    
    //bottom arc
    CGContextMoveToPoint(ctx,_centerX+_arcRadius,_centerY);
    CGContextAddArc(ctx,_centerX, _centerY, _arcRadius, 0, _angle/180.0*M_PI, false);
    //top arc
    CGContextMoveToPoint(ctx,_left,_centerY);
    CGContextAddArc(ctx,_centerX, _centerY, _arcRadius,M_PI,_angle/180.0*M_PI-M_PI,false);
}

-(void)drawReleaseStateWithContext:(CGContextRef)ctx
{
    
    CGFloat startRadian = M_PI+[self angleToRadian:_rotateAngle];
    CGFloat endRadian = MAX_ANGLE/180.0*M_PI-M_PI+[self angleToRadian:_rotateAngle];
    
    CGFloat startRadian2 = [self angleToRadian:_rotateAngle];
    CGFloat endRadian2 = MAX_ANGLE/180.0*M_PI+startRadian2;
    
    CGFloat leftArrowEndRadian = [self angleToRadian:MAX_ANGLE+_rotateAngle+30];
    CGFloat rx = [self getXFromRadian:endRadian];
    CGFloat ry = [self getYFromRadian:endRadian];
    CGFloat rax = rx - ARROW_LENGTH * sin(leftArrowEndRadian);
    CGFloat ray = ry + ARROW_LENGTH * cos(leftArrowEndRadian);
    
    CGFloat rightArrowEndRadian = [self angleToRadian:MAX_ANGLE+_rotateAngle-60];
    CGFloat rx2 = [self getXFromRadian:endRadian2];
    CGFloat ry2 = [self getYFromRadian:endRadian2];
    CGFloat ra2x = rx2 + ARROW_LENGTH * cos(rightArrowEndRadian);
    CGFloat ra2y = ry2 + ARROW_LENGTH * sin(rightArrowEndRadian);
    
    CGContextMoveToPoint(ctx,rax,ray);
    CGContextAddLineToPoint(ctx,rx,ry);
    
    CGContextMoveToPoint(ctx,ra2x,ra2y);
    CGContextAddLineToPoint(ctx,rx2,ry2);
    
    CGContextMoveToPoint(ctx,[self getXFromRadian:startRadian],[self getYFromRadian:startRadian]);
    CGContextAddArc(ctx,_centerX,_centerY,_arcRadius,startRadian,endRadian,false);
    
    CGContextMoveToPoint(ctx,[self getXFromRadian:startRadian2],[self getYFromRadian:startRadian2]);
    CGContextAddArc(ctx,_centerX,_centerY,_arcRadius, startRadian2, endRadian2,false);
}

-(CGFloat)angleToRadian:(CGFloat)angle
{
    return angle / 180.0 * M_PI;
}

-(CGFloat)getXFromRadian:(CGFloat)radian
{
    return _centerX + cos(radian)*_arcRadius;
}

-(CGFloat)getYFromRadian:(CGFloat)radian
{
    return _centerY + sin(radian)*_arcRadius;
}


@end
