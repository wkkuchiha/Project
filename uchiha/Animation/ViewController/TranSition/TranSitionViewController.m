//
//  TranSitionViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/25.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 转场动画
 */
#import "TranSitionViewController.h"

@interface TranSitionViewController ()
@property(nonatomic,strong)UIImageView *imgView;
@property(nonatomic,assign)NSInteger indexCount;
@property(nonatomic,strong)UILabel *indexTitle;
@end

@implementation TranSitionViewController

- (void)initView {
    [super initView];
    [self initWithView];
}

- (void)initWithView {
    _indexCount = 0;
    
    _imgView = [[UIImageView alloc]init];
    [self.view addSubview:_imgView];
    _imgView.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view,iphoneScreenHeight/2 - 88).widthIs(88).heightIs(88);
    
    _indexTitle = [[UILabel alloc]init];
    [_imgView addSubview:_indexTitle];
    _indexTitle.sd_layout.centerXEqualToView(_imgView).centerYEqualToView(_imgView).widthIs(44).heightIs(44);
    _indexTitle.font = [UIFont systemFontOfSize:12.0f];
    
    [self changeIndexTitle:YES];
}

- (void)changeIndexTitle:(BOOL)change {
    if (_indexCount > 4) {
        _indexCount = 0;
    }
    if (_indexCount < 0) {
        _indexCount = 4;
    }
    NSArray *imges = [NSArray arrayWithObjects:@"logo_8l",@"logo_fu",@"logo_gs",@"logo_hu",@"logo_OQ", nil];
    NSArray *titles = [NSArray arrayWithObjects:@"零",@"青",@"玉",@"朱",@"南", nil];
    _imgView.image = [UIImage imageNamed:[imges objectAtIndex:_indexCount]];
    _indexTitle.text = [titles objectAtIndex:_indexCount];
    if (change) {
        _indexCount++;
    } else {
        _indexCount--;
    }
}

- (NSArray *)operateTitleArray {
    return [NSArray arrayWithObjects:@"fade",@"moveIn",@"push",@"reveal",@"cube",@"suck",@"oglFlip",@"ripple",@"Curl",@"UnCurl",@"caOpen",@"caClose", nil];
}

- (void)clickBtn:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self fadeAnimation];
            break;
        case 1:
            [self moveInAnimation];
            break;
        case 2:
            [self pushAnimation];
            break;
        case 3:
            [self revealAnimation];
            break;
        case 4:
            [self cubeAnimation];
            break;
        case 5:
            [self suckAnimation];
            break;
        case 6:
            [self oglFlipAnimation];
            break;
        case 7:
            [self rippleAnimation];
            break;
        case 8:
            [self curlAnimation];
            break;
        case 9:
            [self unCurlAnimation];
            break;
        case 10:
            [self caOpenAnimation];
            break;
        case 11:
            [self caCloseAnimation];
            break;
        default:
            break;
    }
}

- (void)fadeAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = kCATransitionFade;
    animal.subtype = kCATransitionFromRight;
    [_imgView.layer addAnimation:animal forKey:@"fadeAnimation"];
}

- (void)moveInAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = kCATransitionMoveIn;
    animal.subtype = kCATransitionFromRight;
    [_imgView.layer addAnimation:animal forKey:@"moveInAnimation"];
}

- (void)pushAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = kCATransitionPush;
    animal.subtype = kCATransitionFromRight;
    [_imgView.layer addAnimation:animal forKey:@"pushAnimation"];
}

- (void)revealAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = kCATransitionReveal;
    animal.subtype = kCATransitionFromRight;
    [_imgView.layer addAnimation:animal forKey:@"revealAnimation"];
}

- (void)cubeAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = @"cube";
    animal.subtype = kCATransitionFromLeft;
    [_imgView.layer addAnimation:animal forKey:@"cubeAnimation"];
}

- (void)suckAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = @"suckAnimation" ;
    animal.subtype = kCATransitionFromLeft;
    [_imgView.layer addAnimation:animal forKey:@"suckAnimation"];
}

- (void)oglFlipAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = @"oglFlipAnimation";
    animal.subtype = kCATransitionFromLeft;
    [_imgView.layer addAnimation:animal forKey:@"oglFlipAnimation"];
}

- (void)rippleAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = @"rippleAnimation";
    animal.subtype = kCATransitionFromLeft;
    [_imgView.layer addAnimation:animal forKey:@"rippleAnimation"];
}

- (void)curlAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = @"curlAnimation";
    animal.subtype = kCATransitionFromLeft;
    [_imgView.layer addAnimation:animal forKey:@"curlAnimation"];
}

- (void)unCurlAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = @"unCurlAnimation";
    animal.subtype = kCATransitionFromLeft;
    [_imgView.layer addAnimation:animal forKey:@"unCurlAnimation"];
}

- (void)caOpenAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = @"caOpenAnimation";
    animal.subtype = kCATransitionFromLeft;
    [_imgView.layer addAnimation:animal forKey:@"caOpenAnimation"];
}

- (void)caCloseAnimation {
    [self changeIndexTitle:YES];
    CATransition *animal = [CATransition animation];
    animal.duration = 1.0f;
    animal.type = @"caCloseAnimation";
    animal.subtype = kCATransitionFromLeft;
    [_imgView.layer addAnimation:animal forKey:@"caCloseAnimation"];
}
@end
