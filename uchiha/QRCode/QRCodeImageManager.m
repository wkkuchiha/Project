//
//  QRCodeImageManager.m
//  uchiha
//
//  Created by uchiha on 2017/8/28.
//  Copyright © 2017年 creditease. All rights reserved.
//

#import "QRCodeImageManager.h"

@implementation QRCodeImageManager



/**
 * 图片压缩
 */
+ (UIImage *)compressImage:(UIImage *)sourceImage toSize:(CGFloat)size {
    CGFloat factor = 1.0f;
    NSData *data = UIImageJPEGRepresentation(sourceImage, factor);
    while (data.length/1024 > size) {
        factor -= 0.05;
        if (factor <= 0.0f) {
            break;
        }
        data = UIImageJPEGRepresentation(sourceImage, factor);
    }
    UIImage *image = [UIImage imageWithData:data scale:factor];
    return image;
}

+ (void)drawQRCode:(QRcode *)code context:(CGContextRef)ctx size:(CGFloat)size {
    unsigned char *data = 0;
    int width = 0;
    data = code->data;
    width = code->width;
    float zoomker = (double)size/(width + 6);
    CGRect rectDraw = CGRectMake(0, 0, zoomker, zoomker);
    CGContextSetFillColor(ctx, CGColorGetComponents([UIColor grayColor].CGColor));
    for (int i = 0; i < width; ++i) {
        for (int j = 0; j < width; ++j) {
            if (*data & 1) {
                rectDraw.origin = CGPointMake((j+3)*zoomker, (i+3)* zoomker);
                CGContextAddRect(ctx, rectDraw);
            }
            ++data;
        }
    }
    CGContextFillPath(ctx);
}


+ (UIImage *)qrImageForString:(NSString *)aString imageSize:(CGFloat)aSize
{
    if (![aString length])
    {
        return nil;
    }
    
    QRcode *code = QRcode_encodeString([aString UTF8String], 0, QR_ECLEVEL_L, QR_MODE_8, 1);
    if (!code) {
        return nil;
    }
    
    // create context
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGContextRef ctx = CGBitmapContextCreate(0, aSize, aSize, 8, aSize * 4, colorSpace, kCGBitmapByteOrderDefault | kCGImageAlphaPremultipliedLast);
    
    CGAffineTransform translateTransform = CGAffineTransformMakeTranslation(0, -aSize);
    CGAffineTransform scaleTransform = CGAffineTransformMakeScale(1, -1);
    CGContextConcatCTM(ctx, CGAffineTransformConcat(translateTransform, scaleTransform));
    
    // draw QR on this context
    [[self class] drawQRCode:code context:ctx size:aSize];
    
    // get image
    CGImageRef qrCGImage = CGBitmapContextCreateImage(ctx);
    UIImage *qrImage = [UIImage imageWithCGImage:qrCGImage];
    
    // some releases
    CGContextRelease(ctx);
    CGImageRelease(qrCGImage);
    CGColorSpaceRelease(colorSpace);
    QRcode_free(code);
    
    return qrImage;
}

@end
