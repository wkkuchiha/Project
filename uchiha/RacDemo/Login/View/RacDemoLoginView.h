//
//  RacDemoLoginView.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface RacDemoLoginView : UIView

@property(nonatomic,strong)UITextField *username;
@property(nonatomic,strong)UITextField *password;
@property(nonatomic,strong)UIButton *loginBtn;
@property(nonatomic,strong)UILabel *failureLabel;
- (instancetype)initWithFrame:(CGRect)frame;
@end
