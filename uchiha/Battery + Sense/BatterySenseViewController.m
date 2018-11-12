//
//  BatterySenseViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/12.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "BatterySenseViewController.h"
#include <mach/task_info.h>
#import <mach/task.h>
#import <mach/vm_map.h>
#import <mach/thread_act.h>
@interface BatterySenseViewController ()

@end

@implementation BatterySenseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"电池电量和代码感知";
    [self setupView];
}

- (void)setupView {
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    BOOL prompt = [defaults boolForKey:@"promptForBattery"];
    NSInteger minLevel = [defaults integerForKey:@"minBatteryLevel"];
    BOOL canAutoProceed = [self showProceedWithMinLevel:minLevel];
    if (canAutoProceed) {
        [self executeIntensiveOperation];
    } else {
        if (prompt) {
            UIAlertController * controller = [UIAlertController alertControllerWithTitle:@"Proceed" message:@"Battery level below minimun required .Proceed?" preferredStyle:UIAlertControllerStyleAlert];
           
            UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"标题1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            
            [controller addAction:action1];
            [controller addAction:action2];
            
            [[self rac_signalForSelector:@selector(controller:clickedButtonAtIndex:) fromProtocol:@protocol(UIAlertViewDelegate)] subscribeNext:^(RACTuple *tuple) {
                
                if (tuple.first) {
                    [self queueIntensiveOperation];
                } else {
                    [self executeIntensiveOperation];
                }
            }];
            [self presentViewController:controller animated:YES completion:nil];
        }
    }
}

- (void)queueIntensiveOperation {
    
}

- (void)executeIntensiveOperation {
    
}

- (BOOL)showProceedWithMinLevel:(NSUInteger)minLevel {
    UIDevice * device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    
    UIDeviceBatteryState state = device.batteryState;
    // 在充电或电池已经充满的情况下，任何操作都可执行
    if (state == UIDeviceBatteryStateCharging || state == UIDeviceBatteryStateFull) {
        return YES;
    }
    // UIDevice返回的batteryLevel的范围在0.00 - 1.00之间
    NSUInteger batteryLevel = (NSUInteger)(device.batteryLevel * 100);
    if (batteryLevel >= minLevel) {
        return YES;
    }
    return NO;
}

/**
 当剩余电量较低时，提示用户，并且请求用户授权执行电源密集性操作，当然，只有当用户同意才行
 总是当一个指示符显示长时间任务的进度，包括设备上即将完成的计算或者下载一些内容，向用户提供完成额进度估算，以帮助用户评估是否充电
 */
- (CGFloat)appCPUUsage {
    kern_return_t kr;
    task_info_data_t info;
    mach_msg_type_number_t infoCount = TASK_INFO_MAX;
    kr = task_info(mach_task_self(),TASK_BASIC_INFO,(task_info_t)info,&infoCount);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    thread_array_t thread_list;
    mach_msg_type_number_t thread_count;
    thread_info_data_t thinfo;
    mach_msg_type_number_t thread_info_count;
    thread_basic_info_t basic_info_th;
    
    kr = task_threads(mach_task_self(), &thread_list, &thread_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    float tot_cpu = 0;
    int j ;
    for (j = 0; j < thread_count; j++) {
        thread_info_count = THREAD_INFO_MAX;
        kr = thread_info(thread_list[j],THREAD_BASIC_INFO,(thread_info_t)thinfo,&thread_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        basic_info_th = (thread_basic_info_t)thinfo;
        if (!(basic_info_th -> flags & TH_FLAGS_IDLE)) {
            tot_cpu += basic_info_th -> cpu_usage / (float)TH_USAGE_SCALE * 100.0;
        }
    }
    vm_deallocate(mach_task_self(),(vm_offset_t)thread_list,thread_count * sizeof(thread_t));
    return tot_cpu;
}


@end
