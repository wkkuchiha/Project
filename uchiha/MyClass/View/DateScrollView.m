//
//  DateScrollView.m
//  控件系数-03
//
//  Created by 张玺 on 16/2/27.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "DateScrollView.h"

@implementation DateScrollView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.showsHorizontalScrollIndicator = YES;
        self.showsVerticalScrollIndicator = NO;
        self.scrollsToTop = YES;
        self.backgroundColor = [UIColor  cyanColor];
        self.scrollEnabled = YES;
        
        
        [self  addView];
    }
    return self;
}
- (void)addView
{
    float x= 0;
    float y= 0;
    float width = 53;
    float height = 48;
    //  self  = [[UIScrollView alloc] initWithFrame:self.bounds];
    for (int  i= 0; i< 3; i++) {
        x = width*i;
        UIView  *  vi = [[UIView  alloc]initWithFrame:CGRectMake(x, 0, width-3, height)];
        //control.tag = 100 + i;
        //        UILabel  *  lb = [[UILabel  alloc]initWithFrame:CGRectMake(0, 0, control.width, control.height)];
        //       // [control  addSubview:lb];
        //        lb.textColor = RedColor;
        //        lb.text = [NSString  stringWithFormat:@"周%d",i];
        //        lb.backgroundColor = [UIColor cyanColor];
        //[control  addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        vi.backgroundColor = [UIColor  orangeColor];
        //  self.backgroundColor = [UIColor  blueColor];
        [self  addSubview:vi];
        
    }
    UIView  *  view = [[UIView  alloc]initWithFrame:CGRectMake(0, 0, 100, 30)];
    view.backgroundColor = [UIColor  redColor];
    self.userInteractionEnabled = YES;
    self.contentSize =  CGSizeMake(400, 48);
    self.backgroundColor = [UIColor cyanColor];
}



@end
