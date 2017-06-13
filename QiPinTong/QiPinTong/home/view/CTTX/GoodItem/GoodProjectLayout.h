//
//  GoodProjectLayout.h
//  QiPinTong
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface GoodProjectLayout : LWLayout<NSCopying>

//好项目
@property(nonatomic,assign) CGFloat projectCellHeight;
//合伙人
@property(nonatomic,assign) CGFloat partnerCellHeight;


//好项目
-(id)initWellProjectCell;
//合伙人
-(id)initPartnerDetialCell;
@end
