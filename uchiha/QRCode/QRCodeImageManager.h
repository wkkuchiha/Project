//
//  QRCodeImageManager.h
//  uchiha
//
//  Created by uchiha on 2017/8/28.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "qrencode.h"
@interface QRCodeImageManager : NSObject

/**
 * 图片保存
 */
+ (void)saveImageToPhotosAlbum:(UIImage *)image;
/**
 * 图片压缩
 */
+ (UIImage *)compressImage:(UIImage *)sourceImage toSize:(CGFloat)size;

+ (void)drawQRCode:(QRcode *)code context:(CGContextRef)ctx size:(CGFloat)size;

/**
 * 生成二维码
 */
+ (UIImage *)qrImageForString:(NSString *)aString imageSize:(CGFloat)aSize;
@end
