//
//  Comlist.h
//  QiPinTong
//
//  Created by 企聘通 on 17/04/19
//  Copyright (c) ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QPTBaseModel.h"
@class Topjob;

@interface Comlist : QPTBaseModel

@property (nonatomic, copy) NSString *snsname;

@property (nonatomic, copy) NSString *industry;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *brandname;

@property (nonatomic, assign) BOOL authFlag;

@property (nonatomic, copy) NSString *imgUrl;

@property (nonatomic, assign) NSInteger jobCount;

@property (nonatomic, copy) NSString *logoImgUrl;

@property (nonatomic, copy) NSString *juli;

@property (nonatomic, copy) NSString *href;

@property (nonatomic, strong) Topjob *topJob;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, copy) NSString *finacStage;

@property (nonatomic, copy) NSString *name;

@end
