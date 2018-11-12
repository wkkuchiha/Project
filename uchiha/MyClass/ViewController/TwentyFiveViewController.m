//
//  TwentyFiveViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/5/10.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "TwentyFiveViewController.h"

@interface TwentyFiveViewController ()

@end

@implementation TwentyFiveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"数组内部排序";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self test1];
    [self test2];
    [self test3];
}
- (void)test1
{
    NSMutableArray  *  numArray = [NSMutableArray  arrayWithObjects:@"3",@"2",@"43",@"60",@"24",@"43",@"100",@"54",@"60", nil];
    //
    [numArray sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1  integerValue] > [obj2 integerValue];
    }];
    NSLog(@"数组排序%@",numArray);
}
- (void)test2
{
    NSMutableArray  *  nameArray = [NSMutableArray  arrayWithObjects:@"l",@"a",@"b",@"z",@"h", nil];
    [nameArray  sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return  [obj1  compare:obj2];
    }];
      NSLog(@"名字排序%@",nameArray);
    for (NSString  *  obj in nameArray) {
        NSLog(@"%@",obj);
    }
}
- (void)test3
{
    NSDate  *  date1 = [NSDate  dateWithTimeIntervalSinceNow:60*60*1];
    NSDate  *  date2 = [NSDate  dateWithTimeIntervalSinceNow:-60*60*1];
    NSDate  *  date3 = [NSDate  dateWithTimeIntervalSinceNow:0];
    NSMutableArray  *  timeArray = [NSMutableArray  arrayWithObjects:date1,date2, date3,nil];
    [timeArray  sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return  [obj1  compare:obj2];
    }];
    NSLog(@"%@",timeArray);
}



@end
