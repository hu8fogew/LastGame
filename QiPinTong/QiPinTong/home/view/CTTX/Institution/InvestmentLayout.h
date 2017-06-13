//
//  InvestmentLayout.h
//  QiPinTong
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface InvestmentLayout : LWLayout<NSCopying>

//投资机构的表单高度
@property(nonatomic,assign) CGFloat investmentViewHeight;
//投资人详情的表单高度
@property(nonatomic,assign) CGFloat investorViewHeight;


//投资公司view
-(id)initInvestmentDescView;

//投资人view
-(id)initInvestmentPersonDescView;

@end
