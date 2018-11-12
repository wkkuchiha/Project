//
//  EarningsViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/7/22.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "EarningsViewController.h"

@interface EarningsViewController ()

@end

@implementation EarningsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    UIView * baseView = [[UIView alloc] initWithFrame:CGRectMake(10, 100, self.view.bounds.size.width - 20, 200)];
    baseView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:baseView];
    
    CAGradientLayer * gradient = [CAGradientLayer layer];
    gradient.frame = CGRectMake(0, 0, baseView.width, baseView.height);
    gradient.colors = @[(__bridge id)[UIColor orangeColor].CGColor,(__bridge id)[UIColor whiteColor].CGColor];
    gradient.locations = @[@0,@0.88,@1.0];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    
    [baseView.layer addSublayer:gradient];
    
    UIBezierPath * shapeLayerPath = [[UIBezierPath alloc]init];
    CGFloat orginX = 10;
    CGFloat orginY = 10;
    CGFloat padding = 40;
    CGFloat height = baseView.height - 40;
    CGPoint point1 = CGPointMake(orginX, orginY);
    CGPoint point2 = CGPointMake(orginX+padding, [self randomPointY]);
    CGPoint point3 = CGPointMake(orginX+2*padding, [self randomPointY]);
    CGPoint point4 = CGPointMake(orginX+3*padding, [self randomPointY]);
    CGPoint point5 = CGPointMake(orginX+4*padding, [self randomPointY]);
    CGPoint point6 = CGPointMake(orginX+5*padding, [self randomPointY]);
    CGPoint point7 = CGPointMake(orginX+6*padding, [self randomPointY]);
    CGPoint point8 = CGPointMake(orginX+6*padding, orginY+height);
    CGPoint point9 = CGPointMake(orginX, orginY+height);
    [shapeLayerPath moveToPoint:point1];
    [shapeLayerPath addLineToPoint:point2];
    [shapeLayerPath addLineToPoint:point3];
    [shapeLayerPath addLineToPoint:point4];
    [shapeLayerPath addLineToPoint:point5];
    [shapeLayerPath addLineToPoint:point6];
    [shapeLayerPath addLineToPoint:point7];
    [shapeLayerPath addLineToPoint:point8];
    [shapeLayerPath addLineToPoint:point9];
    
    CAShapeLayer * shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = shapeLayerPath.CGPath;
    gradient.mask = shapeLayer;
    
    UIBezierPath * linePath = [[UIBezierPath alloc]init];
    [linePath moveToPoint:point1];
    [linePath addLineToPoint:point2];
    [linePath addLineToPoint:point3];
    [linePath addLineToPoint:point4];
    [linePath addLineToPoint:point5];
    [linePath addLineToPoint:point6];
    [linePath addLineToPoint:point7];
    
    CAShapeLayer * lineLayer = [CAShapeLayer layer];
    lineLayer.path = linePath.CGPath;
    lineLayer.strokeColor = [UIColor redColor].CGColor;
    lineLayer.lineWidth = 1.5;
    lineLayer.fillColor = [UIColor clearColor].CGColor;
    [baseView.layer addSublayer:lineLayer];
    
    CABasicAnimation * checkAnimal = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    checkAnimal.duration = 1.5f;
    checkAnimal.fromValue = @(0.0f);
    checkAnimal.toValue = @(1.0f);
    checkAnimal.fillMode = kCAFillModeBackwards;
    checkAnimal.beginTime = CACurrentMediaTime() + 0.9;
    [lineLayer addAnimation:checkAnimal forKey:@"checkAnimation"];

    CABasicAnimation * transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    transformAnima.duration = 0.8;
    transformAnima.fromValue = [NSNumber numberWithBool:0.1];
    transformAnima.toValue = [NSNumber numberWithBool:1.0];
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    transformAnima.removedOnCompletion = NO;
    transformAnima.fillMode = kCAFillModeForwards;
    [gradient addAnimation:transformAnima forKey:@"AnimationMoveY"];
}

- (CGFloat)randomPointY
{
    return  (10 + arc4random() % 40);
}
@end
