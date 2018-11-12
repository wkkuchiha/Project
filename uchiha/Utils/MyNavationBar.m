
//
//  MyNavationBar.m
//  uchiha
//
//  Created by uchiha on 2017/9/22.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "MyNavationBar.h"

@implementation MyNavationBar
- (void)setFrameWithNavigationBar:(int)num {
    
    CGFloat width = iphoneScreenWidth / num;
    CGFloat unitWidth=width/10;
    for (int i = 0; i < num; i++) {
        MyNavigationItem *item = [[MyNavigationItem alloc]init];
        CGFloat itemWidth = 8 * unitWidth;
        self.backgroundColor = [UIColor colorWithRed:211/255.0f green:177/255.0f blue:103/255.0f alpha:1.0f];
        item.frame = CGRectMake(unitWidth + width * i, 0, itemWidth, 64);
        if (i == 1) {
            [self performSelector:@selector(navigationBarItemAction:) withObject:item];
        }
        item.tag = 100 + i;
        [item addTarget:self action:@selector(navigationBarItemAction:) forControlEvents:UIControlEventTouchDown];
        [self addSubview:item];
    }
}

- (void)addNavitionBarItemTiTle:(NSString *)title normalImage:(UIImage *)normalImage atIndex:(int)index {
    MyNavigationItem *item = [self subviews][index - 1];
    //正常状态照片
    
    [item setImage:normalImage forState:UIControlStateNormal];
    //高亮状态下的文字和文字效果
    [item setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [item setTitle:title forState:UIControlStateSelected];
    //正常状态下的文字
    [item setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateNormal];
}

- (void)navigationBarItemAction:(MyNavigationItem *)item {
    if (_item == item) {
        return;
    }
    _item.selected = NO;
    item.selected = YES;
    if (self.delegate) {
        [self.delegate myNavigationBarDidClickFromIndex:_item.tag - 101 toIndex:item.tag - 101];
    }
    _item = item;
}
@end
