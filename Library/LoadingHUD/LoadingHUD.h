//
//  LoadingHUD.h
//  MiuTrip
//
//  Created by Miutrip on 2016/8/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoadingHUD : UIView

@property(nonatomic,strong) UIView *customView;

+(LoadingHUD*)addHUDForView:(UIView *)view contentView:(UIView*)contentView;

+(BOOL)hideHUDForView:(UIView*)view animated:(BOOL)animated;

+(LoadingHUD*)HUDForView:(UIView *)view;

-(void)showHUDAnimated:(BOOL)animated;
-(void)hideHUDAnimated:(BOOL)animated;

@end

@interface BlurBackgroundView : UIView

@end