//
//  PartDeHeadView.m
//  家长界
//
//  Created by taylor on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PartDeHeadView.h"

@implementation PartDeHeadView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        vi.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:vi];
        
        self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46-10)];
        [vi addSubview:self.backImageView];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SCREEN_WIDTH*0.17/2;
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.17/5);
            make.centerX.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.17, SCREEN_WIDTH*0.17));
        }];
        
        self.nameLabel = [self createLabelWithFont:15 andTextColor:[UIColor whiteColor] andSview:vi];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).with.offset(SCREEN_WIDTH*0.17/6);
            make.centerX.equalTo(self.imgView);
        }];
        
        self.industryLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:vi];
        [self.industryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(SCREEN_WIDTH/4);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.17/7);
        }];
        
        self.wantLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:vi];
        [self.wantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.industryLabel.mas_right).with.offset(6);
            make.centerY.equalTo(self.industryLabel);
        }];
        
        self.amountLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:vi];
        [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.wantLabel.mas_right).with.offset(6);
            make.centerY.equalTo(self.wantLabel);
        }];
        
        self.infoLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:vi];
        [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(SCREEN_WIDTH*0.3);
            make.top.equalTo(self.industryLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.17/7);
        }];
        
        UIView *hv = [UIView new];
        hv.backgroundColor = [UIColor whiteColor];
        [vi addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.infoLabel.mas_right).with.offset(3);
            make.centerY.equalTo(self.infoLabel);
            make.size.mas_equalTo(CGSizeMake(1, 14));
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hv).with.offset(4);
            make.centerY.equalTo(self.infoLabel);
            make.size.mas_equalTo(CGSizeMake(12, 13));
        }];
        
        self.addressLabel = [self createLabelWithFont:12 andTextColor:[UIColor whiteColor] andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];
    }
    return self;
}


-(UILabel *)createLabelWithFont:(CGFloat)font andTextColor:(UIColor *)textColor andSview:(UIView *)sView{
    
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    [sView addSubview:lab];
    
    return lab;
}


@end
