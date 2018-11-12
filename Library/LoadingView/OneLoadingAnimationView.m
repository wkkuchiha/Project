//
//  OneLoadingAnimation.m
//  OneLoadingAnimationStep1
//
//  Created by thatsoul on 15/11/15.
//  Copyright © 2015年 chenms.m2. All rights reserved.
//

#import "OneLoadingAnimationView.h"
#import "ArcToCircleLayer.h"

static NSString * const kName = @"name";


@interface OneLoadingAnimationView ()

@property (nonatomic) CGFloat kRadius;
@property (nonatomic) CGFloat kLineWidth;
@property (nonatomic) CGFloat symbolLineWidth;


@property (nonatomic) ArcToCircleLayer *arcToCircleLayer;
@property (nonatomic) CAShapeLayer *moveArcLayer;
@property (nonatomic) CAShapeLayer *horizontalAppearLayer;;
@property (nonatomic) CAShapeLayer *checkMarkLayer;
@property (nonatomic) CAShapeLayer *exclamationMarkTopLayer;
@property (nonatomic) CAShapeLayer *exclamationMarkBottomLayer;

@end

@implementation OneLoadingAnimationView

#pragma mark - life cycle
-(instancetype)initStyle:(LoadingViewStyle)style
{
    switch (style) {
        case LargeStyle:
            self = [super initWithFrame:CGRectMake(0, 0, 44, 44)];
            _kRadius = 20;
            _kLineWidth = 2;
            _symbolLineWidth = 4;
            break;
        case SmallStyle:
            self = [super initWithFrame:CGRectMake(0, 0, 36, 36)];
            _kRadius = 16;
            _kLineWidth = 2;
            _symbolLineWidth = 2;
            break;
        case ExtraSmallStyle:
            self = [super initWithFrame:CGRectMake(0, 0, 24, 24)];
            _kRadius = 10;
            _kLineWidth = 2;
            _symbolLineWidth = 2;
            break;
        default:
            break;
    }
    if(self){
        _normalColor = DarkGrayColor;
//        self.successColor = trainNormalColor;
//        self.errorColor = [UIColor colorWithRed:0xff/255.0 green:0x61/255.0 blue:0x51/255.0 alpha:1.0];
    }
    return self;
}

#pragma mark - public
- (void)startAnimation
{
    _state = stateLoading;
    [self reset];
    [self start];
}

-(void)stopAnimating
{
    if(self.arcToCircleLayer){
        [self.arcToCircleLayer removeAllAnimations];
    }
    [self reset];
}


#pragma mark - reset
- (void)reset {
    [self.arcToCircleLayer removeFromSuperlayer];
    [self.moveArcLayer removeFromSuperlayer];
    [self.checkMarkLayer removeFromSuperlayer];
    [self.exclamationMarkTopLayer removeFromSuperlayer];
    [self.exclamationMarkBottomLayer removeFromSuperlayer];
    [self.horizontalAppearLayer removeFromSuperlayer];
    [self.layer removeAllAnimations];
    self.layer.sublayers = nil;
}

#pragma mark - step1
- (void)start {
    self.arcToCircleLayer = [ArcToCircleLayer layer];
    self.arcToCircleLayer.contentsScale = [UIScreen mainScreen].scale;
    self.arcToCircleLayer.color = self.normalColor;
    self.arcToCircleLayer.lineWidth = _kLineWidth;
    self.arcToCircleLayer.bounds = CGRectMake(0, 0, _kRadius * 2 + _kLineWidth, _kRadius * 2 + _kLineWidth);
    self.arcToCircleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    [self.layer addSublayer:self.arcToCircleLayer];

    // end status
    self.arcToCircleLayer.progress = 0.9;

    // animation
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 1.2;
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:0.9];
    animation.delegate = self;
    [animation setValue:@"start" forKey:kName];
    [self.arcToCircleLayer addAnimation:animation forKey:nil];
    
    [self rotateArc];
}

-(void)rotateArc
{
    // 对Y轴进行旋转（指定Z轴的话，就和UIView的动画一样绕中心旋转）
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.removedOnCompletion = NO;
    // 设定动画选项
    animation.duration = 0.8; // 持续时间
    animation.repeatCount = INFINITY; // 重复次数
    // 设定旋转角度
    animation.fillMode = kCAFillModeForwards;
    animation.fromValue = [NSNumber numberWithFloat:2*M_PI]; // 起始角度
    animation.toValue = [NSNumber numberWithFloat:0]; // 终止角度
    // 添加动画
    [self.arcToCircleLayer addAnimation:animation forKey:nil];
}

