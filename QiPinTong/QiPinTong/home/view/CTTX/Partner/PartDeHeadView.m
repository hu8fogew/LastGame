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
        self.backgroundColor = grayC;
        
        self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46-10)];
        [self addSubview:self.backImageView];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SubImageSize.width/2;
        [self.backImageView addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(SubImageSize.width/6);
            make.centerX.equalTo(self.backImageView);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        self.nameLabel = [self createLabelWithFont:mainTitleSize andTextColor:whiteC andSview:self];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).with.offset(SubImageSize.width/7);
            make.centerX.equalTo(self.imgView);
        }];
        
        self.industryLabel = [self createLabelWithFont:descTitleSize andTextColor:whiteC andSview:self];
        [self.industryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH/4);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(SubImageSize.width/8);
        }];
        
        self.wantLabel = [self createLabelWithFont:descTitleSize andTextColor:whiteC andSview:self];
        [self.wantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.industryLabel.mas_right).with.offset(6);
            make.centerY.equalTo(self.industryLabel);
        }];
        
        self.amountLabel = [self createLabelWithFont:descTitleSize andTextColor:whiteC andSview:self];
        [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.wantLabel.mas_right).with.offset(6);
            make.centerY.equalTo(self.wantLabel);
        }];
        
        self.infoLabel = [self createLabelWithFont:descTitleSize andTextColor:whiteC andSview:self];
        [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(SCREEN_WIDTH*0.3);
            make.top.equalTo(self.industryLabel.mas_bottom).with.offset(SubImageSize.width/8);
        }];
        
        UIView *hv = [UIView new];
        hv.backgroundColor = whiteC;
        [self addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.infoLabel.mas_right).with.offset(3);
            make.centerY.equalTo(self.infoLabel);
            make.size.mas_equalTo(CGSizeMake(1, 14));
        }];
        
        self.addressIcon = [UIImageView new];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hv).with.offset(4);
            make.centerY.equalTo(self.infoLabel);
            make.size.mas_equalTo(CGSizeMake(descTitleSize, descTitleSize));
        }];
        
        self.addressLabel = [self createLabelWithFont:descTitleSize andTextColor:whiteC andSview:self];
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
