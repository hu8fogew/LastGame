//
//  SendMessageToWXReq+RequestWithTextOrMediaMessage.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SendMessageToWXReq+RequestWithTextOrMediaMessage.h"

@implementation SendMessageToWXReq (RequestWithTextOrMediaMessage)


+(SendMessageToWXReq *)requestWithText:(NSString *)text OrMediaMessage:(WXMediaMessage *)message bText:(BOOL)bText InScene:(enum WXScene)scene
{
    //第三方向微信客服端请求消息
    SendMessageToWXReq *req = [[SendMessageToWXReq alloc]init];
    
    req.bText = bText;
    req.scene = scene;
    if (bText) {
        req.text = text;
    }else
    {
        req.message = message;
    }
    
    return req;

}




@end
