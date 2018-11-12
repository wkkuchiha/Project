//
//  SixTeenViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/3/13.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "SixTeenViewController.h"
#import "UIView+SDAutoLayout.h"


@interface SixTeenViewController ()

@end

@implementation SixTeenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor  whiteColor];
    self.title  = @"SDAutoLayout";
    //[self  setUpViewOne];
    [self  setUpVIewTwo];
   // [self setUpTableView];
}
- (void)setUpViewOne
{
    UIView * redView = [[UIView  alloc]init];
    [self.view addSubview:redView];
    redView.backgroundColor = [UIColor  redColor];
    redView.sd_layout.leftSpaceToView(self.view,10).topSpaceToView(self.view,100).heightIs(200).widthIs(300);
    
    UIView  *  yelloView = [[UIView  alloc]init];
    [self.view  addSubview:yelloView];
    yelloView.sd_layout.leftEqualToView(redView).topSpaceToView(redView,10).widthIs(200).heightIs(90);
    yelloView.backgroundColor = [UIColor yellowColor];
    
    
    UIView  *  cyanView = [[UIView  alloc]init];
    [redView  addSubview:cyanView];
    cyanView.sd_layout.leftEqualToView(redView).topSpaceToView(redView,10).widthIs(yelloView.width).heightIs(90);
    cyanView.backgroundColor = [UIColor cyanColor];
    
    UIView  *  blueView = [[UIView  alloc]init];
    [self.view  addSubview:blueView];
    blueView.backgroundColor = [UIColor  blueColor];
    blueView.sd_layout.leftSpaceToView(yelloView,5).topEqualToView(yelloView).widthRatioToView(yelloView,0.5).heightRatioToView(yelloView,2);
    
    UIView  * orangeView = [[UIView  alloc]init];
    [blueView  addSubview:orangeView];
    orangeView.backgroundColor = [UIColor  orangeColor];
    orangeView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(4, 0, 3, 10));
    
    UILabel  *  textLB = [[UILabel  alloc]init];
    [self.view  addSubview:textLB];
    textLB.backgroundColor = [UIColor  redColor];
    textLB.sd_layout.leftSpaceToView(self.view,5).topSpaceToView(blueView,4).heightIs(30).widthIs(0);
    [textLB  setSingleLineAutoResizeWithMaxWidth:375];
    textLB.text = @"sdfafasdfadfasdagasfasgasdfasf";
    
    UIView  *  nameLB = [[UILabel  alloc]init];
    [self.view  addSubview:nameLB];
    nameLB.backgroundColor = [UIColor  cyanColor];
    nameLB.sd_layout.leftSpaceToView(textLB,5).topEqualToView(textLB).widthIs(30).heightIs(textLB.height);
    
}
- (void)setUpVIewTwo
{
    UIScrollView  *  scorllView = [[UIScrollView  alloc]init];
    [self.view  addSubview:scorllView];
    scorllView.sd_layout.spaceToSuperView(UIEdgeInsetsMake(0, 0, 0, 0));
    scorllView.backgroundColor = [UIColor  cyanColor];
    
    UIView  *  blueView = [[UIView  alloc]init];
    [scorllView addSubview:blueView];
    blueView.backgroundColor = [UIColor  blueColor];
    blueView.sd_layout.leftSpaceToView(scorllView,5).topEqualToView(scorllView).widthRatioToView(scorllView,0.5).heightIs(200);
    
    UIView  * orangeView = [[UIView  alloc]init];
    [scorllView  addSubview:orangeView];
    orangeView.backgroundColor = [UIColor  orangeColor];
    orangeView.sd_layout.leftSpaceToView(scorllView,5).topSpaceToView(blueView,400).widthRatioToView(scorllView,0.5).heightIs(200);;
//- (void)setupAutoContentSizeWithBottomView:(UIView *)bottomView bottomMargin:(CGFloat)bottomMargin;
    [scorllView  setupAutoContentSizeWithBottomView:orangeView
                                       bottomMargin:50];
}
- (void)setUpTableView
{

}
@end
