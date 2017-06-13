//
//  GetMessageFromWXResp+ResponseWithTextOrMediaMessage.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "GetMessageFromWXResp+ResponseWithTextOrMediaMessage.h"

@implementation GetMessageFromWXResp (ResponseWithTextOrMediaMessage)


+ (GetMessageFromWXResp *)responseWithText:(NSString *)text
                            OrMediaMessage:(WXMediaMessage *)message
                                     bText:(BOOL)bText
{
    //微信终端向第三方程序请求提供内容的消息结构体。
    GetMessageFromWXResp *resp = [[GetMessageFromWXResp alloc]init];
    
    //消息类型选择（text or message）
    resp.bText = bText;
    
    if (bText) {
        resp.text = text;
    }else
    {
        resp.message = message;
    }
    
    return resp;
}


@end
