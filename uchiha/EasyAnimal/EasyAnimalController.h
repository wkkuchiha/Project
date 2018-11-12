//
//  EasyAnimalController.h
//  uchiha
//
//  Created by uchiha on 2017/8/30.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum :NSInteger{
    Fade = 0,                   //淡入淡出
    Push,                       //推挤
    Reveal,                     //揭开
    MoveIn,                     //覆盖
    Cube,                       //立方体
    SuckEffect,                 //吮吸
    OglFlip,                    //翻转
    RippleEffect,               //波纹
    PageCurl,                   //翻页
    PageUnCurl,                 //反翻页
    CameraIrisHollowOpen,       //开镜头
    CameraIrisHollowClose,      //关镜头
    CurlDown,                   //下翻页
    CurlUp,                     //上翻页
    FlipFromLeft,               //左翻转
    FlipFromRight,              //右翻转
}AnimationType;
@interface EasyAnimalController : UIViewController
@property(nonatomic,assign)int subType;
@property(nonatomic,strong)UIImageView *imgView;
@end
