//
//  ResumeTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ResumeTableViewCell.h"

@implementation ResumeTableViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        self.backgroundColor = whiteC;
        
        //名字
        self.nameLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.bottom.equalTo(self.mas_centerY).offset(-leftToMargin);
        }];
        
        //职位
        self.postLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.postLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab.mas_right).offset(topToMargin);
            make.bottom.equalTo(self.nameLab);
        }];
        
        //箭头
        self.arrowIcon = [UIImageView new];
        [self addSubview:self.arrowIcon];
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(subTitleSize, subTitleSize));
        }];
        
        //日期
        self.dateLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowIcon.mas_left).offset(-2);
            make.centerY.equalTo(self.arrowIcon);
        }];
        
        //学历
        UIImageView *edcIcon = [UIImageView new];
        edcIcon.image = [UIImage imageNamed:@"academicIcon"];
        [self addSubview:edcIcon];
        [edcIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.top.equalTo(self.mas_centerY).offset(5);
            make.size.mas_equalTo(self.arrowIcon);
        }];
        self.educaLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.educaLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(edcIcon.mas_right).offset(2);
            make.centerY.equalTo(edcIcon);
        }];
        
        //经验
        UIImageView *ageIcon = [UIImageView new];
        ageIcon.image = [UIImage imageNamed:@"timeIcon"];
        [self addSubview:ageIcon];
        [ageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.educaLab.mas_right).offset(20);
            make.centerY.equalTo(self.educaLab);
            make.size.mas_equalTo(edcIcon);
        }];
        self.ageLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.ageLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(ageIcon.mas_right).offset(2);
            make.centerY.equalTo(ageIcon);
        }];
        
        //地址
        UIImageView *addressIcon = [UIImageView new];
        addressIcon.image = [UIImage imageNamed:@"locationIcon"];
        [self addSubview:addressIcon];
        [addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageLab.mas_right).offset(20);
            make.centerY.equalTo(self.ageLab);
            make.size.mas_equalTo(ageIcon);
        }];
        self.addressLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(addressIcon.mas_right).offset(2);
            make.centerY.equalTo(addressIcon);
            make.width.mas_equalTo(SCREEN_WIDTH*0.35);
        }];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 10));
        }];
        
        /////////////////不同
        self.salaryLab = [UILabel labelWithTextColor:orangeC FontSize:subTitleSize Sview:self];
        [self.salaryLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.right.equalTo(self.arrowIcon);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
