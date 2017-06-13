//
//  NSFileManager+Paths.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//


//  文件管理（NSFileManager）



#import <Foundation/Foundation.h>

@interface NSFileManager (Paths)

/**
 获取Document路径
 Get URL of Documents directory
 
 return Documents directory URL
 
 */
+(NSURL *)documentsURL;


/**
 获取Document路径
 return Documents directory paths
 */
+(NSString *)documentsPath;


/**
 获取Library路径
 Get URL of library directory 
 return Library directory URL
 
 */
+(NSURL *)libraryURL;

/**
 获取Library路径
 Get path of Library directory.
 
 @return Library directory path.
 */
+ (NSString *)libraryPath;

/**
 /获取Cache路径
 Get URL of Caches directory.
 
 @return Caches directory URL.
 */
+ (NSURL *)cachesURL;

/**
 /获取Cache路径
 Get path of Caches directory.
 
 @return Caches directory path.
 */
+ (NSString *)cachesPath;

/**
 Adds a special filesystem flag to a file to avoid iCloud backup it.
 
 @param path Path to a file to set an attribute.
 */
+ (BOOL)addSkipBackupAttributeToFile:(NSString *)path;

/**
 Get available disk space.
 
 @return An amount of available disk space in Megabytes.
 */
+ (double)availableDiskSpace;


/**
 获取融云bundle这种的文件路径
 */

+ (NSString *)rongYunBundlePath;




@end
