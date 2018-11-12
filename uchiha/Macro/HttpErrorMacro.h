//
//  HttpErrorMacro.h
//  uchiha
//
//  Created by uchiha on 2017/8/11.
//  Copyright © 2017年 creditease. All rights reserved.
//

#ifndef HttpErrorMacro_h
#define HttpErrorMacro_h


#define CODE_NO_NETWORK 0x0001
#define CODE_CAN_NOT_CONNECT 0x0002
#define CODE_PARSH_FAILED 0x0003
#define CODE_CAN_NOT_FOUND_RESPONSE 0x0004
#define CODE_NO_RESULT 0x0005

#define MSG_NO_NETWORK @"无有效的网络连接,请检查网络是否开启"
#define MSG_CAN_NOT_CONNECT @"连接超时，请检查网络或稍后重试"
#define MSG_PARSH_FILED @"解析数据失败"
#define MSG_CAN_NOT_FOUND_RESPONSE @"获取数据失败"
#endif
