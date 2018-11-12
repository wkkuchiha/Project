
//
//  AnimationBaseViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/24.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "AnimationBaseViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface AnimationBaseViewController ()

@property (nonatomic , strong) NSArray *operateTitleArray;

@end

@implementation AnimationBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initView];
}

-(void)initData{
    _operateTitleArray = [self operateTitleArray];
}

-(void)initView{
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, iphoneScreenWidth, 40)];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [self controllerTitle];
    label.textColor = [UIColor redColor];
    [self.view addSubview:label];
    
    self.view.backgroundColor = [UIColor whiteColor];
    if(_operateTitleArray&&_operateTitleArray.count>0){
        NSUInteger row = _operateTitleArray.count%4==0 ? _operateTitleArray.count/4 : _operateTitleArray.count/4+1;
        UIView *operateView = [[UIView alloc] initWithFrame:CGRectMake(0, iphoneScreenHeight-(row*50+20), iphoneScreenWidth, row*50+20)];
        [self.view addSubview:operateView];
       
        for (int i=0; i<_operateTitleArray.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setFrame:[self rectForBtnAtIndex:i totalNum:_operateTitleArray.count]];
            [btn setTitle:[_operateTitleArray objectAtIndex:i] forState:UIControlStateNormal];
            
            btn.tag = i;
            
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//            [[btn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
//                NSLog(@"arc点击事件");
//            }];
            [operateView addSubview:btn];
            btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }
    }
}

-(NSString *)controllerTitle{
    return @"默认标题";
}

-(CGRect)rectForBtnAtIndex : (NSUInteger)index totalNum : (NSUInteger)totleNum{
    //每一行最多显示4个
    NSUInteger maxColumnNum = 4;
    //每个按钮的列间距
    CGFloat columnMargin = 20;
    //每个按钮的行间距
    CGFloat rowMargin = 20;
    
    //每个按钮的宽度
    CGFloat width = (iphoneScreenWidth - columnMargin*5)/4;
    //每个按钮的高度
    CGFloat height = 30;
    
    //每个按钮的偏移
    CGFloat offsetX = columnMargin+(index%maxColumnNum)*(width+columnMargin);
    CGFloat offsetY = rowMargin+(index/maxColumnNum)*(height+rowMargin);

    
    return CGRectMake(offsetX, offsetY, width, height);
}

- (void)clickBtn:(UIButton *)btn {
    
}

@end
