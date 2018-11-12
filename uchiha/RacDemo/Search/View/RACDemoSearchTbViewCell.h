//
//  RACDemoSearchTbViewCell.h
//  uchiha
//
//  Created by 王鹏 on 2018/10/12.
//  Copyright © 2018年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RACDemoBindViewModelProtocol.h"

// 搜索页面结果cell，只需要实现协议，无需绑定数据
@interface RACDemoSearchTbViewCell : UITableViewCell<RACDemoBindViewModelProtocol>
@end
