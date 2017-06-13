//
//  InvestorDescView.m
//  QiPinTong
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "InvestorDescView.h"
@interface InvestorDescView()
@property(nonatomic,strong)LWAsyncDisplayView *asycView;
@end


@implementation InvestorDescView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor =[UIColor whiteColor];
        
        [self addSubview:self.asycView];
        
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.investorLayout.investorViewHeight);
}

-(LWAsyncDisplayView *)asycView{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
    }
    return _asycView;
}

-(InvestmentLayout *)investorLayout
{
    if (!_investorLayout) {
        _investorLayout = [[InvestmentLayout alloc]initInvestmentPersonDescView];
        self.asycView.layout = self.investorLayout;
    }
    return _investorLayout;
}


@end
