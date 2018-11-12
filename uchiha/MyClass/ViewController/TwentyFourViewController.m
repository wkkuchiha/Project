//
//  TwentyFourViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/5/6.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "TwentyFourViewController.h"
#import "UIView+SDAutoLayout.h"
@interface TwentyFourViewController ()

@end

@implementation TwentyFourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  whiteColor];
    self.title = @"进度圈";
    [self test1];
    
}
- (void)test1
{
    UIImageView  *  imageView = [[UIImageView  alloc]init];
    [self.view  addSubview:imageView];
    imageView.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view,150).widthIs(70).heightIs(70);
    imageView.backgroundColor = [UIColor  blueColor];
    imageView.sd_cornerRadius = @(35);
    
    Cirle  *  circle = [[Cirle  alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
    circle.backgroundColor = [UIColor  clearColor];
    [self.view  addSubview:circle];
}


@end

@implementation Cirle

- (void)drawRect:(CGRect)rect
{
    CGContextRef  context = UIGraphicsGetCurrentContext();
    //半径
    CGFloat  radius = rect.size.width/2 + 2;
    CGFloat  startAngle = - M_PI_2;
    CGFloat  endAngle = M_2_PI - M_PI_2;
    CGContextAddArc(context, 30, 30, 10, - M_PI_4, M_2_PI, 1);
    CGContextStrokePath(context);
}
@end