//
//  RACSearchViewController.m
//  uchiha
//
//  Created by uchiha on 2017/9/1.
//  Copyright © 2017年 creditease. All rights reserved.
//

/**
 * 详情页
 */

#import "RACSearchViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACViewModelNavigationImpl.h"
#import "RACTableViewBindingHelper.h"
@interface RACSearchViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITextField *textField;
@property(nonatomic,strong)UITableView *tbView;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,copy)NSArray *dataArray;
@property(nonatomic,strong)RACTableViewBindingHelper *bindingHelper;
@end

@implementation RACSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"应该可以吧";
    [self initSubViews];
    [self bindViewModel];
}

- (void)initSubViews {
    _textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 74, iphoneScreenWidth - 100, 34)];
    [self.view addSubview:_textField];
    [_textField.rac_textSignal subscribeNext:^(id x) {
        NSLog(@"----------- textfield :%@",x);
    }];
    _textField.backgroundColor = [UIColor redColor];
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_btn];
    [_btn setBackgroundColor:[UIColor grayColor]];
    _btn.sd_layout.leftSpaceToView(_textField, 10).topEqualToView(_textField).widthIs(70).heightIs(34);
    [[_btn rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        NSLog(@"点击按钮");
    }];
    
    _tbView = [[UITableView alloc]initWithFrame:CGRectMake(10, 74 + 44, iphoneScreenWidth - 20, iphoneScreenHeight) style:UITableViewStylePlain];
    _tbView.delegate = self;
    _tbView.dataSource = self;
    [self.view addSubview:_tbView];
    
    [_tbView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CustomCell"];
    
    _dataArray = [NSArray arrayWithObjects:@"001",@"002",@"003",@"004",@"005",@"006", nil];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cell = @"CustomCell";
    UITableViewCell *mycell = [tableView dequeueReusableCellWithIdentifier:cell];
    if (mycell == nil) {
        mycell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell];
    }
    mycell.textLabel.text = @"uchiha";
    return mycell;
}

/**
 * 因为本类为一个模块入口controller，因此在内部创建一个viewmodel，以后进入子集的controller的viewmodel有上一级viewmodel创建
 */
- (void)bindViewModel {
    if (_viewModel) {
        RACViewModelNavigationImpl *impl = [[RACViewModelNavigationImpl alloc]initWithNavigationController:self.navigationController];
        _viewModel = [[RACSearchViewModel alloc]initWIthNavImpl:impl];
    }
    self.title = _viewModel.title;
    @weakify(self);
    RAC(_viewModel,searchText) = _textField.rac_textSignal;
    _btn.rac_command = _viewModel.executeSearch;
    RAC([UIApplication sharedApplication],networkActivityIndicatorVisible) = _viewModel.executeSearch.executing;
 //   _bindingHelper = [RACTableViewBindingHelper bindingHelperForTableView:_tbView sourceSignal:RACObserve(self.viewModel,searchResults) selectionCommand:_viewModel.executeSelection templateCell:nil];
    [_viewModel.executeSearch.executionSignals subscribeNext:^(id x) {
        @strongify(self);
        [_textField resignFirstResponder];
    }];
    
    [_viewModel.connectionErrors subscribeNext:^(id x) {
        NSLog(@"不会报错吧");
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
