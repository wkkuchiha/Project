
//
//  RACDemoSearchTbViewCell.m
//  uchiha
//
//  Created by 王鹏 on 2018/10/12.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import "RACDemoSearchTbViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "RACDemoBookModel.h"
#import "SDAutoLayout.h"
#import "BasicControlsUtil.h"
#import "CommonMacro.h"

@interface RACDemoSearchTbViewCell()
@property(nonatomic,strong)UIImageView *bookImgView;
@property(nonatomic,strong)UILabel *bookTitle;
@property(nonatomic,strong)UILabel *bookAuthor;
@property(nonatomic,strong)UILabel *bookPublisher;
@end

@implementation RACDemoSearchTbViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self initalize];
    }
    return self;
}

- (void)initalize {
    _bookImgView = [BasicControlsUtil customImageView];
    [self addSubview:_bookImgView];
    _bookImgView.sd_layout.leftSpaceToView(self, 20).topSpaceToView(self, 20).bottomSpaceToView(self, 20).widthIs(80);
    
    _bookTitle = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookTitle];
    _bookTitle.sd_layout.leftSpaceToView(_bookImgView, 10).topEqualToView(_bookImgView).rightSpaceToView(self, 20).heightIs(34);
    
    _bookAuthor = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookAuthor];
    _bookAuthor.sd_layout.leftSpaceToView(_bookImgView, 10).topSpaceToView(_bookTitle, 10).rightSpaceToView(self, 20).heightIs(34);
    
    _bookPublisher = [BasicControlsUtil customLabelTextAlignment:NSTextAlignmentLeft backGroundColor:nil tintColor:nil textFont:MediumFont];
    [self addSubview:_bookPublisher];
    _bookPublisher.sd_layout.leftSpaceToView(_bookImgView, 10).topSpaceToView(_bookAuthor, 10).rightSpaceToView(self, 20).heightIs(34);
}

/**
 注意，这里传入进来的并不是viewmodel，仅仅只是model，只是简单展示，没有复杂逻辑，所以不再引入viewmodel
*/
- (void)bindViewModel:(id)viewModel {
    RACDemoBookModelDetail *bookModel = viewModel;
    _bookTitle.text =  bookModel.title;
    _bookAuthor.text = [bookModel.author firstObject];
    _bookPublisher.text = bookModel.publisher;
    [_bookImgView sd_setImageWithURL:[NSURL URLWithString:bookModel.image]];
}
@end
