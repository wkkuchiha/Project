//
//  JavaScriptObjectiveCDelegate.h
//  PjApp
//
//  Created by xinghuo on 2017/4/21.
//  Copyright © 2017年 appress. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

@protocol JavaScriptObjectiveCDelegate <JSExport>
// js调用此方法来调用oc的方法
- (void)callCamera;
- (void)share:(NSDictionary *)params;
// js中调用时，多个参数需要驼峰法则
- (void)showAlert:(NSString *)title msg:(NSString *)msg;
// 通过json传递进来
- (void)callWithDict:(NSDictionary *)params;
// js调用oc，然后在oc中调用js方法来传值给js
- (void)jsCallObjAndObjc:(NSDictionary *)params;
@end