-(void)fillCircle
{
    self.arcToCircleLayer.progress = 1.0;
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"progress"];
    animation.duration = 0.3;
    animation.fromValue = @0.9;
    animation.toValue = @1.0;
    animation.delegate = self;
    animation.beginTime = 0.1;
    [animation setValue:@"fill" forKey:kName];
    [self.arcToCircleLayer addAnimation:animation forKey:nil];
}

- (void)toEmptyState{

    self.arcToCircleLayer.color = self.normalColor;
    self.horizontalAppearLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.horizontalAppearLayer];
    self.horizontalAppearLayer.frame = self.bounds;
    
    UIBezierPath *step4cPath = [UIBezierPath bezierPath];
    [step4cPath moveToPoint:CGPointMake(CGRectGetMidX(self.bounds)-_kRadius/2, CGRectGetMidY(self.bounds))];
    [step4cPath addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds)+_kRadius/2, CGRectGetMidY(self.bounds))];
    self.horizontalAppearLayer.path = step4cPath.CGPath;
    self.horizontalAppearLayer.lineWidth = _symbolLineWidth;
    self.horizontalAppearLayer.strokeColor = self.normalColor.CGColor;
    self.horizontalAppearLayer.fillColor = nil;
    
    // SS(strokeStart)
    CGFloat SSFrom = 0.5;
    CGFloat SSTo = 0;
    
    // SE(strokeEnd)
    CGFloat SEFrom = 0.5;
    CGFloat SETo = 1;
    
    // end status
    self.horizontalAppearLayer.strokeStart = 0;
    self.horizontalAppearLayer.strokeEnd = 1;
    
    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @(SSFrom);
    startAnimation.toValue = @(SSTo);
    
    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @(SEFrom);
    endAnimation.toValue = @(SETo);

    CAAnimationGroup *anima = [CAAnimationGroup animation];
    anima.animations = @[startAnimation, endAnimation];
    anima.duration = 0.3;
    anima.delegate = self;
    [anima setValue:@"showEmptySymbol" forKey:kName];
    [self.horizontalAppearLayer addAnimation:anima forKey:nil];
}

- (void)showEmptyStateNoAnimation{
    [self reset];
    self.arcToCircleLayer = [ArcToCircleLayer layer];
    self.arcToCircleLayer.contentsScale = [UIScreen mainScreen].scale;
    self.arcToCircleLayer.color = self.normalColor;
    self.arcToCircleLayer.lineWidth = _kLineWidth;
    self.arcToCircleLayer.bounds = CGRectMake(0, 0, _kRadius * 2 + _kLineWidth, _kRadius * 2 + _kLineWidth);
    self.arcToCircleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    [self.layer addSublayer:self.arcToCircleLayer];
    self.arcToCircleLayer.progress = 1.0f;
    
    self.horizontalAppearLayer = [CAShapeLayer layer];
    [self.layer addSublayer:self.horizontalAppearLayer];
    self.horizontalAppearLayer.frame = self.bounds;
    
    UIBezierPath *step4cPath = [UIBezierPath bezierPath];
    [step4cPath moveToPoint:CGPointMake(CGRectGetMidX(self.bounds)-_kRadius/2, CGRectGetMidY(self.bounds))];
    [step4cPath addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds)+_kRadius/2, CGRectGetMidY(self.bounds))];
    self.horizontalAppearLayer.path = step4cPath.CGPath;
    self.horizontalAppearLayer.lineWidth = _symbolLineWidth;
    self.horizontalAppearLayer.strokeColor = self.normalColor.CGColor;
    self.horizontalAppearLayer.fillColor = nil;
}

#pragma mark - success
- (void)toSuccessState {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * 1000 * NSEC_PER_MSEC)), dispatch_get_main_queue(), ^{
        self.arcToCircleLayer.color = self.normalColor;
        [self showDoneSymbol];
    });
}

