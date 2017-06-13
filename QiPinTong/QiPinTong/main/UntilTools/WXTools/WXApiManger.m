//
//  WXApiManger.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WXApiManger.h"


@implementation WXApiManger

#pragma mark ---单例模式WXApiManager

+(instancetype)sharedManager
{
    static WXApiManger *manager;
    //多线程单例
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WXApiManger alloc]init];
        
    });
    return manager;
}


#pragma mark ----------WXApimanagerDelegate

//来自微信的请求

-(void)onResp:(BaseResp *)resp
{
    if ([resp isKindOfClass:[SendMessageToWXResp class]]) {
        //SendMessageToWXResp
        if (_delegate && [_delegate respondsToSelector:@selector(managerDidRecvMessageResponse:)]) {
            
            SendMessageToWXResp *messageResp = (SendMessageToWXResp *)resp;
            [_delegate managerDidRecvMessageResponse:messageResp];
            
        }
        
    } else if ([resp isKindOfClass:[SendAuthResp class]]) {
        if (_delegate //SendAuthResp
            && [_delegate respondsToSelector:@selector(managerDidRecvAuthResponse:)]) {
            SendAuthResp *authResp = (SendAuthResp *)resp;
            [_delegate managerDidRecvAuthResponse:authResp];
        }
    } else if ([resp isKindOfClass:[AddCardToWXCardPackageResp class]]) {
        if (_delegate //AddCardToWXCardPackageResp
            && [_delegate respondsToSelector:@selector(managerDidRecvAddCardResponse:)]) {
            AddCardToWXCardPackageResp *addCardResp = (AddCardToWXCardPackageResp *)resp;
            [_delegate managerDidRecvAddCardResponse:addCardResp];
        }
    } else if ([resp isKindOfClass:[WXChooseCardResp class]]) {
        if (_delegate //WXChooseCardResp
            && [_delegate respondsToSelector:@selector(managerDidRecvChooseCardResponse:)]) {
            WXChooseCardResp *chooseCardResp = (WXChooseCardResp *)resp;
            [_delegate managerDidRecvChooseCardResponse:chooseCardResp];
        }
    }else if ([resp isKindOfClass:[WXChooseInvoiceResp class]]){
        if (_delegate //WXChooseInvoiceResp
            && [_delegate respondsToSelector:@selector(managerDidRecvChooseInvoiceResponse:)]) {
            WXChooseInvoiceResp *chooseInvoiceResp = (WXChooseInvoiceResp *)resp;
            [_delegate managerDidRecvChooseInvoiceResponse:chooseInvoiceResp];
        }
        
    }
    
}

//收到微信的处理结果
-(void)onReq:(BaseReq *)req
{
    
    
    if ([req isKindOfClass:[GetMessageFromWXReq class]]) {
        if (_delegate //GetMessageFromWXReq
            && [_delegate respondsToSelector:@selector(managerDidRecvGetMessageReq:)]) {
            GetMessageFromWXReq *getMessageReq = (GetMessageFromWXReq *)req;
            [_delegate managerDidRecvGetMessageReq:getMessageReq];
        }
    } else if ([req isKindOfClass:[ShowMessageFromWXReq class]]) {
        if (_delegate  //ShowMessageFromWXReq
            && [_delegate respondsToSelector:@selector(managerDidRecvShowMessageReq:)]) {
            ShowMessageFromWXReq *showMessageReq = (ShowMessageFromWXReq *)req;
            [_delegate managerDidRecvShowMessageReq:showMessageReq];
        }
    } else if ([req isKindOfClass:[LaunchFromWXReq class]]) {
        if (_delegate  //LaunchFromWXReq
            && [_delegate respondsToSelector:@selector(managerDidRecvLaunchFromWXReq:)]) {
            LaunchFromWXReq *launchReq = (LaunchFromWXReq *)req;
            [_delegate managerDidRecvLaunchFromWXReq:launchReq];
        }
    }
    
    
    
}





@end
