//
//  QPTUserInfo.m
//  QiPinTong
//
//  Created by mac on 2017/3/28.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTUserInfo.h"

@implementation QPTUserInfo

-(void)getUserInfoWithUserId:(NSString *)userId completion:(void (^)(RCUserInfo *))completion
{
    if ([[userId lowercaseString] isEqualToString:@"隔壁老王"]) {
        completion(self.userFirstObj);
    }else
    {
        completion(self.userSecondObj);
    }
}




-(RCUserInfo *)userFirstObj
{
    if (!_userFirstObj) {
        _userFirstObj = [[RCUserInfo alloc]initWithUserId:@"001" name:@"隔壁老王" portrait:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488278848791&di=a5f6bd88fd5b26af6a00c565fe6a3278&imgtype=0&src=http%3A%2F%2Fpic.58pic.com%2F58pic%2F13%2F19%2F66%2F66H58PICcnt_1024.jpg"];
    }
    return _userFirstObj;
}


-(RCUserInfo *)userSecondObj
{
    if (!_userSecondObj) {
        _userSecondObj = [[RCUserInfo alloc]initWithUserId:@"002" name:@"隔壁老宋" portrait:@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1488278848790&di=566e31a8f7282d7843e48794112426e6&imgtype=0&src=http%3A%2F%2Fpic36.nipic.com%2F20131130%2F4499633_224250411000_2.jpg"];
    }
    return _userSecondObj;
}


@end