// 对号出现
- (void)showDoneSymbol {
    self.checkMarkLayer = [CAShapeLayer layer];
    self.checkMarkLayer.frame = self.bounds;
    [self.layer addSublayer:self.checkMarkLayer];

    UIBezierPath *path = [UIBezierPath bezierPath];
    CGPoint centerPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    CGPoint firstPoint = centerPoint;
    firstPoint.x -= _kRadius / 2;
    [path moveToPoint:firstPoint];
    CGPoint secondPoint = centerPoint;
    secondPoint.x -=  _kRadius / 8;
    secondPoint.y += _kRadius / 2;
    [path addLineToPoint:secondPoint];
    CGPoint thirdPoint = centerPoint;
    thirdPoint.x += _kRadius / 2;
    thirdPoint.y -= _kRadius / 2;
    [path addLineToPoint:thirdPoint];

    self.checkMarkLayer.path = path.CGPath;
    self.checkMarkLayer.lineWidth = _symbolLineWidth;
    self.checkMarkLayer.strokeColor = self.normalColor.CGColor;
    self.checkMarkLayer.fillColor = nil;

    // end status
    CGFloat strokeEnd = 1;
    self.checkMarkLayer.strokeEnd = strokeEnd;

    // animation
    CABasicAnimation *step6bAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    step6bAnimation.duration = 0.4;
    step6bAnimation.fromValue = @0;
    step6bAnimation.toValue = @(strokeEnd);
    step6bAnimation.delegate = self;
    [step6bAnimation setValue:@"showDoneSymbol" forKey:kName];
    [self.checkMarkLayer addAnimation:step6bAnimation forKey:nil];
}

#pragma mark - step6 fail
- (void)toFailedState {
    //[self.verticalMoveLayer removeFromSuperlayer];
    [self.arcToCircleLayer removeAllAnimations];
    self.arcToCircleLayer.color = self.normalColor;
    [self showFailedTopLine];
    [self showFailedBottomLine];

}

// 叹号上半部分出现
- (void)showFailedTopLine{
    self.exclamationMarkTopLayer = [CAShapeLayer layer];
    self.exclamationMarkTopLayer.frame = self.bounds;
    [self.layer addSublayer:self.exclamationMarkTopLayer];

    CGFloat partLength = _kRadius * 2 / 8;
    CGFloat pathPartCount = 5;
    CGFloat visualPathPartCount = 4;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat originY = CGRectGetMidY(self.bounds) - _kRadius;
    CGFloat destY = originY + partLength * pathPartCount;
    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), originY)];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), destY)];
    self.exclamationMarkTopLayer.path = path.CGPath;
    self.exclamationMarkTopLayer.lineWidth = _symbolLineWidth;
    self.exclamationMarkTopLayer.strokeColor = self.normalColor.CGColor;
    self.exclamationMarkTopLayer.fillColor = nil;

    // end status
    CGFloat strokeStart = (pathPartCount - visualPathPartCount ) / pathPartCount;
    CGFloat strokeEnd = 1.0;
    self.exclamationMarkTopLayer.strokeStart = strokeStart;
    self.exclamationMarkTopLayer.strokeEnd = strokeEnd;

    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @0;
    startAnimation.toValue = @(strokeStart);

    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @0;
    endAnimation.toValue = @(strokeEnd);

    CAAnimationGroup *anima = [CAAnimationGroup animation];
    anima.animations = @[startAnimation, endAnimation];
    anima.duration = 0.6;
    anima.delegate = self;
    [anima setValue:@"showFailedSymbol" forKey:kName];
    [self.exclamationMarkTopLayer addAnimation:anima forKey:nil];
}

// 叹号下半部分出现
- (void)showFailedBottomLine {
    self.exclamationMarkBottomLayer = [CAShapeLayer layer];
    self.exclamationMarkBottomLayer.frame = self.bounds;
    [self.layer addSublayer:self.exclamationMarkBottomLayer];

    CGFloat partLength = _kRadius * 2 / 8;
    CGFloat pathPartCount = 2;
    CGFloat visualPathPartCount = 1;

    self.exclamationMarkBottomLayer.frame = self.bounds;
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat originY = CGRectGetMidY(self.bounds) + _kRadius;
    CGFloat destY = originY - partLength * pathPartCount;
    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), originY)];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), destY)];
    self.exclamationMarkBottomLayer.path = path.CGPath;
    self.exclamationMarkBottomLayer.lineWidth = _symbolLineWidth;
    self.exclamationMarkBottomLayer.strokeColor = self.normalColor.CGColor;
    self.exclamationMarkBottomLayer.fillColor = nil;

    // end status
    CGFloat strokeStart = (pathPartCount - visualPathPartCount ) / pathPartCount;
    CGFloat strokeEnd = 1.0;
    self.exclamationMarkBottomLayer.strokeStart = strokeStart;
    self.exclamationMarkBottomLayer.strokeEnd = strokeEnd;

    // animation
    CABasicAnimation *startAnimation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    startAnimation.fromValue = @0;
    startAnimation.toValue = @(strokeStart);

    CABasicAnimation *endAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    endAnimation.fromValue = @0;
    endAnimation.toValue = @(strokeEnd);

    CAAnimationGroup *anima = [CAAnimationGroup animation];
    anima.animations = @[startAnimation, endAnimation];
    anima.duration = 0.5;
    [self.exclamationMarkBottomLayer addAnimation:anima forKey:nil];
}

