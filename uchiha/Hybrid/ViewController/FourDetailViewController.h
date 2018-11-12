//
//  FourDetailViewController.h
//  uchiha
//
//  Created by uchiha on 2017/8/11.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

typedef void(^callBackFunc)(NSString *func);

@interface FourDetailViewController : UIViewController
@property(strong)WKWebView *webView;
@property(copy)NSString *requestUrl;

@property(copy)callBackFunc backFunc;
@end
