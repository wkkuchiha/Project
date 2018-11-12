//
//  TwentyThreeViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/4/27.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "TwentyThreeViewController.h"

@interface TwentyThreeViewController ()
{
    NSMutableArray  *  _dataArray;
}
@end

@implementation TwentyThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"排序算法";
    self.view.backgroundColor = [UIColor whiteColor];
    _dataArray = [NSMutableArray   arrayWithObjects:@"12",@"5",@"18",@"1",@"5",@"17",nil];
    //冒泡排序
    [self  test1];
}
- (void)test1
{
    NSLog(@"%@",_dataArray);
    for(int  i=0;i<_dataArray.count;i++)
    {
        for (int j=0; j<_dataArray.count-1; j++) {
//            NSInteger a = [[_dataArray  objectAtIndex:j] integerValue];
//            NSInteger b = [[_dataArray  objectAtIndex:j+1] integerValue];
            if ([[_dataArray  objectAtIndex:j] integerValue]>[[_dataArray  objectAtIndex:j+1] integerValue] ) {
                id temp = [_dataArray  objectAtIndex:j];
//               [_dataArray  objectAtIndex:j] = [_dataArray  objectAtIndex:j+1];
//                b = temp;
                [_dataArray  replaceObjectAtIndex:j withObject:[_dataArray  objectAtIndex:j+1]];
                [_dataArray  replaceObjectAtIndex:j+1 withObject:temp];
                
            }
        }
    }
     NSLog(@"%@",_dataArray);
}
//        NSInteger t = i;
//        for (NSInteger j = i; j < _dateDataSource.count; j++) {
//            RecentOrderModel *model = _dateDataSource[i];
//            NSDate  *  dateOld = model.creatTime;
//            RecentOrderModel *models = _dateDataSource[j];
//            NSDate  *  dateNew = models.creatTime;
//            NSTimeInterval    timeInterval = [dateOld  timeIntervalSince1970]- [dateNew timeIntervalSince1970];
//            if (timeInterval < 0) {
//                t = j;
//            }
//
//        }
//        RecentOrderModel *model = [[RecentOrderModel alloc]init];
//        model = _dateDataSource[i];
//        _dateDataSource[i] = _dateDataSource[t];
//        _dateDataSource[t] = model;
//        [_dateNew addObject:_dateDataSource[t]];

@end
