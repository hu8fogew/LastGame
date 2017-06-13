//
//  NSObject+MJExtension.m
//  BaseProject
//
//  Created by mac on 16/9/5.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "NSObject+MJExtension.h"

@implementation NSObject (MJExtension)

//MJExtension的封装解析方法；不需要再判断JSON数据的类型是字典还是数组；
+(id)mjParse:(id)responseObj
{
    
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    return responseObj;
}

//(封装的改变因为和系统名重名的变量名)修改变量名跟系统属性重名的方法；
+(NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName
{
    //这样的方式不合理；
    if ([propertyName isEqualToString:@"ID"]) {
        propertyName = @"id";
    }
    if ([propertyName isEqualToString:@"desc"]) {
        propertyName = @"description";
    }
    
    return propertyName;
}


@end
