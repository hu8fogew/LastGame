//
//  GetMessageFromWXResp+ResponseWithTextOrMediaMessage.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WXApiObject.h"

@interface GetMessageFromWXResp (ResponseWithTextOrMediaMessage)


/**
 封装微信终端向第三方程序请求提供内容的消息结构体
 并给出要请求的消息类型：text or message；
 */
+ (GetMessageFromWXResp *)responseWithText:(NSString *)text
                            OrMediaMessage:(WXMediaMessage *)message
                                     bText:(BOOL)bText;

@end
