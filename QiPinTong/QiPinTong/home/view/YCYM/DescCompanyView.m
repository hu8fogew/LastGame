//
//  DescCompanyView.m
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "DescCompanyView.h"

@interface DescCompanyView()

@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@end

@implementation DescCompanyView

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
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.comLay.descCompanyHeight);
}

-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
    }
    return _asycView;
}

-(CompanyLayout *)comLay
{
    if (!_comLay) {
        _comLay = [[CompanyLayout alloc]initDescCompanyView];
        self.asycView.layout = self.comLay;
    }
    return _comLay;
}




@end
