//
//  TwelveViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/1/14.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "TwelveViewController.h"
#import "UIView+Extension.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
@interface TwelveViewController ()
{
    BOOL pageStillLoading ;
    
    UIView  * _countDownView;
    NSTimer * _timer;
    int       _countdown;
}
@end

@implementation TwelveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor  whiteColor];
    self.title = @"runloop";
    [self  test1];
   // [self test2];
   // [self  test3];
}
- (void)test1
{
   pageStillLoading = YES;
    
    UIButton * blueBtn = [UIButton  buttonWithType:UIButtonTypeSystem];
    [blueBtn  setTitle:@"start" forState:UIControlStateNormal];
    [[blueBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [self clickBlueBtn];
    }];
    
    [self.view  addSubview:blueBtn];
    blueBtn.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, 84).widthIs(44).heightIs(44);
}

- (void)clickBlueBtn {
    _countdown = 0;
    CGFloat countDownWidth = self.view.width/3*2;
    CGFloat margin = (self.view.height-64-68-92-countDownWidth)/2;
    CGFloat top = 64+92+margin+countDownWidth/6;
    _countDownView = [[UIView alloc] initWithFrame:CGRectMake((self.view.width-countDownWidth/2)/2, top, countDownWidth/2, countDownWidth/2)];
    _countDownView.layer.cornerRadius = countDownWidth/4;
    _countDownView.layer.masksToBounds = YES;
    _countDownView.backgroundColor = [UIColor  yellowColor];
    _countDownView.layer.opacity = 0.5;
    [self.view addSubview:_countDownView];
    [self startCountDown];
}

- (void)click:(UIButton  *)sender
{
    NSLog(@"begin"); // 1
    [[NSRunLoop mainRunLoop] runUntilDate:[NSDate dateWithTimeIntervalSinceNow:10.0]];  // 2
    NSLog(@"end"); // 3
    
    pageStillLoading = YES;
    [NSThread detachNewThreadSelector:@selector(loadPageInBackground:)toTarget:self withObject:nil]; // 4
    while (pageStillLoading) {
        NSLog(@"---%d",pageStillLoading);
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]]; // 5
        NSLog(@"while end");
    }
    NSLog(@"over");
}

-(void)loadPageInBackground:(id)sender
{
    sleep(3); // 6
    NSLog(@"timer"); // 7
    pageStillLoading = NO;// 8
    NSLog(@"jj%d",pageStillLoading);
}

- (void)test2
{
    //pageStillLoading = YES;
    NSLog(@"start  thread......");
    
    NSTimer * timer = [NSTimer  timerWithTimeInterval:2 target:self selector:@selector(doTimerTask) userInfo:nil repeats:YES];
    [[NSRunLoop  currentRunLoop]  addTimer:timer forMode:NSDefaultRunLoopMode];
    while (pageStillLoading) {
        [self doOtherTask];
        BOOL ret = [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode beforeDate:[NSDate distantFuture]];
        NSLog(@"after runloop counting.........: %d", ret);
    }
      NSLog(@"finishing thread.........");
}
- (void)doTimerTask
{
    NSLog(@"do timer task");
}

- (void)doOtherTask
{
    NSLog(@"do other task");
    pageStillLoading=NO;
}

- (void)startCountDown
{
    _timer = [NSTimer timerWithTimeInterval:1.0f target:self selector:@selector(timingBegin:) userInfo:nil repeats:YES];
    if ([_timer isValid]) {
        [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSDefaultRunLoopMode];
    }else {
        [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timingBegin:) userInfo:nil repeats:YES];
    }
    [_timer fire];
  
   // [NSTimer  scheduledTimerWithTimeInterval:1 target:self selector:@selector(timingBegin:) userInfo:nil repeats:YES];
}

- (void)timingBegin:(NSTimer *)timer
{
    if(_countdown % 2 == 0){
        [UIView animateWithDuration:1.8 animations:^{
            _countDownView.transform = CGAffineTransformMakeScale(2.4, 2.4);
            _countDownView.layer.opacity = 0;
        } completion:^(BOOL finished){
            _countDownView.transform = CGAffineTransformMakeScale(1, 1);
            _countDownView.layer.opacity = 0.5;
        }];
    }
    _countdown ++;
}
@end
