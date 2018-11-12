//
//  NewFourDetatilViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/11.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "NewFourDetatilViewController.h"

@interface NewFourDetatilViewController ()<UIWebViewDelegate>
@property(strong)UIWebView *webView;
@end

@implementation NewFourDetatilViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWebView];
}

- (void)setWebView {
    self.view.backgroundColor = [UIColor whiteColor];
    _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.requestUrl]]];
}

- (void)backToMain:(NSString *)fun {
    NSLog(@"这个代码调用了吗");
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        [weakSelf dismissViewControllerAnimated:YES completion:^{
            if (weakSelf.backFunc) {
                weakSelf.backFunc(fun);
            }
        }];
    });
}

@end
