//
//  WXMediaMessage+MessageConstruct.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WXApiObject.h"

@interface WXMediaMessage (MessageConstruct)

/**
 封装的多媒体消息结构体
 标题（title）、描述内容（description）、
 数据对象（media Object）、缩略图数据（messageExt、action、tagName）
 设置缩略图（thumbImage）
 
 */
+ (WXMediaMessage *)messageWithTitle:(NSString *)title Description:(NSString *)description Object:(id)mediaObject MessageExt:(NSString *)messageExt MessageAction:(NSString *)action ThumbImage:(UIImage *)thumbImage MediaTag:(NSString *)tagName;

@end
