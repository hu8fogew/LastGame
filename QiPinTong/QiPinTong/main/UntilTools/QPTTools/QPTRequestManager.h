//
//  QPTRequestManager.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFURLRequestSerialization.h"
@interface QPTRequestManager : NSObject


/**
 数据解析器类型
 */

typedef NS_ENUM(NSUInteger, QPTResponseSeializerType)
{
    
    /*
     默认类型 JSON 如果使用这个响应器类型，那么请求返回的数据将会是JSON格式
     
     */
    QPTResponseSeializerTypeDefault,
    
    /*
     JSON类型  如果使用这个响应解析器类型，那么 请求返回的数据将会是JSON格式
     
     */
    QPTResponseSeializerTypeJSON,
    
    /*
     XML类型  如果使用这个响应解析器类型，那么请求返回的数据类型将会是XML格式
     
     */
    QPTResponseSeializerTypeXML,
    
    /*
     Plist 类型  如果使用这个响应解析器类型，那么请求返回的数据将会是plist格式
     */
    QPTResponseSeializerTypePlist,
    
    /*
     Compound类型  如果使用这个响应解析器类型，那么请求返回的数据将会是Compound格式
     */
    QPTResponseSeializerTypeCompound,
    
    /*
     Image类型 如果使用这个响应解析器类型，那么请求返回的数据将会是Image格式
     */
    QPTResponseSeializerTypeImage,
    
    /*
     Data类型 如果使用这个响应解析器类型，那么返回的数据将会是二进制格式
     */
    QPTResponseSeializerTypeData
};

/**
 
 GET请求  By NSURLSession
 
 URLString  URL
 Parameters 参数
 type       请求解析器类型
 success    请求成功的回调
 failure    请求失败的回调
 
 
 */

+(void)GET:(NSString *)URLString parameters:(id)parameters responseSeialilzerType:(QPTResponseSeializerType)type success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;



/**
 POST请求  By NSURLSession 
 
 URLString         URL
 parameters        参数
 type              请求解析器类型
 success           请求成功回调
 failure           请求失败回调
 
 
 */

+(void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(QPTResponseSeializerType)type success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;


/**
 
 POST请求  上传数据 By NSURLSession
 
 URLSting        URL
 parameters      参数
 type            请求解析器类型
 success         请求成功回调
 failure         请求失败回调
 */


+(void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(QPTResponseSeializerType)type constructingBodyWithBlock:(void (^)(id<AFMultipartFormData> formData))block success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure;


/**
 取消所有的请求
 */
+(void)cancelAllRequest;










@end
