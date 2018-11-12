//
//  HybirdViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/8/12.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "HybirdViewController.h"
#import "JavaScriptCoreController.h"
@interface HybirdViewController ()

@end

@implementation HybirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    NSArray * data= @[@"拦截协议",@"JavaScriptCore库",@"WKWebView",@"自定义NSURLProtocol拦截",@"WebViewJavascriptBridge"];
    for (int i = 0 ; i < 5; i++) {
        // 圆角按钮
        UIButton *mapBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        switch (i) {
            case 0:
                mapBtn.frame = CGRectMake(70, 84, 200, 44);
                break;
            case 1:
                mapBtn.frame = CGRectMake(70, 84 + 44 *  1 + 10, 200, 44);
                break;
            case 2:
                mapBtn.frame = CGRectMake(70,  84 + 44 * 2 + 20,200, 44);
                break;
            case 3:
                mapBtn.frame = CGRectMake(70, 84 + 44 * 3 + 30, 200, 44);
                break;
            case 4:
                mapBtn.frame = CGRectMake(70, 84 + 44 * 4 + 40, 200, 44);
                break;
            default:
                break;
        }
        [mapBtn setTitle:data[i] forState:UIControlStateNormal];
        [self.view addSubview:mapBtn];
        [[mapBtn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            [self clickMapBtn:x];
        }];
    }
}

- (void)clickMapBtn:(id)value {
    UIButton * btn = (UIButton *)value;
    if ([btn.titleLabel.text isEqualToString:@"JavaScriptCore库"]) {
        JavaScriptCoreController * javascriptcore = [JavaScriptCoreController new];
        [self.navigationController pushViewController:javascriptcore animated:YES];
    }
}
@end
