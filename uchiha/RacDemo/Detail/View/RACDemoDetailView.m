//
//  RACDemoDetailView.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/11.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoDetailView.h"
#import "BasicControlsUtil.h"
#import "CommonMacro.h"
#import "UIView+SDAutoLayout.h"
@implementation RACDemoDetailView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initailize];
    }
    return self;
}
 
- (void)initailize {
    _title = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_title];
    _title.frame = CGRectMake(20, 40, 200, 34);
    
    _bookImageView = [BasicControlsUtil customImageView];
    [self addSubview:_bookImageView];
    _bookImageView.sd_layout.leftEqualToView(_title).topSpaceToView(_title, 10).widthIs(80).heightIs(80);
    
    
    _bookTitleLabel = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookTitleLabel];
    _bookTitleLabel.sd_layout.leftSpaceToView(_bookImageView, 10).topEqualToView(_bookImageView).rightSpaceToView(self, 20).heightIs(34);
    
    _bookAuthorLabel = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookAuthorLabel];
    _bookAuthorLabel.sd_layout.leftEqualToView(_bookTitleLabel).topSpaceToView(_bookTitleLabel, 10).rightEqualToView(_bookTitleLabel).heightIs(34);
    
    _bookPubdateLabel = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookPubdateLabel];
    _bookPubdateLabel.sd_layout.leftEqualToView(_bookTitleLabel).topSpaceToView(_bookAuthorLabel, 10).rightEqualToView(_bookTitleLabel).heightIs(34);
    
    _bookPublisherLabel = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookPublisherLabel];
    _bookPublisherLabel.sd_layout.leftEqualToView(_bookTitleLabel).topSpaceToView(_bookPubdateLabel, 10).rightEqualToView(_bookTitleLabel).heightIs(34);
    
    _bookPriceLabel = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookPriceLabel];
    _bookPriceLabel.sd_layout.leftEqualToView(_bookTitleLabel).topSpaceToView(_bookPublisherLabel, 10).rightEqualToView(_bookTitleLabel).heightIs(34);
    
    _bookPagesLabel = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookPagesLabel];
    _bookPagesLabel.sd_layout.leftEqualToView(_bookTitleLabel).topSpaceToView(_bookPriceLabel, 10).rightEqualToView(_bookTitleLabel).heightIs(34);
    
    _bookSummaryLabel = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookSummaryLabel];
    _bookSummaryLabel.sd_layout.leftEqualToView(_bookTitleLabel).topSpaceToView(_bookPagesLabel, 10).rightEqualToView(_bookTitleLabel).heightIs(34);
}
@end
