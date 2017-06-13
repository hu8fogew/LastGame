//
//  YCYMCollectionViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCYMCollectionViewCell.h"

@implementation YCYMCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.46, SCREEN_WIDTH*0.6)];
        vi.backgroundColor = grayC;
        [self addSubview:vi];
        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.46, SCREEN_WIDTH*0.46)];
        [vi addSubview:self.imgView];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = HWColor(88, 88, 88);
        vv.alpha = 0.6;
        [self.imgView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self.imgView);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.height.mas_equalTo(self.imgView.height/6);
        }];
        
        self.titleLabel = [self addLabelWithFont:15 andTextColor:whiteC andSview:self.imgView];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView).with.offset(5);
            make.bottom.equalTo(self.imgView.mas_bottom).with.offset(-5);
        }];
        
        self.vIcon = [UIImageView new];
        [self.imgView addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];

        self.jobLabel = [self addLabelWithFont:13 andTextColor:whiteC andSview:self.imgView];
        [self.jobLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-8);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.imgView.mas_bottom).with.offset(SCREEN_WIDTH*0.14/5);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        self.addressLabel = [self addLabelWithFont:13 andTextColor:SecondTitleColor andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];

        self.ageIcon = [UIImageView new];
        [vi addSubview:self.ageIcon];
        [self.ageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(vi.width*0.38);
            make.centerY.equalTo(self.addressIcon);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.ageLabel = [self addLabelWithFont:13 andTextColor:SecondTitleColor andSview:vi];
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.ageIcon);
        }];
        
        self.educaLabel = [self addLabelWithFont:13 andTextColor:SecondTitleColor andSview:vi];
        [self.educaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.jobLabel);
            make.centerY.equalTo(self.ageLabel);
        }];
        
        self.educaIcon = [UIImageView new];
        [vi addSubview:self.educaIcon];
        [self.educaIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.educaLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.educaLabel);
            make.size.mas_equalTo(CGSizeMake(13, 14));
        }];
        
        self.salaryLabel = [self addLabelWithFont:13 andTextColor:HWColor(255, 152, 23) andSview:vi];
        [self.salaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon);
            make.top.equalTo(self.addressIcon.mas_bottom).with.offset(SCREEN_WIDTH*0.14/6);
        }];
        
        self.numberLabel = [self addLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.educaLabel);
            make.centerY.equalTo(self.salaryLabel);
        }];
        
        self.eyeIcon = [UIImageView new];
        [vi addSubview:self.eyeIcon];
        [self.eyeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.numberLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
    }
    return self;
}


-(UILabel *)addLabelWithFont:(CGFloat)font andTextColor:(UIColor *)color andSview:(UIView *)sView{
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = color;
    [sView addSubview:lab];
    
    return lab;
}

@end
