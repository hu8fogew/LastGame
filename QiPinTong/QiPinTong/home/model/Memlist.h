//
//  Memlist.h
//  QiPinTong
//
//  Created by 企聘通 on 17/04/19
//  Copyright (c) ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QPTBaseModel.h"
@class Topjob;

@interface Memlist : QPTBaseModel

@property (nonatomic, copy) NSString *href;

@property (nonatomic, copy) NSString *birthday;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, assign) NSInteger sex;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, copy) NSString *darenStrength;

@property (nonatomic, copy) NSString *snsname;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *juli;

@property (nonatomic, copy) NSString *epYears;

@property (nonatomic, strong) Topjob *topJob;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *eduDeg;

@property (nonatomic, assign) NSInteger deliveryID;

@property (nonatomic, copy) NSString *deliveryTime;

@property (nonatomic, copy) NSString *headImgUrl;

@property (nonatomic, copy) NSString *darenBizType;

@property (nonatomic, assign) BOOL authFlag;

@property (nonatomic, copy) NSString *age;

@property (nonatomic, assign) NSInteger deliveryJobID;

@property (nonatomic, assign) NSInteger darenState;

@end
