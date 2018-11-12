//
//  PJAPPExport.h
//  PjApp
//
//  Created by xinghuo on 2017/4/21.
//  Copyright © 2017年 appress. All rights reserved.
//

#import <JavaScriptCore/JavaScriptCore.h>

@protocol PJAPPExport <JSExport>

JSExportAs(shareWith, -(void)shareWithTitle:(NSString *)title desc:(NSString *)desc icon:(NSString *)icon location:(NSString *)location type:(NSString *)type videoid:(NSString * )videoid memberid:(NSString * )memberid );
- (void)qqLogin;
- (void)wxLogin;
- (void)clearToken;
- (void)done;
- (void)openDetailVc:(NSString *)openUrl;
- (void)backToMain:(NSString *)fun;
- (void)endScroll;
- (void)startScroll;
- (void)refresh;
JSExportAs(showBigImages, - (void)showBigImagesStartIndex:(NSInteger)index imageArray:(NSArray*)images);
JSExportAs(setToken, -(void)setToken:(NSString *)token);
@end
