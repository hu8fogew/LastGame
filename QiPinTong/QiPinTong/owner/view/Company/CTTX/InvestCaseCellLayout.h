//
//  InvestCaseCellLayout.h
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface InvestCaseCellLayout : LWLayout<NSCopying>

@property (assign,nonatomic) CGFloat investCaseCellHeight;

@property (assign,nonatomic) CGRect CaseEditBtn;
@property (assign,nonatomic) CGRect CaseDeleteBtn;

-(id)initWithInvestCaseCell;

@end
