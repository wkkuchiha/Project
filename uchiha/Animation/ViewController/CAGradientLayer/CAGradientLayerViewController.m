//
//  CAGradientLayerViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/7/21.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "CAGradientLayerViewController.h"

@interface CAGradientLayerViewController ()
@property(nonatomic,strong)CAShapeLayer * shapeLayer;
@end

@implementation CAGradientLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.title = @"渐变图形";
    [self setupView];
}

- (void)setupView {
    [self drawRectangle];
    [self drawCircle];
}

- (void)drawRectangle {
    UIView * backView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 180, 280)];
    [self.view addSubview:backView];
    CAGradientLayer * gradient = [[CAGradientLayer alloc] init];
    gradient.colors = @[(__bridge id)[UIColor orangeColor].CGColor, (__bridge id)[UIColor whiteColor].CGColor];
    gradient.locations = @[@0,@.03,@1.0];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    gradient.frame = backView.bounds;
    [backView.layer addSublayer:gradient];
}

- (void)drawCircle {
    /**
      以CAShapeLayer作为layer的mask属性
     CALayer的mask属性可以作为遮罩让layer显示mask遮住的部分；
     CAShapeLayer作为layer的子集，通过path属性可以生成不同的形状，
     将CAShapeLayer对象用作layer的mask属性的话，可以生成不同形状的图层。因此生成颜渐变有以下步骤
     1,生成一个imageView(也可以作为layer)，image的属性颜色渐变的图片
     2,生成一个CAShapeLayer对象,根据path属性指定所需的形状
     3,将CAShapeLayer对象赋值给imageView的mask属性
     */
    CGPoint center = CGPointMake(self.view.bounds.size.width/2, self.view.bounds.size.height/2 + 70);
    CGFloat radius = 50;
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:- M_PI_2 endAngle:(M_PI * 2) - M_PI_2 clockwise:YES];
    self.shapeLayer = [CAShapeLayer layer];
    self.shapeLayer.lineWidth = 2.0f;
    self.shapeLayer.strokeColor = [UIColor redColor].CGColor;
    self.shapeLayer.fillColor = [UIColor clearColor].CGColor;
    self.shapeLayer.lineCap = kCALineCapRound;
    self.shapeLayer.lineJoin = kCALineJoinRound;
    self.shapeLayer.lineDashPhase = 10;
    self.shapeLayer.lineDashPattern = @[[NSNumber numberWithFloat:1.2],[NSNumber numberWithFloat:3.0]];
    self.shapeLayer.path = path.CGPath;
    CALayer * graditentLayer = [CALayer layer];
    
    // 左侧渐变
    CAGradientLayer * left = [CAGradientLayer layer];
    left.frame = CGRectMake(0, 0, self.view.bounds.size.width / 2, self.view.bounds.size.height);
    left.locations = @[@0.3,@0.9,@1.0];
    left.colors = @[(id)[UIColor redColor].CGColor,(id)[UIColor yellowColor].CGColor];
    [graditentLayer addSublayer:left];
    
    // 右侧渐变
    CAGradientLayer * right = [CAGradientLayer layer];
    right.frame = CGRectMake(self.view.bounds.size.width/2, 0, self.view.bounds.size.width/2, self.view.bounds.size.height);
    right.locations = @[@0.3,@0.9,@1.0];
    right.colors = @[(id)[UIColor grayColor].CGColor,(id)[UIColor yellowColor].CGColor];
    [graditentLayer addSublayer:right];
    
    graditentLayer.mask = self.shapeLayer;
    [self.view.layer addSublayer:graditentLayer];
}
@end
