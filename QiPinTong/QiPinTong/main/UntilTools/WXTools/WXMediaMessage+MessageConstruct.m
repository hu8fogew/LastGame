//
//  WXMediaMessage+MessageConstruct.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WXMediaMessage+MessageConstruct.h"

@implementation WXMediaMessage (MessageConstruct)


+(WXMediaMessage *)messageWithTitle:(NSString *)title Description:(NSString *)description Object:(id)mediaObject MessageExt:(NSString *)messageExt MessageAction:(NSString *)action ThumbImage:(UIImage *)thumbImage MediaTag:(NSString *)tagName
{
    //多媒体消息结构体
    WXMediaMessage *message = [[WXMediaMessage alloc]init];
    //标题
    message.title = title;
    //描述内容
    message.description = description;
    //多媒体数据对象，
    message.mediaObject = mediaObject;
    //缩略图数据
    message.messageExt = messageExt;
    
    message.messageAction = action;
    
    message.mediaTagName = tagName;
    //设置消息缩略图
    [message setThumbImage:thumbImage];
    
    return message;
    
    
}


@end
