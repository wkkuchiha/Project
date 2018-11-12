//
//  NewFourDetatilViewController.h
//  uchiha
//
//  Created by uchiha on 2017/8/11.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PJAPPExport.h"
#import "FourViewController.h"
typedef void(^callBackFunc)(NSString *func);
@interface NewFourDetatilViewController : FourViewController<UIWebViewDelegate,PJAPPExport>
@property(copy)NSString *requestUrl;

@property(copy)callBackFunc backFunc;
@end






