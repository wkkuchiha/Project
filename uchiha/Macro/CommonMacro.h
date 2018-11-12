//
//  CommonMacro.h
//  uchiha
//
//  Created by uchiha on 2017/8/11.
//  Copyright © 2017年 creditease. All rights reserved.
//

#ifndef CommonMacro_h
#define CommonMacro_h

typedef NS_ENUM(NSUInteger,BusinessType) {
    BUSINESS_MUSIC_PLAYER = 0,
};

const static CGFloat iPhone5Width = 320;
const static CGFloat iPhone6Width = 375;
const static CGFloat iPhone6PlusWidth = 414;

//时间格式化
#define DATEFORMAT_YYYY_MM_DD @"yyyy-MM-dd"
#define DATEFORMAT_YMD_CHINESE @"yyyy年MM月dd日"
#define DATEFORMAT_YM_CHINESE @"yyyy年MM月"
#define DATEFORMAT_YMD_HMS @"yyyy-MM-dd HH:mm:ss"
#define DATEFORMAT_YMD_HM @"yyyy-MM-dd HH:mm"
#define DATEFORMAT_YMD_H @"yyyy-MM-dd HH"
#define DATEFORMAT_YMD_M_H @"yyyy-MM-dd"
#define DATEFORMAT_MD @"MM-dd"
#define DATEFORMAT_MD_CHINESE @"MM月dd日"
#define DATEFORMAT_MD_CHINESE_YMD @"yyyy年MM月dd日 HH:mm"

#define DATEFORMAT_MD_HM_CHINESE @"MM月dd日 HH:mm"
#define DATEFORMAT_MD_HM @"MM-dd HH:mm"
#define DATEFORMAT_HM @"HH:mm"
#define DATEFORMAT_HM_CHINESE @"HH小时mm分"
#define DATEFORMAT_MD_WEEK @"MM月dd日 EEEE"
#define DATEFORMAT_MD_WEEK_SHORT @"M月d日 EEEE"
#define DATEFORMAT_YYYY_MM @"yyyy-MM"
#define DATEFORMAT_YMD_HMS_ZZZ @"yyyy-MM-dd'T'HHmmssZZZ"
#define DATEFORMAT_MD_TODAY_CHINESE @"M月d日 今天"
#define DATEFORMAT_MMDD_TODAY_CHINESE @"MM月dd日 今天"
#define DATEFORMAT_MMDD_YESTERDAY_CHINESE @"MM月dd日 昨天"
#define DATEFORMAT_MMDD_TOMORROW_CHINESE @"MM月dd日 明天"
#define DATEFORMAT_MD_CHECK_IN @"MM月dd日入住"
#define DATEFORMAT_MD_CHECK_OUT @"MM月dd日退房"

#define REALM_DB_VERSION 10


#define KPushMsgRecvied @"RecviedPushMsg"


#define KEY_ENCRYPT @"12345678901234567890123456789012"


#define MiuTripProductUrl   @"https://api.miutrip.com/api"
#define MiuTripFortressUrl  @"http://120.26.238.147/api"
#define MiuTripTestUrl      @"http://192.168.0.1013/api"

//接口请求成功代码
#define CODE_REQUEST_SUCCEED 666666

//推送
#define PUSH_TYPE_KEY @"action"
#define PUSH_INFO_ID @"infoId"

#define defaultAlertBtns @[ @"取消", @"确定" ]

#define maxCellContentHeight appFrame.size.height - 20
//少状态栏的20
#define appFrame [[UIScreen mainScreen] applicationFrame]

#define cVIBE_OTA_ID 13

#define COLOR_BLUE_HOME_TILE_BUTTON UIColorFromRGB(0x0672E9)
#define COLOR_ORANGE_HOME_TILE_BUTTON UIColorFromRGB(0xFE8108)
#define COLOR_GREEN_HOME_TILE_BUTTON UIColorFromRGB(0x387502)
#define COLOR_RED_HOME_TILE_BUTTON UIColorFromRGB(0xF73f3f)

#define deviceVersion [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS_7 (deviceVersion >= 7.0)
#define DeviceUUID [[UIDevice currentDevice].identifierForVendor UUIDString]


#define imageNameAndType(name, type) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:name ofType:type]]
//自定义的Log
#ifdef DEBUG
#define LRLog(...) NSLog(@"%s 第%d行 \n %@\n\n",__func__,__LINE__,[NSString stringWithFormat:__VA_ARGS__])
#else
#define LRLog(...)
#endif

//获取某控件最大值
#define UIControlXLength(control) CGRectGetMaxX(control.frame)
#define UIControlYLength(control) CGRectGetMaxY(control.frame)

//获取屏幕的宽度与高度
#define MiddleViewHeight (appFrame.size.width - 20) * 0.3 - 20
#define SCREEN_WIDTH   [UIScreen mainScreen].bounds.size.width
#define SCREENH_HEIGHT [UIScreen mainScreen].bounds.size.height
#define kDegreesToRadian(x) (M_PI * (x) / 180.0)

#define UIViewOriginX(control) (control.frame.origin.x)
#define UIViewOriginY(control) (control.frame.origin.y)

#define UIViewWidth(view) CGRectGetWidth(view.frame)
#define UIViewHeight(view) CGRectGetHeight(view.frame)

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 \
green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0    \
blue:((float)(rgbValue & 0xFF)) / 255.0             \
alpha:1.0]

#define PriceColor UIColorFromRGB(0xee7600)

#define VIPONEColor UIColorFromRGB(0xe0a71c)

#define HeaderFooterViewColor UIColorFromRGB(0xEFEFF4)

