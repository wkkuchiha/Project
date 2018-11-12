//
//  RACDetailViewController.h
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//


/**
 * 详情页面，主要演示如何夸页面传值
   注意命名规则，一个controller和其对应的viewmodel最好是controller和model的区别
 */
#import <UIKit/UIKit.h>
#import "RACDetailViewModel.h"
#import <SDWebImage/UIView+WebCache.h>
@interface RACDetailViewController : UIViewController

@property(nonatomic,strong)UILabel *bookTitleLabel;
@property(nonatomic,strong)UILabel *bookAuthorLabel;
@property(nonatomic,strong)UILabel *bookPubdateLabel;
@property(nonatomic,strong)UILabel *bookPublisherLabel;
@property(nonatomic,strong)UILabel *bookPriceLabel;
@property(nonatomic,strong)UILabel *bookPagesLabel;
@property(nonatomic,strong)UILabel *bookSummaryLabel;
@property(nonatomic,weak)UIImageView *bookImageView;


@property(nonatomic,strong)RACDetailViewModel *viewModel;
- (instancetype)initWithViewModel:(RACDetailViewModel *)viewModel;
@end
