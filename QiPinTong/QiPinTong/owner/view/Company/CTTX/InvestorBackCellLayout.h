//
//  InvestorCellLayout.h
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface InvestorBackCellLayout : LWLayout<NSCopying>

@property (assign,nonatomic) CGFloat investorCellHeight;

@property (assign,nonatomic) CGRect iEditBtn;
@property (assign,nonatomic) CGRect iDeleteBtn;

-(id)initWithInvestorBackCell;

@end
