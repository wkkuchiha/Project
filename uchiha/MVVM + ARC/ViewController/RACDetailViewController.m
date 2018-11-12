//
//  RACDetailViewController.m
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "RACDetailViewController.h"
#import "RACDetailView.h"
#import <SDWebImage/UIView+WebCache.h>

@interface RACDetailViewController ()

@end

@implementation RACDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self bindViewModel];
}

- (instancetype)initWithViewModel:(RACDetailViewModel *)viewModel {
    if (self = [super init]) {
        _viewModel = viewModel;
    }
    return self;
}

- (void)bindViewModel {
    RACDetailView *view = [[RACDetailView alloc]initWithFrame:self.view.bounds];
    self.title = self.viewModel.title;
    self.bookTitleLabel.text = self.viewModel.bookTitle;
    self.bookAuthorLabel.text = self.viewModel.firstAuthor;
    self.bookPubdateLabel.text = self.viewModel.pubdate;
    self.bookPublisherLabel.text = self.viewModel.publisher;
    self.bookPriceLabel.text = self.viewModel.price;
    self.bookPagesLabel.text = self.viewModel.pages;
    self.bookSummaryLabel.text = self.viewModel.summary;
  //  [self.bookImageView sd_setImageWithURL:[NSURL URLWithString:self.viewModel.imageUrl]];
}

@end
