//
//  SevenChrildViewController.m
//  控件系数-03
//
//  Created by 张玺 on 15/12/15.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "SevenChrildViewController.h"
#import "SecViewController.h"

#import "SevenGrannChildVC.h"
#import "UINavigationController+FDFullscreenPopGesture.h"
@interface SevenChrildViewController()
{
    SevenGrannChildVC  *  _grandVC;
}
@property (nonatomic,assign) BOOL  isPush;

@end
@implementation SevenChrildViewController
- (void)viewWillAppear:(BOOL)animated
{
    [super  viewWillAppear:animated];
//    if (_grandVC.isPop) {
//        [self.navigationController  setNavigationBarHidden:YES animated:animated];
//        //[self  performSelector:@selector(shownav) withObject:0.2];
//        [self  performSelector:@selector(shownav) withObject:self afterDelay:0.2];
//    }
  // self.navigationController.fd_prefersNavigationBarHidden = YES;
}
- (void)shownav
{
   [self.navigationController  setNavigationBarHidden:NO animated:YES];
}

- (BOOL)fd_prefersNavigationBarHidden {
    return YES;
}
//- (void)viewDidAppear:(BOOL)animated
//{
//    [super  viewDidAppear:animated];
//     [self.navigationController  setNavigationBarHidden:NO animated:animated];
//}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController  setNavigationBarHidden:NO animated:animated];
}
- (void)navigationController:(UINavigationController*)navigationController didShowViewController:(UIViewController*)viewController animated:(BOOL)animated
{

}
- (void)viewDidLoad
{
  self.title = @"第二页";
    self.isPush = YES;
    //[self.navigationController  setNavigationBarHidden:NO animated:YES];
    self.view.backgroundColor = [UIColor  whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem  alloc]initWithTitle:@"设置" style:UIBarButtonItemStylePlain target:self action:@selector(loginOut)];
     _grandVC = [[SevenGrannChildVC alloc]init];
    self.navigationController.fd_prefersNavigationBarHidden = YES;
    
    [self  addBtn];
}
- (void)addBtn
{
    
    UIButton  *  button = [UIButton  buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(200, 200, 80, 40);
    [button  setTitle:@"跳到第三页" forState:UIControlStateNormal];
    [self.view  addSubview:button];
    [button  addTarget:self action:@selector(moveClick:) forControlEvents:UIControlEventTouchUpInside];
}
- (void)moveClick:(UIButton  *)sender
{
   
    [self.navigationController  pushViewController:_grandVC animated:YES];
}
- (void)loginOut
{
    [self test2];
}
- (void)test1
{
    SecViewController  *  sec = [[SecViewController  alloc]init];
    [self  addChildViewController:sec];
    [self.navigationController  pushViewController:sec animated:YES];
}

- (void)test2
{
    SecViewController  *  sec = [[SecViewController  alloc]init];
    [self.navigationController  pushViewController:sec animated:YES];
}
@end
