//
//  ThirtyOneViewControler.m
//  控件系数-03
//
//  Created by 张玺 on 16/7/7.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "ThirtyOneViewControler.h"

@implementation ThirtyOneViewControler
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor  whiteColor];
    self.title = @"dispatch_semaphore线程间同步";
    [self test1];
}
//dispatch_semaphore
- (void)test1
{
  //dispatch_semaphore_t
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    NSMutableArray *array = [NSMutableArray array];
    
    for (int index = 0; index < 100000; index++) {
        
        dispatch_async(queue, ^(){
            
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);//
            
            NSLog(@"addd :%d", index);
            
            [array addObject:[NSNumber numberWithInt:index]];
            
            dispatch_semaphore_signal(semaphore);
            
        });
        
    }
}
@end
