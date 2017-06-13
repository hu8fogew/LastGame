//
//  QPTUserInfoManager.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/15.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTUserInfoManager.h"
#import "QPTFileCacheManger.h"
@implementation QPTUserInfoManager


//单例模式——————————————
+(instancetype)sharedUserInfoManager
{
    static QPTUserInfoManager *userManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        userManager = [[QPTUserInfoManager alloc]init];
        
    });
    
    return userManager;
    
}

#pragma mark _____________Class_Way


//登录
-(void)didLoginIn
{
    [QPTFileCacheManger saveUserData:@YES forKey:QPTHasLoginFlag];
}

-(void)didLoginOut
{
    
    [QPTFileCacheManger saveUserData:@NO forKey:QPTHasLoginFlag];
    
}


//判断是否登录状态
-(BOOL)isLogin
{
    return [QPTUserDefaults boolForKey:QPTHasLoginFlag];
}


//个人

-(BOOL)isPerson
{
    return [[QPTUserDefaults objectForKey:QPTComOrPerOrBusinessIdentifier] isEqualToString:@"个人"];
}

//企业
-(BOOL)isCompany
{
    return [[QPTUserDefaults objectForKey:QPTComOrPerOrBusinessIdentifier] isEqualToString:@"企业"];
}

//商户
-(BOOL)isBusiness
{
    return [[QPTUserDefaults objectForKey:QPTComOrPerOrBusinessIdentifier] isEqualToString:@"商户"];
}





@end
