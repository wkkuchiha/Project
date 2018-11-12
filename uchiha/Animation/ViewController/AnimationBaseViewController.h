//
//  AnimationBaseViewController.h
//  uchiha
//
//  Created by uchiha on 2017/8/24.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AnimationBaseViewController : UIViewController

-(NSString *)controllerTitle;

-(void)initView;

-(NSArray *)operateTitleArray;

-(void)clickBtn:(UIButton *)btn;

@end
