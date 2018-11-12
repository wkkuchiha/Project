//
//  JavaAndObjCModel.h
//  uchiha
//
//  Created by 王鹏 on 2018/8/14.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JavaScriptObjectiveCDelegate.h"
@interface JavaAndObjCModel : NSObject<JavaScriptObjectiveCDelegate>

@property(nonatomic,weak)JSContext * jsContext;
@property(nonatomic,weak)UIWebView *webView;

@end
