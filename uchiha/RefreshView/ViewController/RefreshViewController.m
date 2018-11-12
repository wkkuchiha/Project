//
//  RefreshViewController.m
//  uchiha
//
//  Created by uchiha on 2017/8/18.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "RefreshViewController.h"
#import "DxRefreshView.h"
#import "UIScrollView+Refresh.h"

@interface RefreshViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(strong)UITableView *tbView;
@property(copy)NSMutableArray *dataSource;
@end

@implementation RefreshViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"模仿锤子手机下拉刷新";
    [self setInitView];
}

- (void)setInitView {
    _tbView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    [self.view addSubview:_tbView];
    
    DxRefreshView *refreshView = [[DxRefreshView alloc]init];
    refreshView.color = [UIColor grayColor];
    refreshView.actionHandler = ^{
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2*NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            [_dataSource addObject:[NSString stringWithFormat:@"%d",(int)_dataSource.count + 1]];
            [_tbView reloadData];
            [_tbView.refreshHeader endRefreshing];
        });
    };
    _tbView.refreshHeader = refreshView;
    [_tbView.refreshHeader beginRefreshing];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellSign = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellSign];
    if (cell == NULL) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellSign];
    }
    cell.textLabel.text = [_dataSource objectAtIndex:indexPath.row];
    return cell;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [_tbView removeScrollObserver];
}
@end

