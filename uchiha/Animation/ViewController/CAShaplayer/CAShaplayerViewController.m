//
//  CAShaplayerViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/7/21.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "CAShaplayerViewController.h"

@interface CAShaplayerViewController ()

@end

@implementation CAShaplayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    [self drawCurve];
    [self drawTwo];
    [self drawThree];
    [self drawFour];
}

- (void)drawCurve {
    UIBezierPath * path = [[UIBezierPath alloc] init];
    CGPoint point1 = CGPointMake(10, 100);
    CGPoint point2 = CGPointMake(50, 50);
    CGPoint point3 = CGPointMake(170, 200);
    CGPoint point4 = CGPointMake(200, 100);
    [path moveToPoint:point1];
    [path addCurveToPoint:point4 controlPoint1:point2 controlPoint2:point3];

    CAShapeLayer * shapeLayer = [[CAShapeLayer alloc] init];
    [self.view.layer addSublayer:shapeLayer];
    shapeLayer.path = path.CGPath;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 3.0;
}

- (void)drawTwo {
    CGFloat padding = 60;
    CGFloat width = (self.view.frame.size.width - 2 * padding);
    CGFloat originY = 220;
    CGFloat heigth = 120;
    CGPoint point1 = CGPointMake(padding, originY);
    CGPoint point2 = CGPointMake(padding, originY + heigth);
    CGPoint point3 = CGPointMake(padding + width, originY + heigth);
    CGPoint point4 = CGPointMake(padding + width, originY);
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path closePath];
    
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc] init];
    shaplayer.path = path.CGPath;
    shaplayer.strokeColor = [UIColor greenColor].CGColor;
    shaplayer.fillColor = [UIColor clearColor].CGColor;
    shaplayer.lineWidth = 2.0;
    
    [self.view.layer addSublayer:shaplayer];
}

- (void)drawThree {
    CGFloat padding = 60;
    CGFloat width = (self.view.frame.size.width - 2 * padding);
    CGFloat originY = 420;
    CGFloat heigth = 120;
    CGPoint point1 = CGPointMake(padding, originY);
    CGPoint point2 = CGPointMake(padding, originY + heigth);
    CGPoint point3 = CGPointMake(padding + width, originY + width);
    CGPoint point4 = CGPointMake(padding + width, originY);
    CGPoint point5 = CGPointMake(padding + width/(float)2, originY - 150);
    
    UIBezierPath * path = [[UIBezierPath alloc] init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path addQuadCurveToPoint:point1 controlPoint:point5];
    
    CAShapeLayer * shapler = [[CAShapeLayer alloc] init];
    shapler.path = path.CGPath;
    shapler.fillColor = [UIColor greenColor].CGColor;
    [self.view.layer addSublayer:shapler];
}

- (void)drawFour {
    CGFloat padding = 60;
    CGFloat width = (self.view.frame.size.width - 2* padding);
    CGFloat orginY = 560;
    CGFloat height = 80;
    CGPoint point1 = CGPointMake(padding, orginY);
    CGPoint point2 = CGPointMake(padding, orginY+height);
    CGPoint point3 = CGPointMake(padding+width, orginY+height);
    CGPoint point4 = CGPointMake(padding+width, orginY);
    
    UIBezierPath * path = [[UIBezierPath alloc]init];
    [path moveToPoint:point1];
    [path addLineToPoint:point2];
    [path addLineToPoint:point3];
    [path addLineToPoint:point4];
    [path closePath];
    CAShapeLayer * shaplayer = [[CAShapeLayer alloc]init];
    shaplayer.path = path.CGPath;
    shaplayer.strokeColor = [UIColor greenColor].CGColor;
    shaplayer.fillColor = [UIColor clearColor].CGColor;
    shaplayer.lineWidth = 2.0;
    
    [self.view.layer addSublayer:shaplayer];
    shaplayer.lineDashPattern = @[@6,@7];
}
@end

