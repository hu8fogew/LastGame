//
//  NSObject+Parse.m
//  BaseProject
//
//  Created by mac on 16/9/2.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)

+(id)parse:(id)responseObj
{
    //如果请求的结果类型是数组的话就调用数组解析的方法；
    if ([responseObj isKindOfClass:[NSArray class]]) {
        //返回数组解析的数据
        return [self parseArray:responseObj];
    }
    //如果解析的数据类型是字典类型的话，就调用字典的解析方式；
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        
        return [self parseDictionary:responseObj];
    }
    return responseObj;
}
//解析数组
+(id)parseArray:(NSArray *)array
{
    NSMutableArray *muArray = [NSMutableArray array];
    
    for (id obj in array) {
        [muArray addObject:[self parse:obj]];
    }
    return [muArray copy];
    
}

//解析字典
+(id)parseDictionary:(NSDictionary *)dictionary
{
    
    id model = [self new];
    [dictionary enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        //处理系统关键字冲突问题
        key = [self replacePropertyForKey:key];
        //考虑value是数组的问题
        if ([obj isKindOfClass:[NSArray class]]) {
            
            Class class = [self objectClassInArray][key];
            
            if (class) {
                obj = [class parseArray:obj];
            }
        }
        //考虑value是字典的时候；
        if ([obj isKindOfClass:[NSDictionary class]]) {
            
            Class class = [self objectClassInDic][key];
            if (class) {
                obj = [class parseDictionary:obj];
            }
        }
        [model setValue:obj forKey:key];
    }];
    return model;
}

+(NSString *)replacePropertyForKey:(NSString *)key
{
    if ([key isEqualToString:@"id"]) {
        return @"ID";
    }
    if ([key isEqualToString:@"description"]) {
        return @"desc";
    }
    //根据具体情况进行 添加
    return key;
    
}


+(NSDictionary *)objectClassInArray
{
    
    return nil;
    
}
+ (NSDictionary *)objectClassInDic
{
    return nil;
}

@end
