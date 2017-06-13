//
//  NSObject+Parse.h
//  BaseProject
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 haha😄. All rights reserved.
//
/*
 解析的对象就只有两种：字典和数组；
 2、每个模型类都有parse方法，传入字典或者数组，返回模型对象；
 3、处理key不存在，value不存的情况，防止程序崩溃，
 4、考虑key和系统关键字冲突的问题。
 5、考虑value中存在数组的问题；
 
 */


#import <Foundation/Foundation.h>

@interface NSObject (Parse)

/**
 *  JSON解析通用方法；
 *
 *  @param responseObj 需要什么类型旧返回什么类型
 *
 *  @return 字典或者数组
 */
+(id)parse:(id)responseObj;
//
/**
 *  供子类去重写的方法，解决系统关键字冲突的问题；（description）
 *
 *  @param key 系统关键字
 *
 *  @return 修改后的关键字
 */
+(NSString *)replacePropertyForKey:(NSString *)key;

//考虑数组问题
+(NSDictionary *)objectClassInArray;

+ (NSDictionary *)objectClassInDic;
@end
