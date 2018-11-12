//
//  ThirdViewController.m
//  控件系数-03
//
//  Created by 张玺 on 15/11/18.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "ThirdViewController.h"
#import "UIView+Extension.h"
#import "BasePickerView.h"

#define         UIColorFromRGB(rgbValue)        [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title=@"第三个";
    self.view.backgroundColor=UIColorFromRGB(0xF0E2C8);
    [self  setUpPickView];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)setUpPickView
{
    UIButton  *  btn=[UIButton  buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(self.view.width/2-15, 100, 100, 40);
    [btn  setTitle:@"pickerView" forState:UIControlStateNormal];
    [btn  addTarget:self action:@selector(pickerAppear) forControlEvents:UIControlEventTouchUpInside];
    [self.view  addSubview:btn];
}
- (void)pickerAppear
{
    NSArray  *  dataArray=[NSArray  arrayWithObjects:@"fasdjkl",@"ddd",@"fs",@"fasdf",@"fsdf",@"fasdjkl",@"ddd",@"fs",@"fasdf",@"fsdf", nil];
    BasePickerView  *  basePicker=[[BasePickerView  alloc]initWithFrame:self.navigationController.view.bounds  withData:dataArray];
   // [self.view  addSubview:basePicker];
    [basePicker  showInSuperView:self.navigationController.view];
    
    basePicker.selectDoneHandler=^(NSString  *  item)
    {
        NSLog(@"result%@",item);
    };
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
