//
//  DataSharingViewController.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/14.
//  Copyright © 2018年 creditease. All rights reserved.
//

/**
 数据共享
 1，深层链接
 2，剪贴板
 
 剪贴板和深层链接相比具有以下优势：
 他具有支持发砸数据的能力
 他支持在多种形式中表示数据，这些形式可以基于目标应用的功能来选择
 即使应用关闭了，剪贴板的内容依然会保留
 */


/**
 共享钥匙串
 共享钥匙串是应用之间安全共享数据的一个选择。只有属于相同群组id，且使用相同证书签名的应用才可以共享数据
 在应用中实现单点登录的唯一方法就是使用共享钥匙串
 在实现在同一个发布者（相同的证书签名）的应用之间共享数据，这事唯一的方式，不需要从用户正在使用的应用调用其他的应用
 数据是加密的，所以他因该是存储安全信息的地方，如凭证，信用卡卡号。避免大量通用，非安全数据中刷新，因为这样的访问会比未加密的数据访问慢
 */
#import "BaseUIViewController.h"

@interface DataSharingViewController : BaseUIViewController

@end
