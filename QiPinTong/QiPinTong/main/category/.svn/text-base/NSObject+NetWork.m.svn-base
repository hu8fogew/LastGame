//
//  NSObject+NetWork.m
//  BaseProject
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "NSObject+NetWork.h"



@implementation NSObject (NetWork)


//创建单例网路请求对象
-(AFHTTPSessionManager *)sharedNetManger
{
    static AFHTTPSessionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        manager = [AFHTTPSessionManager manager];
        //设置AFNetworking对那些数据进行解析；
        manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/json",@"text/javascript",@"text/plain",nil];
        //设置网络请求时长；
        manager.requestSerializer.timeoutInterval = 30;
        //设置请求时的头部httpHeaderFiled
        //第二个是Key；第一个是Key对应的Value
        [manager.requestSerializer setValue:@"" forHTTPHeaderField:@""];
        
    });
    
    return manager;
    
}

+(id)GET:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle
{
    
    AFHTTPSessionManager *manager = [self sharedNetManger];
    
    return [manager GET:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        completionHandle(responseObject,nil);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
        
        completionHandle(nil,error);
        
    }];

}



+(id)POST:(NSString *)path parameters:(NSDictionary *)params completionHandle:(void (^)(id, NSError *))completionHandle
{
    
    AFHTTPSessionManager *manager = [self sharedNetManger];
    return [manager POST:path parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        completionHandle(responseObject,nil);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        completionHandle(nil,error);
    }];
    
    
}

@end