#pragma mark - shake
- (void)shakeFailedView {
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    anima.fromValue = @(-M_PI / 12);
    anima.toValue = @(M_PI / 12);
    anima.duration = 0.1;
    anima.autoreverses = YES;
    anima.repeatCount = 4;
    anima.delegate = self;
    [anima setValue:@"shakeFailedView" forKey:kName];
    [self.layer addAnimation:anima forKey:nil];
}

- (void)showFailedStateNoAnimation{
    
    [self reset];
    self.arcToCircleLayer = [ArcToCircleLayer layer];
    self.arcToCircleLayer.contentsScale = [UIScreen mainScreen].scale;
    self.arcToCircleLayer.color = self.normalColor;
    self.arcToCircleLayer.lineWidth = _kLineWidth;
    self.arcToCircleLayer.bounds = CGRectMake(0, 0, _kRadius * 2 + _kLineWidth, _kRadius * 2 + _kLineWidth);
    self.arcToCircleLayer.position = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
    [self.layer addSublayer:self.arcToCircleLayer];
    self.arcToCircleLayer.progress = 1.0f;
    
    self.exclamationMarkTopLayer = [CAShapeLayer layer];
    self.exclamationMarkTopLayer.frame = self.bounds;
    [self.layer addSublayer:self.exclamationMarkTopLayer];
    
    CGFloat partLength = _kRadius * 2 / 8;
    CGFloat visualPathPartCount = 4;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    CGFloat originY = CGRectGetMidY(self.bounds) - _kRadius + partLength;
    CGFloat destY = originY + partLength * 5 - visualPathPartCount;
    [path moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), originY)];
    [path addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), destY)];
    self.exclamationMarkTopLayer.path = path.CGPath;
    self.exclamationMarkTopLayer.lineWidth = _symbolLineWidth;
    self.exclamationMarkTopLayer.strokeColor = self.normalColor.CGColor;
    self.exclamationMarkTopLayer.fillColor = nil;
    self.exclamationMarkBottomLayer = [CAShapeLayer layer];
    self.exclamationMarkBottomLayer.frame = self.bounds;
    [self.layer addSublayer:self.exclamationMarkBottomLayer];
    
    UIBezierPath *bottomPath = [UIBezierPath bezierPath];
    CGFloat bOriginY = destY + partLength;
    CGFloat bDestY = bOriginY + _kRadius/4;
    [bottomPath moveToPoint:CGPointMake(CGRectGetMidX(self.bounds), bOriginY)];
    [bottomPath addLineToPoint:CGPointMake(CGRectGetMidX(self.bounds), bDestY)];
    self.exclamationMarkBottomLayer.path = bottomPath.CGPath;
    self.exclamationMarkBottomLayer.lineWidth = _symbolLineWidth;
    self.exclamationMarkBottomLayer.strokeColor = self.normalColor.CGColor;
    self.exclamationMarkBottomLayer.fillColor = nil;
}

-(void)toSuccessViewState
{
    _state = stateSuccess;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.6 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self fillCircle];
    });
}

-(void)toFailedViewState
{
    _state = stateFailed;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.6 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self fillCircle];
    });
}

-(void)toEmptyViewState
{
    _state = stateEmpty;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, 0.6 * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [self fillCircle];
    });
}

#pragma mark - animation step stop
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    NSString *name = [anim valueForKey:kName];
    
    if ([name isEqualToString:@"fill"]) {
        [self.arcToCircleLayer removeAllAnimations];
        if(_state == stateSuccess){
            [self toSuccessState];
            return;
        }
        
        if(_state == stateFailed){
            [self toFailedState];
            return;
        }
        
        [self toEmptyState];
     }
    
   if ([name isEqualToString:@"showFailedSymbol"]) {
       [self shakeFailedView];
       return;
    }
    
    if ([name isEqualToString:@"showDoneSymbol"] || [@"shakeFailedView" isEqualToString:name] || [@"showEmptySymbol" isEqualToString:name]) {
        if(_loadingAnimFinishedHandler){
            _loadingAnimFinishedHandler();
        }
    }

}

@end
