//
//  QPTUserInfoManager.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/15.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QPTUserInfoManager : NSObject


/**
 登陆成功
 */
-(void)didLoginIn;


/**
 退出登录
 */
-(void)didLoginOut;






/**
 企聘通用户信息管理工具（单例）
 */
+(instancetype)sharedUserInfoManager;



/**
 记录是否登录状态
 */

@property(nonatomic,assign) BOOL isLogin;


/**
 个人
 */
@property (nonatomic,assign) BOOL isPerson;

/**
 企业
 */
@property (nonatomic ,assign) BOOL isCompany;

/**
 商户
 */
@property (nonatomic ,assign) BOOL isBusiness;

@end
