//
//  YSYKFooterView.m
//  家长界
//
//  Created by taylor on 2016/12/3.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "FooterShowView.h"

@implementation FooterShowView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.28)];
        view.backgroundColor = whiteC;
        [self addSubview:view];
        
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/3-1, SCREEN_WIDTH*0.28-1)];
        [view addSubview:vi1];
        self.firstTiLabel = [self addLabelWithFont:18 andTextColor:MainColor andSview:vi1];
        [self.firstTiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(vi1);
            make.top.equalTo(vi1).with.offset(vi1.height*0.28);
        }];
        self.firstDeLabel = [self addLabelWithFont:16 andTextColor:HWColor(153, 153, 153) andSview:vi1];
        [self.firstDeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(vi1);
            make.top.equalTo(self.firstTiLabel.mas_bottom).with.offset(10);
        }];
        
        UIView *hv1 = [UIView new];
        hv1.backgroundColor = HWColor(241, 241, 241);
        [view addSubview:hv1];
        [hv1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi1.mas_right);
            make.top.equalTo(view).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(1, SCREEN_WIDTH*0.28-30));
        }];
        
        UIView *vi2 = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/3, 0, SCREEN_WIDTH/3-1, SCREEN_WIDTH*0.28-1)];
        [view addSubview:vi2];
        self.secondTiLabel = [self addLabelWithFont:18 andTextColor:HWColor(51, 51, 51) andSview:vi2];
        [self.secondTiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(vi2);
            make.centerY.equalTo(self.firstTiLabel);
        }];
        self.secondDeLabel = [self addLabelWithFont:16 andTextColor:HWColor(153, 153, 153) andSview:vi2];
        [self.secondDeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(vi2);
            make.centerY.equalTo(self.firstDeLabel);
        }];
        
        UIView *hv2 = [UIView new];
        hv2.backgroundColor = HWColor(241, 241, 241);
        [view addSubview:hv2];
        [hv2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi2.mas_right);
            make.top.equalTo(view).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(1, SCREEN_WIDTH*0.28-30));
        }];
        
        UIView *vi3 = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*2/3, 0, SCREEN_WIDTH/3, SCREEN_WIDTH*0.28-1)];
        [view addSubview:vi3];
        self.thirdTiLabel = [self addLabelWithFont:18 andTextColor:HWColor(51, 51, 51) andSview:vi3];
        [self.thirdTiLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(vi3);
            make.centerY.equalTo(self.secondTiLabel);
        }];
        self.thirdDeLabel = [self addLabelWithFont:16 andTextColor:HWColor(153, 153, 153) andSview:vi3];
        [self.thirdDeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(vi3);
            make.centerY.equalTo(self.secondDeLabel);
        }];
        
        UIView *vv = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.28, SCREEN_WIDTH, 1)];
        vv.backgroundColor = HWColor(241, 241, 241);
        [view addSubview:vv];
        
        self.bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.bottomBtn.backgroundColor = orangeC;
        [self.bottomBtn setTitle:@"立即入驻" forState:UIControlStateNormal];
        [self.bottomBtn setTitleColor:whiteC forState:UIControlStateNormal];
        self.bottomBtn.layer.masksToBounds = YES;
        self.bottomBtn.layer.cornerRadius = 4;
        [self addSubview:self.bottomBtn];
        [self.bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-40, SCREEN_WIDTH*0.11));
        }];
    }
    return self;
}

-(UILabel *)addLabelWithFont:(CGFloat)font andTextColor:(UIColor *)textColor andSview:(UIView *)sView{
    
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    [sView addSubview:lab];
    return lab;
}

@end
