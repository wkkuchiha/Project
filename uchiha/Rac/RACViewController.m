//
//  RACViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/7/22.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACViewController.h"
#import "RacPrimaryController.h"
#import "RacAdvanceController.h"
@interface RACViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tbView;
@end

@implementation RACViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
}

- (void)setupView {
    _tbView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    [self.view addSubview:_tbView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"rac初级用法";
    }
    if (indexPath.row == 1) {
        cell.textLabel.text = @"rac高级用法";
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        RacPrimaryController * ctrl = [RacPrimaryController new];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    if (indexPath.row == 1) {
        RacAdvanceController * ctrl = [RacAdvanceController new];
        [self.navigationController pushViewController:ctrl animated:YES];
    }
}
@end
