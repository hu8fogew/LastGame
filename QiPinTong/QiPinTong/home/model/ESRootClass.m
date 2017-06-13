//
//  ESRootClass.m
//  QiPinTong
//
//  Created by 企聘通 on 17/04/19
//  Copyright (c) ShiJiJiaLian. All rights reserved.
//

#import "ESRootClass.h"
#import "Comlist.h"
#import "Fjoblist.h"
#import "Pjoblist.h"
#import "Memlist.h"

@implementation ESRootClass



-(void)getResponseObjectWith:(id)responseObject
{
//    NSArray *arr =
    self.topBanners = [responseObject objectForKey:@"topBanners"];
    
    for (NSDictionary *dic in self.topBanners) {
        
        self.topban.imgUrl = dic[@"imgUrl"];
        
        
        [self.topban.topLBArray addObject:self.topban.imgUrl];
    }
    
    
    
    
    self.topArticles = [responseObject objectForKey:@"topArticles"];
    
    self.midBanners = [responseObject objectForKey:@"midBanners"];
    
    self.comList = [responseObject objectForKey:@"comList"];
    self.memList = [responseObject objectForKey:@"memList"];
    
    
    
    

    self.fjobList = [responseObject objectForKey:@"fjobList"];
//    self.pjobList = [responseObject objectForKey:@"pjobList"];
}




@end




/**
 顶部轮播图
 */
@implementation Topbanners

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{
             @"ID" : @"id",
             
             };
}

@end


/**
 滚动广告
 */
@implementation Toparticles

+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{
             @"ID" : @"id",
             
             };
}

@end



/**
 静态轮播
 */
@implementation Midbanners
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    
    return @{
             @"ID" : @"id",
             
             };
}



@end
