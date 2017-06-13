//
//  NSFileManager+Paths.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "NSFileManager+Paths.h"
#include <sys/xattr.h>
@implementation NSFileManager (Paths)


+(NSURL *)URLForDirectory:(NSSearchPathDirectory)directory
{
    return [self.defaultManager URLsForDirectory:directory inDomains:NSUserDomainMask].lastObject;
}

+(NSString *)pathForDirectory:(NSSearchPathDirectory)directory
{
    return NSSearchPathForDirectoriesInDomains(directory, NSUserDomainMask, YES)[0];
    
}

//return DocumentURL;

+(NSURL *)documentsURL
{
    return [self URLForDirectory:NSDocumentDirectory];
}

+(NSString *)documentsPath
{
    return [self pathForDirectory:NSDocumentDirectory];
}


//return LibraryURL
+(NSURL *)libraryURL
{
    return [self URLForDirectory:NSLibraryDirectory];
}

+(NSString *)libraryPath
{
    return [self pathForDirectory:NSLibraryDirectory];
}


//return cachesURL

+(NSURL *)cachesURL
{
    return [self URLForDirectory:NSCachesDirectory];
}

+(NSString *)cachesPath
{
    return [self pathForDirectory:NSCachesDirectory];
}


//return path Path to a file to set an attribute

+(BOOL)addSkipBackupAttributeToFile:(NSString *)path
{
    return [[NSURL.alloc initWithString:path] setResourceValue:@(YES) forKey:NSURLIsExcludedFromBackupKey error:nil];
}


//@return An amount of available disk space in Megabytes
+(double)availableDiskSpace
{
    NSDictionary *attributes = [self.defaultManager attributesOfFileSystemForPath:self.documentsPath error:nil];
    return [attributes[NSFileSystemFreeSize] unsignedLongLongValue] / (double)0x100000;
}


//获取容云bundle路径
+(NSString *)rongYunBundlePath
{
    //获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"RongCloud" ofType:@"bundle"];
    
    return path;
}


@end
