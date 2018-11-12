//
//  RACDetailView.h
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RACDetailView : UIView
@property(nonatomic,strong)UILabel *bookTitleLabel;
@property(nonatomic,strong)UILabel *bookAuthorLabel;
@property(nonatomic,strong)UILabel *bookPubdateLabel;
@property(nonatomic,strong)UILabel *bookPublisherLabel;
@property(nonatomic,strong)UILabel *bookPriceLabel;
@property(nonatomic,strong)UILabel *bookPagesLabel;
@property(nonatomic,strong)UILabel *bookSummaryLabel;
@property(nonatomic,strong)UIImageView *bookImageView;

- (instancetype)initWithFrame:(CGRect)frame;
@end
