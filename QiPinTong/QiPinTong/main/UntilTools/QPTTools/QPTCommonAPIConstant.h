//
//  QPTCommonAPIConstant.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//



/*
 
 接口（不同频道参数）
 
 */


#import <Foundation/Foundation.h>

@interface QPTCommonAPIConstant : NSObject



#pragma mark ---HOME / 首页


/**
 首页
 */
UIKIT_EXTERN NSString *const QPTHomeSevericeAPI;

/**
 企聘通服务器的地址
 */
UIKIT_EXTERN NSString *const QPTSevericeHeaderAPI;


/*全职速聘*/
UIKIT_EXTERN NSString *const QPTQZSPSevericeAPI;

/*兼职达人*/
UIKIT_EXTERN NSArray *const QPTJZDRSevericeAPI;

/*校园365*/
UIKIT_EXTERN NSString *const QPTCompusSevericeAPI;

/*名气在线*/
UIKIT_EXTERN NSString *const QPTMQZXSevericeAPI;

/*有才有貌*/
UIKIT_EXTERN NSString *const QPTYCYMSevericeAPI;

/*创孵天下*/
UIKIT_EXTERN NSString *const QPTCFTXSevericeAPI;

/*有商有客*/
UIKIT_EXTERN NSString *const QPTYSYKSevericeAPI;

/*易通学院*/
UIKIT_EXTERN NSString *const QPTYTXYSevericeAPI;

/*朋友圈*/
UIKIT_EXTERN NSString *const QPTFriendSevericeAPI;

/**
 微信获取access_token
 */
UIKIT_EXTERN NSString *const QPTGETWX_access_tokenAPI;

/**
 微信获取用户信息接口
 */
UIKIT_EXTERN NSString *const QPTGETWX_PersonInformationAPI;

@end
