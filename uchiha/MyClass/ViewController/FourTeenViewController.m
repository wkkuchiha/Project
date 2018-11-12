//
//  FourTeenViewController.m
//  控件系数-03
//
//  Created by 张玺 on 16/2/19.
//  Copyright © 2016年 张玺. All rights reserved.
//

#import "FourTeenViewController.h"
#import "Person.h"
#import <objc/runtime.h>

@interface FourTeenViewController ()

@end

@implementation FourTeenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"RunTime";
    self.view.backgroundColor = [UIColor  whiteColor];
    //1.获取一个类的属性
    //[self  test1];
    //2.动态创建一个类
    [self  test2];
    
    
}

- (void)test1
{
    id  personClass = objc_getClass("Person");
    
    unsigned  int  outCount,i;
    
    objc_property_t  * properties = class_copyPropertyList(personClass, &outCount);
    
    for (i =0; i<outCount; i++) {
        objc_property_t  property = properties[i];
        NSLog(@"name:%s;Attributes:%s",property_getName(property),property_getAttributes(property));
    }
}

- (void)test2
{
    // 1.动态创建对象 创建一个Person类 继承自NSObject类
//    Class newClass = objc_allocateClassPair([NSObject class], "Student", 0);
//    
//    // 使用block作为方法的IMP
//    IMP myIMP = imp_implementationWithBlock(^(id _self, NSString *string) {
//        NSLog(@"Hello %@", _self);
//    });
//    
//    // 为该类增加名为Report的方法
//    class_addMethod(newClass, @selector(report), (IMP)myIMP, @"v@:");
//    
//    // 注册该类
//    objc_registerClassPair(newClass);
//    
//    // 创建一个 Student 类的实例
//    id instantOfNewClass = [[newClass alloc] init];
//    
//    // 调用方法
//    [instantOfNewClass report];
    
}

// 自定义一个方法
void reportFunction (id self, SEL _cmd) {
    NSLog(@"This object is %p", self);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
