//
//  MultiscreenViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/12.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "MultiscreenViewController.h"
#import "NewScreenViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface MultiscreenViewController ()
@property(nonatomic,strong)UIWindow *secondWindow;
@end

@implementation MultiscreenViewController

/**
 viewDidLoad 这个方法在视图控制器整个生命周期中仅调用一次，所以他成了注册屏幕连接和断开的最佳位置
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    self.title = @"多屏幕";
    [self registerNotifications];
}

/**
 用户首次进入视图控制器时，UI会进行调整，查看可以哦那个的屏幕数量。类似的，如果用户离开这个控制器，转为进入其他的控制器，然后再返回，此时屏幕的数量可能已经发生了改变
 */
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self updateScreen];
}

/**
 当用户离开这个视图控制器的时，你可能也想在另外一个屏幕中更新UI。使用这个方法就能实现
 */
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self disconnectFromScreen];
}

- (void)registerNotifications {
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:UIScreenDidConnectNotification object:nil]subscribeNext:^(id x) {
        [self updateScreen];
    }];
   
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:UIScreenDidDisconnectNotification object:nil]subscribeNext:^(id x) {
        [self updateScreen];
    }];
}

- (void)disconnectFromScreen {
    if (self.secondWindow != nil) {
        // 断开连接，准备释放内存
        self.secondWindow.rootViewController = nil;
        self.secondWindow.hidden = YES;
        self.secondWindow = nil;
    }
}

- (void)updateScreen {
    NSArray *screens = [UIScreen screens];
    if (screens.count> 1) {
        UIScreen * secondScreen = (UIScreen *)[screens objectAtIndex:1];
        CGRect rect = secondScreen.bounds;
        if (self.secondWindow == nil) {
            self.secondWindow = [[UIWindow alloc]initWithFrame:rect];
            self.secondWindow.screen = secondScreen;
            
            // 另一个屏幕
            /**
             在实际的项目中，NewScreenViewController将有与用户交互以实现控制的UI组成。如电影播放器。你可能在不同的屏幕间切换控制器
             */
            NewScreenViewController * view = [NewScreenViewController new];
            // 设置view的其他属性，完整的对其初始化
            view.parent = self;
            self.secondWindow.rootViewController = view;
        }
        self.secondWindow.hidden = YES;
    } else {
        [self disconnectFromScreen];
    }
}
@end
