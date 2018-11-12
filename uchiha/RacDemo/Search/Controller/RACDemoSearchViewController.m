//
//  RACDemoSearchViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoSearchViewController.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RACDemoTableViewBindingHelper.h"
#import "RACDemoSearchTbViewCell.h"
#import "SDAutoLayout.h"
#import "BasicControlsUtil.h"
#import "CommonMacro.h"
#import "RACDemoNavigationProtocol.h"
@interface RACDemoSearchViewController ()<UITextFieldDelegate>
@property(nonatomic,strong)RACDemoTableViewBindingHelper *bindingHelper;
@property(nonatomic,strong)UITableView *tbView;
@property(nonatomic,strong)UITextField *serachTextField;
@property(nonatomic,strong)UIButton *searchBtn;
@property(nonatomic,strong)RACDemoSearchViewModel *viewModel;

@end

@implementation RACDemoSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupView];
    [self bindViewModel];
}

- (void)setupView {
    _serachTextField = [BasicControlsUtil customTextField:nil titleFont:MediumFont];
    [self.view addSubview:_serachTextField];
    _serachTextField.delegate = self;
    _serachTextField.sd_layout.leftSpaceToView(self.view, 20).topSpaceToView(self.view, 20).rightSpaceToView(self.view, 100).heightIs(44);
    
    _searchBtn = [BasicControlsUtil customBtnTextColor:nil backGroundColor:nil titleFont:MediumFont image:nil];
    [self.view addSubview:_searchBtn];
    _searchBtn.sd_layout.topEqualToView(_serachTextField).leftSpaceToView(_serachTextField, 10).widthIs(80).heightIs(44);
    
    _tbView = [[UITableView alloc]initWithFrame:CGRectMake(20, 50, SCREEN_WIDTH - 40, SCREENH_HEIGHT - 44) style:UITableViewStylePlain];
    [self.view addSubview:_tbView];
}

- (instancetype)initWithViewModel:(RACDemoSearchViewModel *)viewModel {
    if (self = [super init]) {
        _viewModel = viewModel;
    }
    return self;
}
/**
 因为本类是模块的入口controller，所以要在外部创建viewmodel，以后创建的子级controller的viewmodel都有上一级的viewmodel创建
 */
- (void)bindViewModel {
    if (!_viewModel) {
        
        RACDemoNavigationImpl * protocol = [[RACDemoNavigationImpl alloc] initWithRACDemoNavigation:self.navigationController];
        _viewModel = [[RACDemoSearchViewModel alloc]initWithNaviImpl:protocol];
    }
    self.title = self.viewModel.title;
    @weakify(self);
    RAC(self.viewModel,searchText) = self.serachTextField.rac_textSignal;
    self.searchBtn.rac_command = self.searchBtn.rac_command;
    RAC([UIApplication sharedApplication],networkActivityIndicatorVisible) = self.viewModel.executeSearch.executing;
    self.bindingHelper = [RACDemoTableViewBindingHelper bindingViewModel:_tbView sourceSignal:RACObserve(self.viewModel, searchResults) selectionCommand:self.viewModel.executeSelection];
    [self.viewModel.executeSearch.executionSignals subscribeNext:^(id x) {
        @strongify(self);
        [self.serachTextField resignFirstResponder];
    }];
    [self.viewModel.connectionErrors  subscribeNext:^(id x) {
        NSLog(@"错误信息 --- %@",x);
    }];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

@end
