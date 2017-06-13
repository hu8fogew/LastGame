//
//  SendMessageToWXReq+RequestWithTextOrMediaMessage.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WXApiObject.h"

@interface SendMessageToWXReq (RequestWithTextOrMediaMessage)


/**
 封装第三方程序发送消息至微信终端程序的消息结构体
 并指出要发送的消息类型 text or message
 以及发送场景：（WXScene：聊天、收藏、朋友圈）
 */
+(SendMessageToWXReq *)requestWithText:(NSString *)text OrMediaMessage:(WXMediaMessage *)message bText:(BOOL)bText InScene:(enum WXScene)scene;

@end
