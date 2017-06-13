//
//  QPTRequestManager.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTRequestManager.h"


@interface AFHTTPSessionManager (Shared)

// 设置单例
+(instancetype)sharedManager;


@end

@implementation AFHTTPSessionManager (Shared)


//单例模式
+(instancetype)sharedManager
{
    static AFHTTPSessionManager *_instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [AFHTTPSessionManager manager];
//        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/plain",@"text/json",@"text/javascript",@"text/html", nil];
        _instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",@"text/plain", nil];
        
//        _instance.responseSerializer = [AFHTTPResponseSerializer serializer];
        
        
    });
    return _instance;
}



@end


@implementation QPTRequestManager


//GET请求方式
+(void)GET:(NSString *)URLString parameters:(id)parameters responseSeialilzerType:(QPTResponseSeializerType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    //请求头
    [manager.requestSerializer setValue:[self cookie] forHTTPHeaderField:@"Cookie"];
    
    //如果不是JSON或者不是Default 才设置解析类型
    if (type != QPTResponseSeializerTypeJSON && type != QPTResponseSeializerTypeDefault) {
        
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    
    //https证书

     AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
     policy.allowInvalidCertificates = YES;
     manager.securityPolicy  = policy;

    
    [manager GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        if (success) {
            success(responseObject);
            HWLog(@"成功");
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
            HWLog(@"失败");
        }
        
        
    }];
    
}



//POST 请求方式
+(void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(QPTResponseSeializerType)type success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    
    //请求头
    
    [manager.requestSerializer setValue:[self cookie] forHTTPHeaderField:@"Authorization"];
    
    //如果不是JSON 或者不是Default 才设置解析器类型
    if (type != QPTResponseSeializerTypeDefault && type != QPTResponseSeializerTypeJSON) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    
//    https证书设置
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    policy.allowInvalidCertificates = YES;
    manager.securityPolicy = policy;
    
    //请求
    
    [manager POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       
        
        if (success) {
            
//            NSString *str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
//            responseObject = str;
            
            success(responseObject);
        }
//        HWLog(@"%@",responseObject);
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        [MBProgressHUD showMessage:@"网络失败～请重新再试"];
        
        if (failure) {
            failure(error);
        }
    }];
}



//POST请求上传
+(void)POST:(NSString *)URLString parameters:(id)parameters responseSeializerType:(QPTResponseSeializerType)type constructingBodyWithBlock:(void (^)(id<AFMultipartFormData>))block success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    
    //请求头
    /*
    NSString *value = @"";
    
    if (value) {
        [manager.requestSerializer setValue:value forHTTPHeaderField:@"Authorization"];
    }
     */
    //如果不是JSON或者 不是Default 才设置解析器类型
    if (type != QPTResponseSeializerTypeJSON && type != QPTResponseSeializerTypeDefault) {
        manager.responseSerializer = [self responseSearalizerWithSerilizerType:type];
    }
    //https证书
    /*
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    policy.allowInvalidCertificates = YES;
    manager.securityPolicy = policy;
    
    */
    
    //请求
    
    [manager POST:URLString parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        if (block) {
            block(formData);
        }
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        HWLog(@"%@",responseObject);
        if (success) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error);
        }
    }];
    
}







+(NSString *)cookie
{
    return @"";
}



/*
 设置数据解析器类型
  manager         请求管理类
  serilizerType   数据解析器类型
 */


+ (AFHTTPResponseSerializer *)responseSearalizerWithSerilizerType:(QPTResponseSeializerType)serilizerType {
    
    switch (serilizerType) {
            
        case QPTResponseSeializerTypeDefault: // default is JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case QPTResponseSeializerTypeJSON: // JSON
            return [AFJSONResponseSerializer serializer];
            break;
            
        case QPTResponseSeializerTypeXML: // XML
            return [AFXMLParserResponseSerializer serializer];
            break;
            
        case QPTResponseSeializerTypePlist: // Plist
            return [AFPropertyListResponseSerializer serializer];
            break;
            
        case QPTResponseSeializerTypeCompound: // Compound
            return [AFCompoundResponseSerializer serializer];
            break;
            
        case QPTResponseSeializerTypeImage: // Image
            return [AFImageResponseSerializer serializer];
            break;
            
        case QPTResponseSeializerTypeData: // Data
            return [AFHTTPResponseSerializer serializer];
            break;
            
        default:  // 默认解析器为 JSON解析
            return [AFJSONResponseSerializer serializer];
            break;
    }
}



//取消网路请求

+(void)cancelAllRequest
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager sharedManager];
    [manager.operationQueue cancelAllOperations];
}


@end
