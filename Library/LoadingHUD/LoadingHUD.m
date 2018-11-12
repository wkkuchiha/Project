//
//  LoadingHUD.m
//  MiuTrip
//
//  Created by Miutrip on 2016/8/17.
//  Copyright © 2016年 apple. All rights reserved.
//

#ifndef kCFCoreFoundationVersionNumber_iOS_7_0
#define kCFCoreFoundationVersionNumber_iOS_7_0 847.20
#endif

#ifndef kCFCoreFoundationVersionNumber_iOS_8_0
#define kCFCoreFoundationVersionNumber_iOS_8_0 1129.15
#endif

#import "LoadingHUD.h"
@interface LoadingHUD()

@property(nonatomic,strong) BlurBackgroundView *blurView;

@end;



@implementation LoadingHUD

+(LoadingHUD*)addHUDForView:(UIView *)view contentView:(UIView*)contentView
{
    if(!view){
        return nil;
    }
    
    LoadingHUD *hud = [[self alloc] initWithView:view customView:contentView];
    [view addSubview:hud];
    return hud;
}

+(BOOL)hideHUDForView:(UIView*)view animated:(BOOL)animated
{
    LoadingHUD *hud = [LoadingHUD HUDForView:view];
    if(!hud){
        return NO;
    }
    [hud hideHUDAnimated:animated];
    return YES;
}

-(void)showHUDAnimated:(BOOL)animated
{
    
    if(!animated){
        return;
    }
    
    CGAffineTransform small = CGAffineTransformMakeScale(0.5f, 0.5f);
    CGAffineTransform large = CGAffineTransformMakeScale(1.0f, 1.0f);
    
    _blurView.transform = small;
    _blurView.alpha = 0;
    dispatch_block_t animations = ^{
        _blurView.transform = large;
        _blurView.alpha = 1;
    };

    [UIView animateWithDuration:0.3 delay:0. usingSpringWithDamping:1.f initialSpringVelocity:0.f options:UIViewAnimationOptionBeginFromCurrentState animations:animations completion:NULL];
}

-(void)hideHUDAnimated:(BOOL)animated
{
    if(!animated){
        [self removeFromSuperview];
        return;
    }
    
    CGAffineTransform small = CGAffineTransformMakeScale(0.1f, 0.1f);
    dispatch_block_t animations = ^{
        _blurView.transform = small;
        _blurView.alpha = 0;
    };
    
    [UIView animateWithDuration:0.3 delay:0. usingSpringWithDamping:1.f initialSpringVelocity:0.f options:UIViewAnimationOptionBeginFromCurrentState animations:animations completion:^(BOOL finished){
        [self removeFromSuperview];
    }];

}

+ (LoadingHUD*)HUDForView:(UIView *)view {
    NSEnumerator *subviewsEnum = [view.subviews reverseObjectEnumerator];
    for (UIView *subview in subviewsEnum) {
        if ([subview isKindOfClass:self]) {
            return (LoadingHUD*)subview;
        }
    }
    return nil;
}

-(instancetype)initWithView:(UIView*)view customView:(UIView*)custemView
{
    self = [super initWithFrame:view.frame];
    if(self){
        self.customView = custemView;
        self.backgroundColor = [UIColor colorWithWhite:0.0f alpha:.3f];
        self.opaque = NO;
        _blurView = [[BlurBackgroundView alloc] initWithFrame:_customView.bounds];
        _blurView.center = CGPointMake(CGRectGetMidX(view.frame), CGRectGetMidY(view.frame));
        [_blurView addSubview:_customView];
        [self addSubview:_blurView];
    }
    return self;
}

@end

@interface BlurBackgroundView()

@property(nonatomic,strong) UIColor  *color;
@property(nonatomic,strong) UIToolbar  *toolbar;
@property(nonatomic,strong) UIVisualEffectView *effectView;

@end

@implementation BlurBackgroundView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        if ((self = [super initWithFrame:frame])) {
            if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_8_0) {
                _color = [UIColor colorWithWhite:0.8f alpha:0.6f];
            } else {
                _color = [UIColor colorWithWhite:0.95f alpha:0.6f];
            }
            self.clipsToBounds = YES;
            self.layer.cornerRadius = 6;
            [self updateBackground];
        }
    }
    return self;
}

-(void)updateBackground
{
    if (kCFCoreFoundationVersionNumber >= kCFCoreFoundationVersionNumber_iOS_8_0) {
        UIBlurEffect *effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
        UIVisualEffectView *effectView = [[UIVisualEffectView alloc] initWithEffect:effect];
        [self addSubview:effectView];
        effectView.frame = self.bounds;
        effectView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        self.backgroundColor = self.color;
        self.layer.allowsGroupOpacity = NO;
        self.effectView = effectView;
    }else{
        UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectInset(self.bounds, -100.f, -100.f)];
        toolbar.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        toolbar.barTintColor = self.color;
        toolbar.translucent = YES;
        [self addSubview:toolbar];
        self.toolbar = toolbar;
    }
    self.backgroundColor = self.color;
}



@end
