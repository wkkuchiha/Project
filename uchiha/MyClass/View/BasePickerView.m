//
//  BasePickerView.m
//  控件系数-03
//
//  Created by 张玺 on 15/11/18.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "BasePickerView.h"
#import "UIView+CustomMethod.h"
#import "UIView+Extension.h"

@interface  BasePickerView()
{
    NSInteger    _location;
}
@property(nonatomic,strong) UIView        *contentView;
@property(nonatomic,strong) UIPickerView  *basePicker;
@property(nonatomic,assign) int            top;
@property(nonatomic,copy) NSArray        *data;
@property (nonatomic,strong) UILabel     * label;


@end
@implementation BasePickerView
- (instancetype)initWithFrame:(CGRect)frame  withData:(NSArray  *)data
{
    self=[super  initWithFrame:frame];
    if (self) {
        _data=data;
        [self  initView];
        
    }
    return self;
}
- (void)initView
{
    self.backgroundColor=[UIColor  colorWithWhite:0 alpha:0.5];
    
    _basePicker=[[UIPickerView  alloc]init];
    
 
    int  height=_basePicker.frame.size.height+40;
    _top=self.frame.size.height-height;
    _contentView=[[UIView alloc]initWithFrame:CGRectMake(0, _top, self.frame.size.width, height)];
    
    _contentView.backgroundColor=[UIColor whiteColor];
    [self  addSubview:_contentView];
    
    UILabel  *  titleLB=[[UILabel  alloc]initWithFrame:CGRectMake(0, 0, self.width, 40)];
    titleLB.textColor=[UIColor  blackColor];
    titleLB.font=[UIFont  boldSystemFontOfSize:16];
    titleLB.text=@"主题";
    titleLB.textAlignment=NSTextAlignmentCenter;
    [_contentView  addSubview:titleLB];
    
    
    UIButton  * btn=[UIButton  buttonWithType:UIButtonTypeRoundedRect];
    btn.frame=CGRectMake(self.frame.size.width-60, 0, 60, 40);
    NSLog(@"--%f-----%f",self.frame.size.width,self.width);
    btn.tintColor=[UIColor  blueColor];
    //btn.backgroundColor=[UIColor  redColor];
    [btn  setTitle:@"确定" forState:UIControlStateNormal];
    [btn  addTarget:self action:@selector(selectDone) forControlEvents:UIControlEventTouchUpInside];
    [_contentView  addSubview:btn];
    
    UIButton  * cancelBtn=[UIButton  buttonWithType:UIButtonTypeRoundedRect];
    cancelBtn.frame=CGRectMake(0, 0, 60, 40);
    cancelBtn.tintColor=[UIColor blueColor];
    [cancelBtn  setTitle:@"取消" forState:UIControlStateNormal];
    [cancelBtn  addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [_contentView  addSubview:cancelBtn];
    
    [_contentView  createLineWithColor:[UIColor  grayColor] frame:CGRectMake(0, 39.5, self.width, 0.5)];
    
    _basePicker.frame=CGRectMake(0, 40, self.width, _basePicker.frame.size.height);

    _basePicker.dataSource=self;
    _basePicker.delegate=self;
    _basePicker.showsSelectionIndicator=YES;
    _basePicker.backgroundColor=[UIColor whiteColor];
    [_contentView  addSubview:_basePicker];
   
  
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tongzhi:) name:@"tongzhi" object:nil];
    
    
}
- (void)tongzhi:(NSNotification *)text{
    NSLog(@"%@",text.userInfo[@"textOne"]);
    NSLog(@"－－－－－接收到通知------");
//    _location = [text.userInfo[@"textOne"] intValue];
//    NSLog(@"loca%ld",(long)_location);
//    [_basePicker  reloadAllComponents];
    
}
- (void)selectDone
{
    [self  dismiss];
    if (_selectDoneHandler) {
        _selectDoneHandler([_data  objectAtIndex:[_basePicker  selectedRowInComponent:0]]);
         NSLog(@"zhangxiceshi%@",[_data objectAtIndex:[_basePicker selectedRowInComponent:0]]);
    }
}
-(void)dismiss
{
    [UIView animateWithDuration:0.25f animations:^{
        _contentView.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, _contentView.frame.size.height);
    } completion:^(BOOL finished){
        [self removeFromSuperview];
    }];
}

- (void)showInSuperView:(UIView  *)superView
{
    if (!superView) {
        return;
    }
    _contentView.frame=CGRectMake(0, self.frame.size.height, _contentView.frame.size.width, _contentView.frame.size.height);
    [superView  addSubview:self];
    [UIView  animateWithDuration:0.25f animations:^{
        _contentView.frame = CGRectMake(0, _top, self.frame.size.width, _contentView.frame.size.height);
    }];
}
#pragma mark  -------datasource and delegate
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return _data.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return  pickerView.frame.size.height / 5;
}

//- (NSString  *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
//{
//    NSString  * item=[_data  objectAtIndex:row];
//    
//    return item;
//}

//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    //UILabel  *  label = [[UILabel  alloc]init];
//     _label = [[UILabel  alloc]init];
//    _label.tag =row+1000;
//   
//  
//    _label.textAlignment = NSTextAlignmentCenter;
//    _label.text = [_data  objectAtIndex:row];
//    
//    _label.textColor = [UIColor  redColor];
//    return _label;
//}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString  * iteme = [_data  objectAtIndex:row];
    
    
    UIColor *foregroundColor = [UIColor blueColor];
    if (row == _location) {
        foregroundColor = [UIColor redColor];
    }
   
    NSDictionary *attrsDic = @{NSForegroundColorAttributeName: foregroundColor
                               
                                                                                   };
   
   NSAttributedString  * attItem = [[NSAttributedString  alloc]initWithString:iteme  attributes:attrsDic];

    return attItem;
    
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _location = row;
    
//    NSNotification  *  notice = [NSNotification notificationWithName:@"dd" object:nil userInfo:@{@"gg":[NSNumber  numberWithInteger:row]}];
//    [[NSNotificationCenter  defaultCenter]postNotification:notice];
    NSDictionary *dict =[[NSDictionary alloc] initWithObjectsAndKeys:[NSNumber  numberWithInteger:row],@"textOne", nil];
    //创建通知
    NSNotification *notification =[NSNotification notificationWithName:@"tongzhi" object:nil userInfo:dict];
    //通过通知中心发送通知
    [[NSNotificationCenter defaultCenter] postNotification:notification];
     [_basePicker  reloadAllComponents];
}





@end
