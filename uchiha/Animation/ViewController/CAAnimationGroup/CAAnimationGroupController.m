
//
//  CAAnimationGroupController.m
//  uchiha
//
//  Created by uchiha on 2017/8/25.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 组动画
 */
#import "CAAnimationGroupController.h"

@interface CAAnimationGroupController ()
@property(nonatomic,strong)UIImageView *imgView;
@end

@implementation CAAnimationGroupController

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
    return [NSArray arrayWithObjects:@"组动画同时",@"组动画连续", nil];
}

- (void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self animationMeantime];
            break;
        case 1:
            [self animationEnclises];
            break;
        default:
            break;
    }
}

/**
 * 同时
 */
- (void)animationMeantime {
    CAKeyframeAnimation *animal1 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value0 = [NSValue valueWithCGPoint:CGPointMake(0, iphoneScreenHeight/2-50)];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth/3, iphoneScreenHeight/2-50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth/3, iphoneScreenHeight/2+50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth*2/3, iphoneScreenHeight/2+50)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth*2/3, iphoneScreenHeight/2-50)];
    NSValue *value5 = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth, iphoneScreenHeight/2-50)];
    animal1.values = [NSArray arrayWithObjects:value0,value1,value2,value3,value4,value5, nil];
    
    // 动画缩放
    CABasicAnimation *animal2 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animal2.fromValue = [NSNumber numberWithFloat:1.0f];
    animal2.toValue = [NSNumber numberWithFloat:2.0f];
    
    // 动画旋转
    CABasicAnimation *animal3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animal3.toValue = [NSNumber numberWithFloat:M_PI * 4];
    
    // 组合动画
    CAAnimationGroup *group = [CAAnimationGroup animation];
    group.animations = [NSArray arrayWithObjects:animal1,animal2,animal3, nil];
    group.duration = 2.0f;
    [_imgView.layer addAnimation:group forKey:@"groupAnimation"];
}

/**
 * 连续
 */
- (void)animationEnclises {
    CFTimeInterval currentTime = CACurrentMediaTime();
    // 位移动画
    CABasicAnimation *animal1 = [CABasicAnimation animationWithKeyPath:@"position"];
    animal1.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, iphoneScreenHeight/2 - 88)];
    animal1.toValue = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth/2, iphoneScreenHeight/2 - 88)];
    animal1.beginTime = currentTime;
    animal1.duration = 1.0f;
    animal1.fillMode = kCAFillModeForwards;
    animal1.removedOnCompletion = NO;
    [_imgView.layer addAnimation:animal1 forKey:@"position"];

    // 缩放动画
    CABasicAnimation *animal2 = [CABasicAnimation animationWithKeyPath:@"transfrom.scale"];
    animal2.fromValue = [NSNumber numberWithFloat:0.8f];
    animal2.toValue = [NSNumber numberWithFloat:2.0f];
    animal2.beginTime = currentTime + 1.0f;
    animal2.duration = 1.0f;
    animal2.fillMode = kCAFillModeForwards;
    animal2.removedOnCompletion = NO;
    [_imgView.layer addAnimation:animal2 forKey:@"transform.scale"];
    
    // 旋转动画
    CABasicAnimation *animal3 = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
    animal3.fromValue = [NSNumber numberWithFloat:M_PI * 4];
    animal3.beginTime = currentTime + 1.0f;
    animal3.duration = 2.0f;
    animal3.fillMode = kCAFillModeForwards;
    [_imgView.layer addAnimation:animal3 forKey:@"transform.rotation"];
    
    CABasicAnimation *animal4 = [CABasicAnimation animationWithKeyPath:@"position"];
    animal4.fromValue = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth/2, iphoneScreenHeight/2 - 88)];
    animal4.toValue = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth, iphoneScreenHeight/2 - 88)];
    animal4.duration = 1.0f;
    animal4.beginTime = 5.0f;
    animal4.fillMode = kCAFillModeForwards;
    animal4.removedOnCompletion = NO;
    [_imgView.layer addAnimation:animal4 forKey:@"postion"];
}

@end
