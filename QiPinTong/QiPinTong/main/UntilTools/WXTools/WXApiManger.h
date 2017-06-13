//
//  WXApiManger.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol WXApiManagerDelegate <NSObject>

@optional

/**
 收到微信终端的处理结果
 
 微信终端向第三方程序请求提供内容的消息结构体
 */
- (void)managerDidRecvGetMessageReq:(GetMessageFromWXReq *)request;

/**
 收到微信终端的处理结果
 
 微信通知第三方程序，要求第三方程序显示的消息结构体
 */
- (void)managerDidRecvShowMessageReq:(ShowMessageFromWXReq *)request;

/**
 收到微信终端的处理结果
 
 微信终端打开第三方程序携带的消息结构体
 */
- (void)managerDidRecvLaunchFromWXReq:(LaunchFromWXReq *)request;





/**
 来自微信的请求
 微信终端向第三方程序返回的SendMessageToWXReq处理结果
 */
- (void)managerDidRecvMessageResponse:(SendMessageToWXResp *)response;

/**
 来自微信的请求
 微信处理完第三方程序的认证和权限申请后向第三方程序回送的处理结果
 */

- (void)managerDidRecvAuthResponse:(SendAuthResp *)response;
/**
 来自微信的请求
 微信返回第三方添加卡券结果
 */

- (void)managerDidRecvAddCardResponse:(AddCardToWXCardPackageResp *)response;

/**
 来自微信的请求
 微信返回第三方请求选择卡券结果
 */

- (void)managerDidRecvChooseCardResponse:(WXChooseCardResp *)response;

/**
 来自微信的请求
 微信返回第三方请求选择发票结果
 */

- (void)managerDidRecvChooseInvoiceResponse:(WXChooseInvoiceResp *)response;



@end

@interface WXApiManger : NSObject <WXApiDelegate>


@property (nonatomic,assign) id <WXApiManagerDelegate> delegate;


/**
 
 WXApiManger 单例模式；
 */

+(instancetype)sharedManager;


@end
