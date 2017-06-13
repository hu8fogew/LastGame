//
//  QPTFileCacheManger.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTFileCacheManger.h"
#import "NSFileManager+Paths.h"
@implementation QPTFileCacheManger

//把对象归档存到沙盒中
+(BOOL)saveObject:(id)object byFileName:(NSString *)fileName
{
    NSString *path = [self appendFilePath:fileName];
    
    path = [path stringByAppendingString:@".archive"];
    BOOL success = [NSKeyedArchiver archiveRootObject:object toFile:path];
    
    return success;
}

//通过文件名从沙盒中找到归档的对象
+(id)getObjectByFileName:(NSString *)fileName
{
    NSString *path = [self appendFilePath:fileName];
    
    path = [path stringByAppendingString:@".archive"];
    
    id obj = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
    return obj;
}

//根据文件名删除沙盒中的文件
+(void)removeObjectByFileName:(NSString *)fileName
{
    NSString *path = [self appendFilePath:fileName];
    path = [path stringByAppendingString:@".archive"];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
    
}

#pragma mark -----拼接路径
+(NSString *)appendFilePath:(NSString *)fileName
{
    //沙盒缓存路径
    NSString *cachePath = [NSFileManager cachesPath];
    NSString *filePath = [NSString stringWithFormat:@"%@/%@",cachePath,fileName];
    if (![[NSFileManager defaultManager] fileExistsAtPath:fileName isDirectory:nil]) {
        [[NSFileManager defaultManager] createDirectoryAtPath:fileName withIntermediateDirectories:NO attributes:nil error:nil];
    }
    return filePath;
}


#pragma mark -----User Default

//存储用户偏好设置
+(void)saveUserData:(id)data forKey:(NSString *)key
{
    
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    //同步操作 synchronize；
    [[NSUserDefaults standardUserDefaults] synchronize];
    
    
}


//读取用户偏好设置
+(id)readUserDataForKey:(NSString *)key
{
    id obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
    return obj;
    
}

//删除用户偏好设置
+(void)removeUserDataForKey:(NSString *)key
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:key];
    [[NSUserDefaults standardUserDefaults] synchronize];
}





@end
