//
//  RACDemoDetailViewController.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/10.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoDetailViewController.h"
#import "RACDemoDetailView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RACDemoDetailViewModel.h"
@interface RACDemoDetailViewController ()
@property(nonatomic,strong)RACDemoDetailView * detailView;
@property(nonatomic,strong)RACDemoDetailViewModel *detailModel;
@end

@implementation RACDemoDetailViewController

- (instancetype)initViewModel:(id)viewModel {
    if (self = [super init]) {
        _detailView = viewModel;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _detailView = [[RACDemoDetailView alloc]initWithFrame:self.view.bounds];
    [self bindModel];
}

- (void)bindModel {
    _detailView.title.text = _detailModel.title;
    _detailView.bookTitleLabel.text = _detailModel.bookTitle;
    _detailView.bookAuthorLabel.text = _detailModel.firstAuthor;
    _detailView.bookPubdateLabel.text = _detailModel.pubdate;
    _detailView.bookPublisherLabel.text = _detailModel.publisher;
    _detailView.bookPriceLabel.text = _detailModel.price;
    _detailView.bookPagesLabel.text = _detailModel.pages;
    _detailView.bookSummaryLabel.text = _detailModel.summary;
    [_detailView.bookImageView sd_setImageWithURL:[NSURL URLWithString:_detailModel.imageUrl]];
}
@end
