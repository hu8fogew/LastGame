//
//  WXPayService.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/6/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WXPayService.h"

@interface WXPayService()
@property (nonatomic,copy) void(^RespCallBack)(BaseResp *);

@end

static WXPayService *sharedInstance;

@implementation WXPayService


+(instancetype)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [super allocWithZone:zone];
        
    });
    return sharedInstance;
}




///单例
+(instancetype)shareInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        
        sharedInstance = [[WXPayService alloc]init];
        
        
    });
    
    return sharedInstance;
    
}


///根据接口返回的预支付信息，构造支付请求
+(PayReq *)getPayRequest:(NSDictionary *)prepayData
{
    if (prepayData) {
        
        PayReq *req = [[PayReq alloc]init];
        req.partnerId = [prepayData valueForKey:@"partnerid"];//商家id
        req.prepayId = [prepayData valueForKey:@"prepayid"];
        
        req.nonceStr = [prepayData valueForKey:@"noncestr"];
        
        req.timeStamp = [[prepayData valueForKey:@"timestamp"] intValue];
        
        req.package = [prepayData valueForKey:@"package"];
        req.sign = [prepayData valueForKey:@"sign"];
        return req;
    }
    
    return nil;
    
}

///处理非支付请求回调；

-(void)onReqCallback:(void(^)(BaseResp *))callback
{
    self.RespCallBack = callback;
    
}

///服务器获取到微信返回的支付请求用到的参数来发起支付请求
-(void)startPayWithReq:(PayReq *)req callback:(void (^)(BaseResp *))callback
{
    NSAssert(req !=nil, @"未成功创建微信支付请求");
    self.RespCallBack = callback;
    if ([WXApi isWXAppInstalled]) {//判断是否安装的微信
        //发起微信支付
        [WXApi sendReq:req];
    }else
    {
        self.RespCallBack(nil);
    }
    
}


#pragma mark WXApiDelegate
- (void)onResp:(BaseResp *)resp {
    if ([resp isKindOfClass:[PayResp class]]) { // -- 判断是否为支付的回调
        self.RespCallBack(resp);
    }
}




@end
