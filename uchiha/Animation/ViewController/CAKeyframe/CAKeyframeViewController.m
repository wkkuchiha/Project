//
//  CAKeyframeViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/25.
//  Copyright © 2017年 creditease. All rights reserved.
//

// 关键帧动画
#import "CAKeyframeViewController.h"

@interface CAKeyframeViewController ()
@property(nonatomic,strong)UIImageView *imgView;
@end

@implementation CAKeyframeViewController

- (void)initView {
    [super initView];
    [self initWithView];
}

- (void)initWithView {
    _imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"HomePage1_newYear"]];
    [self.view addSubview:_imgView];
    _imgView.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, iphoneScreenHeight/2 - 88).heightIs(88).widthIs(88);
}

- (NSArray *)operateTitleArray {
    return [NSArray arrayWithObjects:@"关键帧",@"路径",@"抖动", nil];
}

- (void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self keyFrameAnimation];
            break;
        case 1:
            [self pathAnimation];
        case 2:
            [self shakeAnimation];
        default:
            break;
    }
}

- (void)keyFrameAnimation {
    CAKeyframeAnimation *animal = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(0, iphoneScreenHeight/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth/3, iphoneScreenHeight/2-50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth/3, iphoneScreenHeight/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth*2/3, iphoneScreenHeight/2+50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth*2/3, iphoneScreenHeight/2-50)];
    NSValue *value6 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth, iphoneScreenHeight/2-50)];
    NSArray *array = [NSArray arrayWithObjects:value1,value2,value3,value4,value5,value6, nil];
    animal.values = array;
    animal.duration = 1.0f;
    animal.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [_imgView.layer addAnimation:animal forKey:@"keyFrameAnimation"];
}

- (void)pathAnimation {
    CAKeyframeAnimation *animal = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(iphoneScreenWidth/2 - 88, iphoneScreenHeight/2 - 88, 88, 88)];
    animal.path = path.CGPath;
    animal.duration = 1.0f;
    [_imgView.layer addAnimation:animal forKey:@"pathAnimation"];
}

- (void)shakeAnimation {
    CAKeyframeAnimation *animal = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation"];
    NSValue *value1 = [NSNumber numberWithFloat:-M_PI/180 * 4];
    NSValue *value2 = [NSNumber numberWithFloat:M_PI/180 * 4];
    NSValue *value3 = [NSNumber numberWithFloat:-M_PI/180 * 4];
    NSArray *array = [NSArray arrayWithObjects:value1,value2,value3, nil];
    animal.values = array;
    animal.repeatCount = MAXFLOAT;
    [_imgView.layer addAnimation:animal forKey:@"shakeAnimation"];
}
@end
