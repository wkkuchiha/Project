//
//  BookInViewCell.m
//  uchiha
//
//  Created by uchiha on 2017/8/14.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "BookInViewCell.h"
#import "CommonMacro.h"
@implementation BookInViewCell
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupView];
    }
    return self;
}

- (void)setupView {
    _imgView = [[UIImageView alloc]init];
    [self.contentView addSubview:_imgView];
    _imgView.sd_layout.leftSpaceToView(self.contentView, 5).topSpaceToView(self.contentView, 5).rightSpaceToView(self.contentView, 5).bottomSpaceToView(self.contentView,25);
    _imgView.image = [UIImage imageNamed:@"logo_9c@2x"];

    _imgTitle = [[UILabel alloc]init];
    [self.contentView addSubview:_imgTitle];
    _imgTitle.sd_layout.centerXEqualToView(self.contentView).widthIs(90).topSpaceToView(_imgView, 3).bottomSpaceToView(self.contentView, 5);
    _imgTitle.font = [UIFont systemFontOfSize:12];
    _imgTitle.textAlignment = NSTextAlignmentCenter;
}


@end
