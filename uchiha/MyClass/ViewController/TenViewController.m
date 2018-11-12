//
//  TenViewController.m
//  控件系数-03
//
//  Created by 张玺 on 15/12/27.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "TenViewController.h"

@interface TenViewController ()

@end

@implementation TenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"图层";
    self.view.backgroundColor = [UIColor  cyanColor];
    
    
    //[self  test1];
    [self  test2];
}
- (void)test1
{
    UIView  *  view1 = [[UIView  alloc]initWithFrame:CGRectMake(10, 70, 100, 200)];
    [self.view  addSubview:view1];
    view1.backgroundColor = [UIColor  grayColor];
    
    view1.layer.shadowColor = [UIColor  blueColor].CGColor;
    
//    view1.layer.borderWidth = 5;
//    view1.layer.borderColor = [UIColor  redColor].CGColor;
    
    view1.layer.shadowColor = [UIColor  blueColor].CGColor;
    view1.layer.shadowOffset = CGSizeMake(5, 5);
    view1.layer.shadowOpacity = 0.5;
   // view1.layer.masksToBounds = YES;
   // view1.layer.cornerRadius = 4;
}

- (void)test2
{
    UIView  *  view1 = [[UIView  alloc]initWithFrame:CGRectMake(100, 120, 100, 150)];
    [self.view  addSubview:view1];
    view1.backgroundColor = [UIColor  grayColor];
   // view1.transform= CGAffineTransformMakeRotation(M_PI_2);
    view1.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
    
    NSValue  *  value = [NSValue  valueWithCATransform3D:CATransform3DMakeRotation(M_PI_2, 0, 0, 1)];
   // [view1.layer  setValue:value forKey:@"transform"];
    [view1.layer  setValue:@(M_PI_4) forKey:@"transform.rotation"];
    
    UIView  *  view2 = [[UIView  alloc]initWithFrame:CGRectMake(200, 330, 100, 50)];
    [self.view  addSubview:view2];
    view2.backgroundColor = [UIColor  blueColor];
  //  [view2.layer  setValue:[NSValue  valueWithCATransform3D:CATransform3DMakeScale(2, 0.5, 0)] forKey:@"transform"];
    [view2.layer  setValue:@(0.1) forKey:@"transform.scale.x"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
