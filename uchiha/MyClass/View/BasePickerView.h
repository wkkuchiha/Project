//
//  BasePickerView.h
//  控件系数-03
//
//  Created by 张玺 on 15/11/18.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^SelectDoneHandler)(NSString  * item);

@interface BasePickerView : UIView<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic,strong)UIPickerView  *  pickerView;

@property (nonatomic,copy) SelectDoneHandler  selectDoneHandler ;

- (instancetype)initWithFrame:(CGRect)frame  withData:(NSArray  *)data;

- (void)showInSuperView:(UIView  *)superView;

- (void)dismiss;
@end
