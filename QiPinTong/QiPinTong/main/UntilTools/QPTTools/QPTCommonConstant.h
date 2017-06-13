//
//  QPTCommonConstant.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//



//普通常用的公共常量

#import <Foundation/Foundation.h>

@interface QPTCommonConstant : NSObject


/**
   当前的纬度
 */
UIKIT_EXTERN NSString *const QPTUserCurrentLatitude;

/**
 当前的经度
 */

UIKIT_EXTERN NSString *const QPTUserCurrentLongitude;

/**
 是否登陆
 */
UIKIT_EXTERN NSString *const QPTHasLoginFlag;

/**
 企业 Or 个人  Or  商户
 */
UIKIT_EXTERN NSString *const QPTComOrPerOrBusinessIdentifier;


/**
 网络加载成功
 */
UIKIT_EXTERN NSString *const QPTRequestSuccessNotification;

/**
 WeChat_APISECRET
 */
UIKIT_EXTERN NSString *const QPTWXApiSecret;
/**
 WeChat_APPID
 */

UIKIT_EXTERN NSString *const QPTWXAppID;

/**
 WeChat_scope(微信授权域)
 */
UIKIT_EXTERN NSString *const QPTWXScope;

/**
 第三方平台的appkey （微信）
 */
UIKIT_EXTERN NSString *const QPTWeChatAppKey;


/**
 第三方平台的appKey（高德地图）
 */
UIKIT_EXTERN NSString *const QPTMapAPPKey;

/**
 第三方平台的appKey（融云）
 */
UIKIT_EXTERN NSString *const QPTRongCouldAppKey;




@end
