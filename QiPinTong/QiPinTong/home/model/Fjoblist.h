//
//  Fjoblist.h
//  QiPinTong
//
//  Created by 企聘通 on 17/04/19
//  Copyright (c) ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QPTBaseModel.h"
@class Company;

@interface Fjoblist : QPTBaseModel

@property (nonatomic, copy) NSString *href;

@property (nonatomic, copy) NSString *district;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *refreshTime;

@property (nonatomic, strong) Company *company;

@property (nonatomic, assign) NSInteger viewCount;

@property (nonatomic, copy) NSString *catTitle;

@property (nonatomic, assign) BOOL longterm;

@property (nonatomic, copy) NSString *city;

@property (nonatomic, copy) NSString *salary;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *epYears;

@property (nonatomic, assign) NSInteger state;

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger payform;

@property (nonatomic, copy) NSString *workaddress;

@property (nonatomic, copy) NSString *eduDeg;

@property (nonatomic, copy) NSString *addTime;

@property (nonatomic, copy) NSString *salarystring;

@property (nonatomic, assign) NSInteger jobtypeid;

@property (nonatomic, assign) NSInteger deliveryID;

@property (nonatomic, copy) NSString *deliveryTime;

@property (nonatomic, assign) NSInteger recrNumber;

@property (nonatomic, copy) NSString *expireTime;

@property (nonatomic, copy) NSString *address;

@end
