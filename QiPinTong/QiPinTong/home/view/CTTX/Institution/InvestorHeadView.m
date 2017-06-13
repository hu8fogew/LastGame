//
//  InvestorHeadView.m
//  家长界
//
//  Created by taylor on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InvestorHeadView.h"

@implementation InvestorHeadView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = grayC;
        
        self.backImageView = [UIImageView new];
        [self addSubview:self.backImageView];
        [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*0.46-10));
        }];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SubImageSize.width/2;
        [self.backImageView addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(SCREEN_WIDTH*0.17/6);
            make.centerX.equalTo(self.backImageView);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        self.nameLabel = [self createLabelWithFont:mainTitleSize andTextColor:whiteC andSview:self];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).with.offset(SubImageSize.width/7);
            make.centerX.equalTo(self.imgView);
        }];
        
        self.fundLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:whiteC andSview:self];
        [self.fundLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imgView.mas_centerX).offset(-4);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(SubImageSize.width/8);
        }];
        
        self.jobLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:whiteC andSview:self];
        [self.jobLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_centerX).offset(4);
            make.centerY.equalTo(self.fundLabel);
        }];
        
        self.addressIcon = [UIImageView new];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imgView.mas_centerX).with.offset(-2);
            make.top.equalTo(self.jobLabel.mas_bottom).offset(SubImageSize.width/8);
            make.size.mas_equalTo(CGSizeMake(descTitleSize, descTitleSize));

        }];
        
        self.addressLabel = [self createLabelWithFont:descTitleSize andTextColor:whiteC andSview:self];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_centerX).with.offset(2);
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
