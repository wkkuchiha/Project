#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "bitstream.h"
#import "config.h"
#import "mask.h"
#import "mmask.h"
#import "mqrspec.h"
#import "qrencode.h"
#import "qrinput.h"
#import "qrspec.h"
#import "rscode.h"
#import "split.h"

FOUNDATION_EXPORT double libqrencodeVersionNumber;
FOUNDATION_EXPORT const unsigned char libqrencodeVersionString[];

