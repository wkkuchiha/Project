//
//  DataSharingViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/14.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "DataSharingViewController.h"

@interface DataSharingViewController ()

@end

@implementation DataSharingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    /**
    深层了链接为应用之间的共享数据提供了解藕方案，与访问网站时的http网址类似，iOS中的深层链接通过所谓自定义URL scheme来提供。你可以配置自己的应用，让他响应唯一的scheme，操作系统会确保无论何时使用该scheme，都有你的应用进行处理。应用可以响应任何数量的scheme
    驱动深层链接的步骤：
    1，检测scheme是否可以被处理。
    [UIApplication canOpenURL:]方法允许你在设备上安装的应用中检查是否是少有一个应用可以处理特定的scheme。选择唯一的scheme有助于检测是否安装了特定的应用
    2，通过url开启应用。一旦检测到应用的存在，下一步就是创建最终的url，并打开应用。使用[UIApplication canOpenURL:]方法启动应用
    3，在目标应用中处理链接。当应用收到url时，AppDelegate通过-[[UIApplication application : openURL :sourceApplication: annotation]获取通知。解析传入的url，提取参数/值，处理，然后继续
    响应深层链接可能将用户带往应用的其他部分，因此你应该添加一个选项，让用户可以响应应用的前一个部分。一个较好的实现方案就是使用有限的状态机
     */
    
}

// 源应用 某个视图控制器
- (void)openTargetApp {
    // 构造url
    NSURL *url = [NSURL URLWithString:@"com.uchihapeng.app://x-callback-url/quote?ticker"];
    UIApplication * app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) { // 检查应用是否装载
        [app openURL:url options:nil completionHandler:nil]; // 启动目标应用
    }
    // 否则显示错误
}

// 目标应用 应用委托
// 接受url的目标应用中委托回调
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    NSString * host = url.host; // 从url中提取必要的详细信息，包括主机，路径，查询
    NSString * path = url.path;
    NSDictionary * params = [self parseQuery:url.query];
    if ([@"x-callback-url" isEqualToString:host]) {
        if ([@"quote" isEqualToString:path]) { // 处理url，此例为检查主机和路径
            [self processQuoteUsingParsmeters:params]; // 处理引号
        }
    }
    return YES;
}

- (NSDictionary *)parseQuery:(NSString *)query {
    NSMutableDictionary * dict = [NSMutableDictionary new];
    if (query) {
        // 解析查询字符串
        NSArray * pairs = [query componentsSeparatedByString:@"&"];
        NSString * key = nil;
        NSString * value = nil;
        for (NSString * pair in pairs) {
            NSArray * kv = [pair componentsSeparatedByString:@"="];
            key = [kv.firstObject stringByRemovingPercentEncoding];
            value = [kv.lastObject stringByRemovingPercentEncoding];
        }
        [dict setObject:value forKey:key];
    }
    return [NSDictionary dictionaryWithDictionary:dict];
}

- (void)processQuoteUsingParsmeters:(NSDictionary *)params {
    NSString * ticker = [params objectForKey:@"ticker"];
    NSDate * startDate = [params objectForKey:@"start"];
    NSDate * endDate = [params objectForKey:@"end"]; // 处理提取的值，不要忘记验证码
    // 验证并且处理
}



/**
 剪贴板，用在应用之内或者应用之间的安全且标准化的机制，许多操作取决于剪贴板，特别是复制-剪切-粘贴。在应用之间也可以应用剪贴板
 通过UIPasteBoard类使用剪贴板，该类可以访问共享存储库，读写对象在共享存储库中进行数据交换，写对象被称为剪贴板的所有者，将数据存储在剪贴板的实例上。读对象则是访问剪贴板，将数据复制到其地址空间上
 剪贴板可以共有的也可私有的。每个剪贴板都必须有唯一的名称
 剪贴板可以保存一个或者多个实体，这些实体被称为剪贴板项目。每个项目可以有多个表达
 */

// 共享至公共的剪贴板
- (void)shareToPublicRTFData:(NSData *)rtfData text:(NSString *)text {
//    [[UIPasteboard generalPasteboard]setData:rtfData forPasteboardType:KUTTypeRTF]; // 设置类型为KUTTypeRTF二进制的类型
//    [[UIPasteboard generalPasteboard]setData:text forPasteboardType:KUTTypePlainText];
    [UIPasteboard generalPasteboard].string = text; // 可以为KUTTypePlainText类型纯字符串
}

// 假设数据类型事com.yourdomain.app.type
- (void)shareToPublicCustomData:(NSData *)data {
    [[UIPasteboard generalPasteboard]setData:data forPasteboardType:@"com.yourdomain.app.type"]; // 自定义的数据类型
}

// 共享到自定义的剪贴板
- (void)sharePrivatelyCustomData:(NSData *)data {
    UIPasteboard * appPasteboard = [UIPasteboard pasteboardWithName:@"myApp" create:YES]; // 获取给定名称的剪贴板，若不存在则要新建一个
    [appPasteboard setData:data forPasteboardType:@"com.yourdomain.app.type"]; // 设置自定义剪贴板的数据
}

// 从公共的剪贴板读取数据
- (NSArray *)readSharedStrings {
    return [UIPasteboard generalPasteboard].strings; // 检查存储在strings属性中的字符串数组
}

- (NSData *)readPrivateData {
    UIPasteboard * appPasteboard = [UIPasteboard pasteboardWithName:@"myApp" create:YES];
    return [appPasteboard dataForPasteboardType:@"com.yourdomain.app.type"]; // 在自定义剪贴板（非公开）中检索自定义类型的数据
}

@end
