
//  EasyAnimalController.m
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 简易动画
 */
#import "EasyAnimalController.h"
#import <QuartzCore/QuartzCore.h>
@interface EasyAnimalController ()

@end

@implementation EasyAnimalController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"简易动画";
    [self initSubViews];
}

- (void)initSubViews {
    _subType = 0;
    _imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"tripBG"]];
    [self.view addSubview:_imgView];
    _imgView.userInteractionEnabled = YES;
    _imgView.frame = CGRectMake(10, 74, iphoneScreenWidth - 20, iphoneScreenHeight - 84);
    
    NSArray * btnTitles = @[@"淡入淡出",@"推挤",@"揭开",@"覆盖",@"立方体",@"吮吸",@"反转",@"波纹",@"翻页",@"反翻页",@"开镜头",@"关镜头",@"下翻页",@"上翻页",@"左翻页",@"右翻页"];
    CGFloat btnWidth = iphoneScreenWidth/4;
    CGFloat btnHeigth = 44;
    CGFloat btnSpaceY = 10;
    
    for (int i = 0 ; i < btnTitles.count; i++) {
        NSInteger index = i % 3;
        NSInteger page = i / 3;
        // 圆角按钮
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn.frame = CGRectMake(index * (btnWidth + btnSpaceY) + 10, page  * (btnHeigth + btnSpaceY)+10, btnWidth, btnHeigth);
        [btn setTitle:[btnTitles objectAtIndex:i] forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_imgView addSubview:btn];
        btn.tag = i;
      
        [[btn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            AnimationType an = i;
            [self clickWithBtn:an];
        }];
    }
}

- (void)clickWithBtn:(AnimationType)animalType {
    
    NSString *subtypeString = [NSString string];
 
    switch (_subType) {
        case 0:
            subtypeString = kCATransitionFromLeft;
            break;
        case 1:
            subtypeString = kCATransitionFromTop;
            break;
        case 2:
            subtypeString = kCATransitionFromRight;
            break;
        case 3:
            subtypeString = kCATransitionFromBottom;
            break;
        default:
            break;
    }
    _subType++;
    if (_subType == 3) {
        _subType = 0;
    }
   
    switch (animalType) {
        case Fade:
            [self transitionWithType:kCATransitionFade withSubType:subtypeString subView:_imgView];
            break;
        case Push:
            [self transitionWithType:kCATransitionPush withSubType:subtypeString subView:_imgView];
            break;
        case Reveal:
            [self transitionWithType:kCATransitionReveal withSubType:subtypeString subView:_imgView];
            break;
        case MoveIn:
            [self transitionWithType:kCATransitionMoveIn withSubType:subtypeString subView:_imgView];
            break;
        case Cube:
            [self transitionWithType:@"cube" withSubType:subtypeString subView:_imgView];
            break;
        case SuckEffect:
            [self transitionWithType:@"suckEffect" withSubType:subtypeString subView:_imgView];
            break;
        case OglFlip:
            [self transitionWithType:@"oglFlip" withSubType:subtypeString subView:_imgView];
            break;
        case RippleEffect:
            [self transitionWithType:@"rippleEffect" withSubType:subtypeString subView:_imgView];
            break;
        case PageCurl:
            [self transitionWithType:@"pageCurl" withSubType:subtypeString subView:_imgView];
            break;
        case PageUnCurl:
            [self transitionWithType:@"pageUnCurl" withSubType:subtypeString subView:_imgView];
            break;
        case CameraIrisHollowOpen:
            [self transitionWithType:@"cameraIrisHollowOpen" withSubType:subtypeString subView:_imgView];
            break;
        case CameraIrisHollowClose:
            [self transitionWithType:@"cameraIrisHollowClose" withSubType:subtypeString subView:_imgView];
            break;
        case CurlDown:
            [self transitionWithType:_imgView trainstion:UIViewAnimationTransitionCurlDown];
            break;
        case CurlUp:
            [self transitionWithType:_imgView trainstion:UIViewAnimationTransitionCurlUp];
            break;
        case FlipFromLeft:
            [self transitionWithType:_imgView trainstion:UIViewAnimationTransitionFlipFromLeft];
            break;
        case FlipFromRight:
            [self transitionWithType:_imgView trainstion:UIViewAnimationTransitionFlipFromRight];
            break;
            default:
            break;
    }
}

/**
 * 实现动画
 */
- (void)transitionWithType:(NSString *)animalType withSubType:(NSString *)subType subView:(UIView *)view {
    CATransition *animal = [CATransition animation];
    animal.duration = 0.5f;
    animal.timingFunction = UIViewAnimationOptionCurveEaseInOut;
    animal.type = animalType;
    if (subType != nil) {
        animal.subtype = subType;
    }
    [view.layer addAnimation:animal forKey:@"animation"];
}

- (void)transitionWithType:(UIView *)view trainstion:(UIViewAnimationTransition)trainstion {
    [UIView animateWithDuration:0.5f animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationTransition:trainstion forView:view cache:YES];
    }];
}


@end
