//
//  AffineTransformViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/25.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 动画
 */
#import "AffineTransformViewController.h"

@interface AffineTransformViewController ()
@property(nonatomic,strong)UIImageView *imgView;
@end

@implementation AffineTransformViewController
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
    return [NSArray arrayWithObjects:@"位移",@"缩放",@"旋转",@"组合",@"反转",nil];
}

- (void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self positionAnimation];
            break;
        case 1:
            [self scaleAnimation];
            break;
        case 2:
            [self rotateAnimation];
            break;
        case 3:
            [self combinationAnimation];
            break;
        case 4:
            [self invertAnimation];
            break;
        default:
            break;
    }
}

- (void)positionAnimation {
    _imgView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _imgView.transform = CGAffineTransformMakeTranslation(88, 88);
    }];
}

- (void)scaleAnimation {
    _imgView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _imgView.transform = CGAffineTransformMakeScale(2,2);
    }];
}

- (void)rotateAnimation {
    _imgView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _imgView.transform = CGAffineTransformMakeRotation(M_PI);
    }];
}

- (void)combinationAnimation {
    _imgView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        CGAffineTransform trans1 = CGAffineTransformMakeRotation(M_PI);
        CGAffineTransform trans2 = CGAffineTransformScale(trans1, 0.5, 0.5);
        _imgView.transform = CGAffineTransformTranslate(trans2, 88, 88);
    }];
}

- (void)invertAnimation {
    _imgView.transform = CGAffineTransformIdentity;
    [UIView animateWithDuration:1.0f animations:^{
        _imgView.transform = CGAffineTransformInvert(CGAffineTransformMakeScale(2, 2) );
    }];
}
@end
