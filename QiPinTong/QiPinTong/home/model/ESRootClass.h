//
//  ESRootClass.h
//  QiPinTong
//
//  Created by 企聘通 on 17/04/19
//  Copyright (c) ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QPTBaseModel.h"
@class Midbanners,Toparticles,Topbanners,Comlist,Topjob,Fjoblist,Company,Pjoblist,Company,Memlist,Topjob;

@interface ESRootClass : QPTBaseModel

@property (nonatomic, copy) NSString *errmsg;

@property (nonatomic, strong) NSArray<Midbanners *> *midBanners;

@property (nonatomic, strong) NSArray<Toparticles *> *topArticles;

@property (nonatomic, assign) BOOL xinrenfuli;

@property (nonatomic, copy) NSString *curcity;

@property (nonatomic, strong) NSArray<Topbanners *> *topBanners;
@property (nonatomic ,strong) Topbanners *topban;


@property (nonatomic, strong) NSArray<Comlist *> *comList;

@property (nonatomic, assign) NSInteger errcode;

@property (nonatomic, strong) NSArray<Fjoblist *> *fjobList;

@property (nonatomic, strong) NSArray<Pjoblist *> *pjobList;

@property (nonatomic, strong) NSArray<Memlist *> *memList;


-(void)getResponseObjectWith:(id)responseObject;

@end


/**
 顶部动态轮播
 */

@interface Topbanners : QPTBaseModel

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *href;

/**顶部轮播数组*/
@property (nonatomic, strong) NSMutableArray *topLBArray;


@end

/**
 滚动广告
 */

@interface Toparticles : QPTBaseModel

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger commCount;

@property (nonatomic, copy) NSString *href;

@end

/**
 静态轮播
 */
@interface Midbanners : QPTBaseModel

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *href;



@end
