//
//  SecondViewController.m
//  控件系数-03
//
//  Created by 张玺 on 15/11/9.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "SecondViewController.h"
#import "UIView+Extension.h"
@interface  SecondViewController()
{
    UIToolbar  *  _toolBar;

}
@end
@implementation SecondViewController

- (void)viewDidLoad
{
    [super  viewDidLoad];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [self  setUpView];
    [self text2];
}
-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleBlackTranslucent;  // Light content, for use on dark backgrounds
}
- (void)setUpView
{
    _toolBar=[[UIToolbar  alloc]init];
    [self.view  addSubview:_toolBar];
    _toolBar.backgroundColor=[UIColor  grayColor];
    _toolBar.frame=CGRectMake(0, self.view.height-80, self.view.width, 80);
    UIView  *  sourcePlaceView=[[UIView  alloc]initWithFrame:CGRectMake(0,0, self.view.width, 40)];
    // sourcePlaceView.backgroundColor=[UIColor  blueColor];
    [_toolBar  addSubview:sourcePlaceView];
   
    UIImageView  *  imageView=[[UIImageView  alloc]initWithFrame:CGRectMake(10, 17, 10, 10)];
    imageView.image=[UIImage  imageNamed:@"marker_end"];
    //imageView.backgroundColor=[UIColor  orangeColor];
    [sourcePlaceView addSubview:imageView];
    
    UITextField  *  tf=[[UITextField  alloc]initWithFrame:CGRectMake(30, 0, self.view.width-30, 40)];
    [sourcePlaceView  addSubview:tf];
    tf.placeholder=@"请输入目的地";
    tf.textColor=[UIColor  blackColor];
    
    
    UIView  *  destinaPlaceView=[[UIView  alloc]initWithFrame:CGRectMake(0,40, self.view.width, 40)];
    // sourcePlaceView.backgroundColor=[UIColor  blueColor];
    [_toolBar  addSubview:destinaPlaceView];
    
    UIImageView  *  imageView1=[[UIImageView  alloc]initWithFrame:CGRectMake(10, 17, 10, 10)];
    imageView1.image=[UIImage  imageNamed:@"marker_start"];
    //imageView.backgroundColor=[UIColor  orangeColor];
    [destinaPlaceView addSubview:imageView1];
    
    UITextField  *  tf1=[[UITextField  alloc]initWithFrame:CGRectMake(30, 0, self.view.width-30, 40)];
    [destinaPlaceView  addSubview:tf1];
    tf1.placeholder=@"请输入目的地";
    tf1.textColor=[UIColor  blackColor];
    
   [_toolBar  addSubview: [self  createLineWithColor:[UIColor  orangeColor] frame:CGRectMake(0, 40, self.view.width, 0.8)]];

}

- (UIView*)createLineWithColor:(UIColor*)color frame:(CGRect)frame
{
    UIView *line = [[UIView alloc]initWithFrame:frame];
    [line setBackgroundColor:color];
    [line setAlpha:0.5];
    //[self addSubview:line];
    return line;
}
- (void)text2
{
    BOOL  isMan =YES;
    NSLog(@"%d",isMan);
    
    bool isWoman = NO;
    NSLog(@"%d",isWoman);
}

@end
