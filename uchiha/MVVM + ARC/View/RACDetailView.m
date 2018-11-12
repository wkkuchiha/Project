//
//  RACDetailView.m
//  uchiha
//
//  Created by uchiha on 2017/9/4.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "RACDetailView.h"

@implementation RACDetailView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    
    _bookTitleLabel = [[UILabel alloc]init];
    [self addSubview:_bookTitleLabel];
    _bookTitleLabel.sd_layout.leftSpaceToView(self, 20).topSpaceToView(self,74 ).widthIs(84).heightIs(34);
    _bookTitleLabel.textColor = [UIColor redColor];
    
    _bookImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"ali_pay"]];
    [self addSubview:_bookImageView];
    _bookImageView.sd_layout.topSpaceToView(_bookTitleLabel, 20).topSpaceToView(_bookTitleLabel, 10).widthIs(80).heightIs(80);
    
    _bookAuthorLabel = [[UILabel alloc]init];
    [self addSubview:_bookAuthorLabel];
    _bookAuthorLabel.sd_layout.leftSpaceToView(_bookImageView, 20).topEqualToView(_bookImageView).widthIs(80).heightIs(34);
    
    _bookPublisherLabel = [[UILabel alloc]init];
    [self addSubview:_bookPublisherLabel];
    _bookPublisherLabel.sd_layout.topSpaceToView(_bookAuthorLabel,20).topSpaceToView(_bookAuthorLabel, 10).heightIs(34).widthIs(80);
    
    _bookPubdateLabel = [[UILabel alloc]init];
    [self addSubview:_bookPubdateLabel];
    _bookPubdateLabel.sd_layout.leftEqualToView(_bookPublisherLabel).topSpaceToView(_bookPublisherLabel, 10).widthIs(80).heightIs(34);
    
    _bookPriceLabel = [[UILabel alloc]init];
    [self addSubview:_bookPriceLabel];
    _bookPriceLabel.sd_layout.leftEqualToView(_bookPubdateLabel).topSpaceToView(_bookPubdateLabel, 10).widthIs(80).heightIs(34);
    
    _bookPagesLabel = [[UILabel alloc]init];
    [self addSubview:_bookPagesLabel];
    _bookPagesLabel.sd_layout.leftEqualToView(_bookPriceLabel).topSpaceToView(_bookPriceLabel, 10).widthIs(80).heightIs(34);
    
    _bookSummaryLabel = [[UILabel alloc]init];
    [self addSubview:_bookSummaryLabel];
    _bookSummaryLabel.sd_layout.leftSpaceToView(self, 20).rightSpaceToView(self, 20).topSpaceToView(_bookImageView, 10).heightIs(34);
}
@end
