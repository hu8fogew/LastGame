//
//  InvestMentCompanyView.m
//  QiPinTong
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "InvestMentCompanyView.h"

@interface InvestMentCompanyView()

@property(nonatomic,strong)LWAsyncDisplayView *asycView;


@end


@implementation InvestMentCompanyView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:self.asycView];
        
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.investDescLay.investmentViewHeight);
}



-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
    }
    return _asycView;
}


-(InvestmentLayout *)investDescLay
{
    if (!_investDescLay) {
        _investDescLay = [[InvestmentLayout alloc]initInvestmentDescView];
        self.asycView.layout = self.investDescLay;
    }
    return _investDescLay;
}


@end
