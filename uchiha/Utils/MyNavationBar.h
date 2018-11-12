//
//  MyNavationBar.h
//  uchiha
//
//  Created by uchiha on 2017/9/22.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNavigationItem.h"

@class MyNavigationItem;
@protocol MyNavationBarDelegate <NSObject>
- (void)myNavigationBarDidClickFromIndex:(NSInteger) fromIndex toIndex:(NSInteger) toIndex;
@end

@interface MyNavationBar : UIView<MyNavationBarDelegate>
@property(strong)MyNavigationItem *item;
@property(nonatomic,weak)id<MyNavationBarDelegate>delegate;
- (void)setFrameWithNavigationBar:(int)num;
-(void) addNavitionBarItemTiTle:(NSString *) title normalImage:(UIImage *) normalImage atIndex:(int) index;
@end
