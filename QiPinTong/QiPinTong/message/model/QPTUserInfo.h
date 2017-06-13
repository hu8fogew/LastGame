//
//  QPTUserInfo.h
//  QiPinTong
//
//  Created by mac on 2017/3/28.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QPTUserInfo : NSObject<RCIMUserInfoDataSource>

@property (nonatomic ,strong) RCUserInfo *userFirstObj;

@property (nonatomic,strong) RCUserInfo *userSecondObj;

@end
