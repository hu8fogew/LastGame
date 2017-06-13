//
//  NSObject+NetWork.h
//  BaseProject
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 haha😄. All rights reserved.
//
/*
 网络请求类型：Get 和 Post
 
 Get传递小型数据；
 Post传递大型数据；
 
 
 
 
 */


#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface NSObject (NetWork)

+(id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void(^)(id responseObj,NSError *error))completionHandle;


+(id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void(^)(id responseObj,NSError *error))completionHandle;


@end
