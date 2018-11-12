//
//  FourViewController.m
//  控件系数-03
//
//  Created by 张玺 on 15/12/4.
//  Copyright © 2015年 张玺. All rights reserved.
//

#import "FourViewController.h"
#import "CommonMacro.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "FourDetailViewController.h"
#import "NewFourDetatilViewController.h"
#import "HybirdViewController.h"
@interface FourViewController ()<UIWebViewDelegate,JSExport>
@property (strong)JSContext *jsContext;
@property (strong)JSContext *lastContext;
@property (assign)BOOL isFirstPage;

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setWebView];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"hybird" style:UIBarButtonItemStylePlain target:self action:@selector(hybird)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor redColor]];
    self.title=@"混编";
}

-(void)hybird {
    NSLog(@"fhdkjfkd");
    HybirdViewController * hybird = [HybirdViewController new];
    [self.navigationController pushViewController:hybird animated:YES];
}

- (void)setWebView {
    UIView *baseView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, iphoneScreenWidth, iphoneScreenHeight)];
    baseView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:baseView];
    
    UIWebView  *webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 64, iphoneScreenWidth, iphoneScreenHeight - 64)];
    webView.delegate = self;
    [self.view addSubview:webView];
    webView.scalesPageToFit = YES; // 自动适应屏幕
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:RequestURL]]];
}

- (void)webViewDidStartLoad:(UIWebView *)webView { // 网页开始加载请求，得到的通知
    NSURLRequest *request = webView.request;
    NSString * urlString = request.URL.absoluteString;
    if ([urlString containsString:@"isIos=1&"]) {
        NSLog(@"网页开始加载----------------------");
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)webView { // 网页加载请求之后，得到的通知
    NSURLRequest *request = webView.request;
    NSURL *url = [request URL];
    NSString *fileTitle = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    if ([fileTitle isEqualToString:@"金"]) {
        NSLog(@"isEqualToString-------%@",url);
    }
    
    __weak typeof(self) weakS = self;
    if (![webView respondsToSelector:@selector(valueForKeyPath:)]) {
        return;
    }
    
    JSContext * context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    if (_jsContext != context) {
        _jsContext = nil;
        _jsContext = context;
        [_jsContext setObject:self forKeyedSubscript:@"NativeObj"];
        _jsContext.exceptionHandler = ^(JSContext *context, JSValue *exception){
            //            [context evaluateScript:@"ajaxLoadEnd();"];
            context.exception = exception;
            return ;
        } ;
        if (self.jsContext ) {
            if (self.isFirstPage) {
                if (/* DISABLES CODE */ (1)) {
                    JSValue * showUserGuide = self.jsContext[@"showNewUserGuid"];
                    if (showUserGuide != nil) {
                        [showUserGuide callWithArguments:@[]];
                        
                    }
                }else {
                    JSValue * hideUserGuide = self.jsContext[@"hideNewUserGuid"];
                    if (hideUserGuide != nil) {
                        [hideUserGuide callWithArguments:@[]];
                    }
                }
            }
        }
    }
}

- (void)openDetailVc:(NSString *)openUrl {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        weakSelf.lastContext = weakSelf.jsContext ;

        NewFourDetatilViewController * detail = [[NewFourDetatilViewController alloc]init];
        detail.requestUrl =[[NSString stringWithFormat:@"%@%@",BaseURL,openUrl] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        detail.backFunc = ^(NSString *func) {
    
            if (![func containsString:@""] && func.length > 0) {
                if (weakSelf.lastContext != nil ) {
                    weakSelf.jsContext = weakSelf.lastContext;
                    NSRange  parRange  = [func rangeOfString:@"("];
                    if (parRange.location != NSNotFound ) {
                        NSString * par = [func substringWithRange:NSMakeRange(parRange.location+ 1, (func.length - parRange.location) - 2)];
                        NSArray * param = [par componentsSeparatedByString:@","];
                        NSString *callBack = [func substringToIndex:parRange.location];
                        JSValue * getList =  weakSelf.jsContext[callBack];
                        if (getList != nil) {
                            [getList callWithArguments:param];
                        }
                    }
                }
            }
        };
        [self presentViewController:detail animated:YES completion:NULL];
    });
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error { // 网页加载一个请求之后，得到的通知
    
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType { // 是否允许加载网页，也获得js要打开的网址，通过取得这个url可以与js交互
    return YES;
}
@end
