//
//  SevenTeenViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/3/14.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "SevenTeenViewController.h"

@interface SevenTeenViewController ()

@end

@implementation SevenTeenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor  whiteColor];
    self.title = @"多线程";
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{/*
    异步执行
     dispatch_async(<#dispatch_queue_t queue#>, <#^(void)block#>)
    同步执行，只能在当前线程进行，
    dispatch_sync(<#dispatch_queue_t queue#>, <#^(void)block#>)
  */
  /*
   并发队列：多任务并发执行，在异步线程下有效 concurrrent    dispatch_queue_t q = dispatch_queue_create("itheima", DISPATCH_QUEUE_CONCURRENT);
   串行队列：任务一个接一个执行  dispatch_queue_t q = dispatch_queue_create(“chuanXing", NULL);
   */
    //全局并发队列  并发+异步
    //[self  async];
    //串行队列  串行+异步
   // [self sync];
    //同步+串行
    //[self syncT];
    //主队列 ：：特殊的串行队列
   // [self  mainQueue];
    //线程间通信
    //[self  GCDStock];
    //gcd其他常用函数
   // [self  GCDOtherMethod];
    //延时执行
   // [self run];
    //一次性代码
    //[self  dispatch_once];
    //文件剪切
    [self  paste];
   }
- (void)async
{
    dispatch_queue_t queue  = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"1::%d",i);
        }
    });
    dispatch_async(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"2::%d",i);
        }
    });
    dispatch_async(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"3::%d",i);
        }
    });

}
- (void)sync
{
     dispatch_queue_t  queue =dispatch_queue_create("com.miutrip", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"1::%d",i);
        }
    });
    dispatch_async(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"2::%d",i);
        }
    });
    dispatch_async(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"3::%d",i);
        }
    });
}
- (void)syncT
{
    dispatch_queue_t  queue =dispatch_queue_create("com.miutrip", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"1::%d",i);
        }
    });
    dispatch_sync(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"2::%d",i);
        }
    });
    dispatch_sync(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"3::%d",i);
        }
    });
}
- (void)mainQueue
{
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"1::%d",i);
        }
    });
    dispatch_async(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"2::%d",i);
        }
    });
    dispatch_async(queue, ^{
        for (int  i=0; i<10; i++) {
            NSLog(@"3::%d",i);
        }
    });
}

- (void)GCDStock
{
    UIImageView *  imageView = [[UIImageView  alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    [self.view addSubview:imageView];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSURL *url = [NSURL URLWithString:@"http://www.sh.10086.cn/sh/zthd/mfkd/images/img_05.jpg"];
        
        // 加载图片
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        // 生成图片
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            imageView.image = image;
        });
    });
}

- (void)GCDOtherMethod
{
    //dispatch_queue_t  queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t  queue = dispatch_queue_create("miutrip.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        //for (int  i=0; i<10; i++) {
            NSLog(@"1::%d",31);
        //}
    });
    
    dispatch_async(queue, ^{
       // for (int  i=0; i<10; i++) {
            NSLog(@"2::%d",31);
       // }
    });
    dispatch_barrier_async(queue, ^{
      //  for (int  i=0; i<10; i++) {
            NSLog(@"5::%d",10);
        //}
    });
    
    dispatch_async(queue, ^{
       // for (int  i=0; i<10; i++) {
            NSLog(@"3::%d",98);
        //}
    });
    
    dispatch_async(queue, ^{
        //for (int  i=0; i<10; i++) {
            NSLog(@"4::%d",10);
       // }
    });
    
}

- (void)run
{
    //[self  performSelector:@selector(eat) withObject:nil afterDelay:0.3];
    /*
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    NSLog(@"等了三秒吃饭");
    });
     */
    [NSTimer  scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(eat) userInfo:nil repeats:NO];
}
- (void)eat
{
    NSLog(@"等了三秒吃饭");
}
- (void)dispatch_once
{
    static  dispatch_once_t  onceToken;
    dispatch_once(&onceToken, ^{
        NSLog(@"你是大逗逼");
    });
}
- (void)paste
{
    NSFileManager  *  mgr = [NSFileManager  defaultManager];
    NSString  *  fromPath = @"/Users/zhangxi/Downloads/logo_index.png";
    NSString  *  toPaht = @"/Users/zhangxi/Documents";
    toPaht = [toPaht  stringByAppendingPathComponent:@"logo_index.png"];
    NSLog(@"from::%@  \n to::%@",fromPath,toPaht);
    
    [mgr  moveItemAtPath:fromPath toPath:toPaht error:nil];
}


@end
