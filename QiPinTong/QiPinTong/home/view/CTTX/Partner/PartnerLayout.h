//
//  PartnerLayout.h
//  QiPinTong
//
//  Created by taylor on 2017/4/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface PartnerLayout : LWLayout<NSCopying>

@property (assign,nonatomic) CGFloat partnerCellH;


-(id)initWithPartnerCell;

@end
