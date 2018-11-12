////
////  UIButton+DelayControl.m
////  控件系数-03
////
////  Created by 张玺 on 16/7/1.
////  Copyright © 2016年 张玺. All rights reserved.
////
//
//#import "UIButton+DelayControl.h"
//#import <objc/runtime.h>
//
//@implementation UIButton (DelayControl)
//static const char *UIControl_delayTimeInterval = "UIControl_delayTimeInterval";
//
//// 如果在分类中声明属性则只会生成这个属性的setter和getter方法的声明而不会有实现，需要自己用runTime的动态挂载添加
//- (NSTimeInterval)delayTimeInterval {
//    return [objc_getAssociatedObject(self, UIControl_delayTimeInterval) doubleValue];
//}
//- (void)setDelayTimeInterval:(NSTimeInterval)delayTimeInterval {
//    objc_setAssociatedObject(self, UIControl_delayTimeInterval, @(delayTimeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//+ (void)load
//{
//    /**
//     *  更换方法实现，解决死循环调用
//     */
//    Method normalAction = class_getInstanceMethod(self, @selector(sendAction:to:forEvent:));
//    Method DelayAction = class_getInstanceMethod(self, @selector(delaySendAction:to:froEvent:));
//    
//    method_exchangeImplementations(normalAction, DelayAction);
//}
//
//- (void)delaySendAction:(SEL)action to:(id)target froEvent:(UIEvent *)event
//{
//    
//    if (self.delayTimeInterval > 0) {
//        if (self.userInteractionEnabled) {
//            
//            [self delaySendAction:action to:target froEvent:event];
//        }
//        self.userInteractionEnabled = NO;
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(self.delayTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            self.userInteractionEnabled = YES;
//        });
//        
//    } else {
//        [self delaySendAction:action to:target froEvent:event];
//    }
//    
//}
//
//@end
