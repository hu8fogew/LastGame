//
//  WXPayService.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/6/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//微信支付封装

#import <Foundation/Foundation.h>


@interface WXPayService : NSObject<WXApiDelegate>


/**
 单例来接收微信请求的回调；
 */
+(instancetype)shareInstance;


/**根据借口返回的预支付信息，构造支付请求*/

+(PayReq *)getPayRequest:(NSDictionary *)prepayData;



/**处理非支付请求的回调*/
-(void)onRespCallBack:(void(^)(BaseResp *resp))callback;


/**从服务器端获取到微信返回的支付请求用到的参数来发起支付请求*/
-(void) startPayWithReq:(PayReq *)req callback:(void(^)(BaseResp *resp))callback;


@end
