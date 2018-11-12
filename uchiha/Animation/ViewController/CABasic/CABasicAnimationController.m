//
// cCABasicAnimationController.m
//  uchiha
//
//  Created by uchiha on 2017/8/25.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 基础动画
 */
#import "CABasicAnimationController.h"

#import "AppDelegate.h"

@interface CABasicAnimationController()

@property(nonatomic,strong)UIImageView *imgView;
@end

@implementation CABasicAnimationController

-(void)initView{
    [super initView];
    
    _imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"HomePage1_newYear"]];
    _imgView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_imgView];
    _imgView.sd_layout.topSpaceToView(self.view, iphoneScreenHeight/2 - 88).centerXEqualToView(self.view).heightIs(88).widthIs(88);
}

-(NSArray *)operateTitleArray{
    return [NSArray arrayWithObjects:@"位移",@"透明度",@"缩放",@"旋转",@"背景色", nil];
}

-(void)clickBtn : (UIButton *)btn{
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self opacityAniamtion];
            break;
        case 2:
            [self scaleAnimation];
            break;
        case 3:
            [self rotateAnimation];
            break;
        case 4:
            NSLog(@"jhudfhfjkdmfnjkdjfnhdknfhjdnjk ");
            [self backgroundAnimation];
            break;
        default:
            break;
    }
}

-(NSString *)controllerTitle{
    return @"基础动画";
}

/**
 *  位移动画演示
 */
-(void)positionAnimation{
    //使用CABasicAnimation创建基础动画
    CABasicAnimation *animal = [CABasicAnimation animationWithKeyPath:@"position"];
    animal.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, iphoneScreenHeight/2 - 50)];
    animal.toValue = [NSValue valueWithCGPoint:CGPointMake(iphoneScreenWidth, iphoneScreenHeight/2 - 50)];
    animal.duration = 1.0f;
    animal.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [_imgView.layer addAnimation:animal forKey:@"positionAnimation"];
}

/**
 *  透明度动画
 */
-(void)opacityAniamtion{
    CABasicAnimation *animal = [CABasicAnimation animationWithKeyPath:@"opacity"];
    animal.fromValue = [NSNumber numberWithFloat:1.0f];
    animal.toValue = [NSNumber numberWithFloat:2.0f];
    animal.duration = 1.0f;
    [_imgView.layer addAnimation:animal forKey:@"opacityAnimation"];
}

/**
 *  缩放动画
 */
-(void)scaleAnimation{
    CABasicAnimation *animal = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animal.toValue = [NSNumber numberWithFloat:2.0f];
    animal.duration = 1.0f;
    [_imgView.layer addAnimation:animal forKey:@"scaleAnimation"];
}

/**
 *  旋转动画
 */
-(void)rotateAnimation{
    CABasicAnimation *animal = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"]; // 旋转z轴矢量，进行旋转
    animal.toValue = [NSNumber numberWithFloat:M_PI];
    animal.duration = 1.0f;
    [_imgView.layer addAnimation:animal forKey:@"rotateAnimation"];
}

/**
 *  背景色变化动画
 */
-(void)backgroundAnimation{
    CABasicAnimation *anima = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    anima.toValue =(id) [UIColor greenColor].CGColor;
    anima.duration = 1.0f;
    [_imgView.layer addAnimation:anima forKey:@"backgroundAnimation"];
}
@end
