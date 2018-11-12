//
//  UserDetailViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/14.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "UserDetailViewController.h"
#import "MVCLoginViewController.h"

@interface UserDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UIButton *senderLogin;
@end

@implementation UserDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setupView];
}

- (void)setupView {
    // 启动界面
    _senderLogin = [UIButton buttonWithType:UIButtonTypeCustom];
    [_senderLogin setTitle:@"点击登录" forState:UIControlStateNormal];
    [_senderLogin setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.view addSubview:_senderLogin];
    _senderLogin.frame = CGRectMake(SCREEN_WIDTH/2 - 50, 200, 100, 44);
    [_senderLogin addTarget:self action:@selector(clickLoginBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickLoginBtn {
    NSInteger type = 1;
    switch (type) {
        case 1:{
            MVCLoginViewController * mvcLogin = [MVCLoginViewController new];
            [self.navigationController pushViewController:mvcLogin animated:YES];
        }
            break;
        case 2:{
        }
            break;
        case 3:{
            
        }
            break;
        case 4:{
            
        }
            break;
        default:
            break;
    }
}
@end
