//
//  MultiscreenViewController.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/12.
//  Copyright © 2018年 creditease. All rights reserved.
//

/**
 多屏幕
 场景如下：
 1，在启动期间检测屏幕的数量。若果屏幕数量大于1，则进行切换
 2，监听屏幕在连接和断开时候的通知。
    若果有新的屏幕介入进来，则进行切换
    如果所有的外部屏幕都都被移除，则恢复到默认屏幕显示
 */
#import <UIKit/UIKit.h>

@interface MultiscreenViewController : UIViewController

@end
