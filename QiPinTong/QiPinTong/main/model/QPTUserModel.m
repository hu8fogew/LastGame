//
//  QPTUserModel.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTUserModel.h"

@implementation QPTUserModel

+ (NSDictionary *)replacedKeyFromPropertyName {
    return @{
             @"ID":@"id",
             @"desc":@"description",
             @"responseData" : @"data"
             };
}


@end
