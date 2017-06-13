//
//  QPTBaseModel.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/20.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTBaseModel.h"
#import <MJExtension.h>
//#import "NSObject+MJExtension.h"
@implementation QPTBaseModel


+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{
             @"ID":@"id",
             @"desc":@"description",
             @"responseData" : @"data"
             };
}


/**
 字典数组 -> 模型数组
 */

+(NSMutableArray *)modelArrayWithDictArray:(NSArray *)response
{
    if ([response isKindOfClass:[NSArray class]]) {
        
        NSMutableArray *array = [self mj_objectArrayWithKeyValuesArray:response];
        
        return array;
        
    }
    
    return [NSMutableArray new];
    
}


/**
 通过字典来创建一个模型
 */
+ (id)modelWithDictionary:(NSDictionary *)dictionary
{
    if ([dictionary isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:dictionary];
    }
    
    return [[self alloc] init];
}


/**
 数组中需要转换的模型类
 */
+(void) setUpModelClassInArrayWithContainDict:(NSDictionary *)dict
{
    if (dict.allKeys.count == 0) {
        return;
    }
    [self mj_setupObjectClassInArray:^NSDictionary *{
        return dict;
    }];
}


/**
 字典数组转模型数组
 */

+(NSMutableArray *)modelArrayWithDictArray:(NSArray *)response containDict:(NSDictionary *)dict
{
    if (dict == nil) {
        dict = [NSMutableDictionary new];
        
    }
    
    [self setUpModelClassInArrayWithContainDict:dict];
    
    return [self modelArrayWithDictArray:response];
}

/**
 
 */

+(id)modelWithDictionary:(NSDictionary *)dictionary containDict:(NSDictionary *)dict
{
    
    if (dict == nil) {
        dict = [NSMutableDictionary new];
    }
    [self setUpModelClassInArrayWithContainDict:dict];
    return [self modelWithDictionary:dictionary];
    
    
}





//解档 - 取出模型
//- (id)unarchiver {
//    id obj = [NHFileCacheManager getObjectByFileName:[self.class description]];
//    return obj;
//}
//归档 - 存入模型
//- (void)archive {
//    [NHFileCacheManager saveObject:self byFileName:[self.class description]];
//}
//移除缓存中的模型
//- (void)remove {
//    [NHFileCacheManager removeObjectByFileName:[self.class description]];
//}











@end