#define taxiColor UIColorFromRGB(0xD50000)
#define hotelColor UIColorFromRGB(0xFFAB00)

#define flightColor UIColorFromRGB(0x0091EA)
#define TrainColor UIColorFromRGB(0x388E3C)

#define taxiLightColor UIColorFromRGB(0xFFEB3B)
#define taxiNormalColor UIColorFromRGB(0xFFCC00)
#define taxiDarkColor UIColorFromRGB(0xF57F17)

#define hotelLightColor UIColorFromRGB(0xFF9800)
#define hotelNormalColor UIColorFromRGB(0xFF9500)
#define hotelDarkColor UIColorFromRGB(0xEF6C00)

#define trainLightColor UIColorFromRGB(0x66BB6A)
#define trainNormalColor UIColorFromRGB(0x4CAF50)


#define parkNormalColor UIColorFromRGB(0x009688)
#define parkLightColor  UIColorFromRGB(0x16dad5)

#define alphaDarkColor [UIColor colorWithRed:0.0 / 255.0 green:0.0 / 255.0 blue:0.0 / 255.0 alpha:0.87]
#define grayDarkColor [UIColor colorWithRed:0.0 / 255.0 green:0.0 / 255.0 blue:0.0 / 255.0 alpha:0.54]
#define lightGrayDarkColor [UIColor colorWithRed:0.0 / 255.0 green:0.0 / 255.0 blue:0.0 / 255.0 alpha:0.38]
#define lightDarkColor [UIColor colorWithRed:0.0 / 255.0 green:0.0 / 255.0 blue:0.0 / 255.0 alpha:0.12]

#define LineColor UIColorFromRGB(0xceced2)

#define LightGrayColor UIColorFromRGB(0xCCCCCC)
#define GrayColor UIColorFromRGB(0x999999)
#define DarkGrayColor UIColorFromRGB(0x666666)
#define LightBlackColor UIColorFromRGB(0x333333)

#define BlackColor UIColorFromRGB(0x000000)
#define WhiteColor UIColorFromRGB(0xffffff)
#define ClearColor [UIColor clearColor]


#define LightBlueColor2 [UIColor colorWithRed:0.0 green:122.0 / 255.0 blue:1.0 alpha:0.1]
#define LightBlueColor UIColorFromRGB(0x03A9F4)
#define BlueColor [UIColor colorWithRed:0.0 green:122.0 / 255.0 blue:1.0 alpha:1.0] //UIColorFromRGB(0x0091f6)
#define DarkBlueColor [UIColor colorWithRed:0.0 green:122.0 / 255.0 blue:1.0 alpha:1.0]

#define GreenColor [UIColor colorWithRed:65.0 / 255.0 green:205.0 / 255.0 blue:0.0 / 255.0 alpha:1]
#define OrangeColor [UIColor colorWithRed:255.0 / 255.0 green:160.0 / 255.0 blue:145.0 / 255.0 alpha:1]
#define LightOrangeColor [UIColor colorWithRed:255.0 / 255.0 green:105.0 / 255.0 blue:30.0 / 255.0 alpha:1]
#define TopBarColor UIColorFromRGB(0x0672e9)
#define YellowColor [UIColor colorWithRed:250.0 / 255.0 green:200.0 / 255.0 blue:0.0 / 255.0 alpha:1]
#define LightYellowColor [UIColor colorWithRed:253.0 / 255.0 green:243.0 / 255.0 blue:192 / 255.0 alpha:1]
#define RedColor UIColorFromRGB(0xF44336)
#define LightRedColor UIColorFromRGB(0xEF5350)
#define GrayBGColor UIColorFromRGB(0xEfEff4)

//#define BlueColor [UIColor colorWithRed:157.0 / 255.0 green:218.0 / 255.0 blue:167.0 / 255.0 alpha:1]  // 绿色
//最小字体，默认用在tabBar标题
#define ExtraSmallFont [UIFont systemFontOfSize:10.0f]

#define SmallFont [UIFont systemFontOfSize:12.0f]
#define BoldSmallFont [UIFont boldSystemFontOfSize:12]

#define AllOrderFont [UIFont systemFontOfSize:26.0f]
#define AllOrderBigFont [UIFont systemFontOfSize:28.0f]

#define MediumFont [UIFont systemFontOfSize:15.0f]
#define BoldMediumFont [UIFont boldSystemFontOfSize:15.0f]

#define BigFont [UIFont systemFontOfSize:17.0f]
#define BoldBigFont [UIFont boldSystemFontOfSize:17.0f]

#define BigTitleFont [UIFont boldSystemFontOfSize:20.0f]

#define TitleFont [UIFont boldSystemFontOfSize:17.0f]
//tabelViewCell副标题字体
#define CellSubTitleFont [UIFont systemFontOfSize:11.0f]
//tabelViewCell header和footer的字体大小
#define CellHeaderFooterFont [UIFont systemFontOfSize:13.0f]
//UIalertView 提示说明字体大小
#define AlertViewDetailFont [UIFont systemFontOfSize:13.0f]
//segment字体大小
#define SegmentFont [UIFont systemFontOfSize:13.0f]

#define PATH_Y_ADJUST (deviceVersion >= 7.0 ? 0.0 : 20.0)

#define LETTER_SOURCE @"A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z"

#define iphoneScreenWidth [UIScreen mainScreen].bounds.size.width
#define iphoneScreenHeight [UIScreen mainScreen].bounds.size.height

#define BaseURL @"http://www.goldenstock.cn/site_mobile/"

#define RequestURL @"http://www.goldenstock.cn/site_mobile/index?channel=2&tokenStr=(null)&deviceId=(null)&isIos=1&"

#endif

