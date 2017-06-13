//
//  InstituHeadView.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InstituHeadView.h"

@implementation InstituHeadView

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
            make.top.equalTo(self.backImageView).with.offset(SubImageSize.width/6);
            make.centerX.equalTo(self.backImageView);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        self.titleLabel = [self createLabelWithFont:mainTitleSize andTextColor:whiteC andSview:self];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).with.offset(SubImageSize.width/7);
            make.centerX.equalTo(self.imgView);
        }];
        
        self.subLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:whiteC andSview:self];
        [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.imgView);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(SubImageSize.width/8);
        }];
        
        self.addressIcon = [UIImageView new];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.imgView);
            make.top.equalTo(self.subLabel.mas_bottom).with.offset(SubImageSize.width/8);
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
