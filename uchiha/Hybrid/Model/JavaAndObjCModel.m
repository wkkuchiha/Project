//
//  JavaAndObjCModel.m
//  uchiha
//
//  Created by 王鹏 on 2018/8/14.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "JavaAndObjCModel.h"

@implementation JavaAndObjCModel

- (void)share:(NSDictionary *)params {
    NSLog(@"Js调用了OC的share方法，参数为：%@", params);
}

- (void)callWithDict:(NSDictionary *)params {
    NSLog(@"Js调用了OC的方法，参数为：%@", params);
}

- (void)callCamera {
    NSLog(@"js调用了oc的方法，调用系统的相册");
    // js调用了oc，可以传一个回调方法的参数，进行回调js
    JSValue * value = self.jsContext[@"jsFunc"];
    [value callWithArguments:nil];
}

- (void)jsCallObjAndObjc:(NSDictionary *)params {
    JSValue * value = self.jsContext[@"jsParamFunc"];
    [value callWithArguments:@[@{@"age":@10,@"name":@"uchiha",@"height":@15}]];
}

- (void)showAlert:(NSString *)title msg:(NSString *)msg {
    dispatch_async(dispatch_get_main_queue(), ^{
        UIAlertView * alert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
        [alert show];
    });
}

@end
