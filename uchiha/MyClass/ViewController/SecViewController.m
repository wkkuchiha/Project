//
//  SecViewController.m
//  控件系数-03
//
//  Created by 张玺 on 15/11/16.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "SecViewController.h"
#import "UIView+Extension.h"

@interface SecViewController ()
{
    UIScrollView *  _scrollView;
}
@end

@implementation SecViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self  setUpView];
    self.view.backgroundColor=[UIColor  grayColor];
    [self  setTestView];
    [self  handleDate];
}
- (void)setUpView
{
    _scrollView=[[UIScrollView  alloc]initWithFrame:CGRectMake(0, 90, self.view.width, 200)];
    [self.view  addSubview:_scrollView];
    _scrollView.showsHorizontalScrollIndicator=NO;
    _scrollView.showsVerticalScrollIndicator=YES;
    _scrollView.backgroundColor=[UIColor  cyanColor];
    _scrollView.contentSize=CGSizeMake(0, 400);
    
    UIView  *  bigView=[[UIView  alloc]initWithFrame:CGRectMake(0, 5, self.view.width, 150)];
    bigView.backgroundColor=[UIColor  blueColor];
    [_scrollView  addSubview:bigView];
    
    UIControl  *  redControl = [[UIControl  alloc]initWithFrame:CGRectMake(250, 70, 40, 30)];
    redControl.backgroundColor = [UIColor  redColor];
    [bigView  addSubview:redControl];
    
    UILabel  *  label=[[UILabel  alloc]initWithFrame:CGRectMake(30, 20, 100, 40)];
    label.text=@"我是label";
    label.userInteractionEnabled=YES;
    label.backgroundColor=[UIColor  orangeColor];
    [bigView  addSubview:label];
    UITapGestureRecognizer  *  tap=[[UITapGestureRecognizer  alloc]initWithTarget:self action:@selector(labelClick)];
    [label  addGestureRecognizer:tap];
    
    UIButton *  button=[UIButton  buttonWithType:UIButtonTypeSystem];
    button.frame=CGRectMake(40, 100,90, 30);
    [button  setTitle:@"我是button" forState:UIControlStateNormal];
    [button  addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor=[UIColor  orangeColor];
    [_scrollView  addSubview:button];
}
- (void)setTestView
{
    UIView  *  fatherView=[[UIView alloc]initWithFrame:CGRectMake(0,300 ,self.view.width-10, 0)];
    [self.view  addSubview:fatherView];
    fatherView.backgroundColor=[UIColor  orangeColor];
    
    UIView  *  subView1=[[UIView  alloc]initWithFrame:CGRectMake(0, 5, 300, 20)];
    subView1.backgroundColor=[UIColor  blueColor];
    [fatherView  addSubview:subView1];
    NSLog(@"%@",NSStringFromCGRect(fatherView.bounds));
}
//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
//{
// 
//    
//    return NO;
//}


- (void)labelClick
{
    NSLog(@"点击label");
}
- (void)click
{
    NSLog(@"点击button");
}
- (void)handleDate
{
    /*
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setTimeStyle: NSDateFormatterNoStyle];
    [df setDateStyle: NSDateFormatterMediumStyle];
    NSString *nowDateStr = [df stringFromDate:[NSDate date]];
    NSDate *nowDate = [df dateFromString:nowDateStr];
    NSLog(@"%@", nowDate);
    NSLog(@"%@",nowDateStr);
    NSDate *date=[NSDate  date];
   NSDate  *  appointDate=[nowDateStr toDateWithFormat:@"yyyy-MM-dd HH:mm:ss"];
     */
   /****************当前时间转化为指定格式********/
    NSDate  *  glDate=[NSDate  date];
    NSLog(@"glDate%@",glDate);
    NSDateFormatter  *df=[[NSDateFormatter  alloc]init];
    [df  setDateFormat:@"yyyy/MM/dd HH-mm-ss"];
    NSString  * str1=[df  stringFromDate:glDate];
    NSLog(@"str1:%@",str1);
    
    NSDateFormatter  *  df2=[[NSDateFormatter  alloc]init];
    [df2  setDateFormat:@"yyyyMMddHHmmss"];
    [df2  setLocale:[[NSLocale  alloc]initWithLocaleIdentifier:@"zh_CN" ]];
    NSString  *  str2=[df2  stringFromDate:glDate];
    NSLog(@"str2%@",str2);
    
    NSDate  *  date=[[NSDate  alloc]init];
    date=[df  dateFromString:@"20151118143042"];
    [df  setDateFormat:@"yyyy/MM/dd HH-mm-ss"];
    NSString  *  str3=[df  stringFromDate:date];
    NSLog(@"str3%@",str3);
    
    
//   
//    NSDateFormatter  *  df2=[[NSDateFormatter  alloc]init];
//    [df2 setDateFormat:@"yyyyMMdd HH:mm:ss"];
//    [df2  setLocale:[[NSLocale  alloc]initWithLocaleIdentifier:@"zh_CN" ]];
//    NSString  *  str=[df2  stringFromDate:[NSDate  date]];
//    NSLog(@"str2%@",str);
//    
//    
//    NSDateFormatter  *  df3=[[NSDateFormatter  alloc]init];
//    [df3 setDateFormat:@"yyyyMMddHH:mm:ss"];
//    [df3  setLocale:[[NSLocale  alloc]initWithLocaleIdentifier:@"zh_CN" ]];
//    NSDate  *  tempDate=[NSDate  new];
//    tempDate=[df3  dateFromString:@"20140716155436"];
//    NSString  *  str3=[NSString  stringWithFormat:@"%@",tempDate];
//    NSLog(@"str3%@",str3);
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
