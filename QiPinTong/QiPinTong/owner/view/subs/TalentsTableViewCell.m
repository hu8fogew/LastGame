//
//  TalentsTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/3/30.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TalentsTableViewCell.h"

@implementation TalentsTableViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        //图像
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.centerY.mas_equalTo(-5);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        //姓名
        self.nameLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).offset(topToMargin);
            make.top.equalTo(self.imgView);
        }];
        
        //性别图标
        self.sexImg = [UIImageView new];
        [self addSubview:self.sexImg];
        [self.sexImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab.mas_right).offset(5);
            make.centerY.equalTo(self.nameLab);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
        
        //日期
        self.dateLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self.nameLab);
        }];
        
//        //期望职位
        self.expectLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        self.expectLab.text = @"期望职位: ";
        [self.expectLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.centerY.equalTo(self.imgView);
        }];
        self.jobLab = [UILabel labelWithTextColor:blueC FontSize:subTitleSize Sview:self];
        [self.jobLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.expectLab.mas_right);
            make.centerY.equalTo(self.expectLab);
            make.width.mas_equalTo(SCREEN_WIDTH*0.35);
        }];

        //薪资
        self.salaryLab = [UILabel labelWithTextColor:orangeC FontSize:MTitleSize Sview:self];
        [self.salaryLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.dateLab);
            make.centerY.equalTo(self.jobLab);
        }];
        
        //学历
        self.academicIcon = [UIImageView new];
        self.academicIcon.image = [UIImage imageNamed:@"academicIcon"];
        [self addSubview:self.academicIcon];
        [self.academicIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(mainTitleSize-1, mainTitleSize-1));
        }];
        self.academicLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.academicLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicIcon.mas_right);
            make.centerY.equalTo(self.academicIcon);
        }];
        
        //经验
        self.experienceIcon = [UIImageView new];
        self.experienceIcon.image = [UIImage imageNamed:@"timeIcon"];
        [self addSubview:self.experienceIcon];
        [self.experienceIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicLab.mas_right).offset(20);
            make.centerY.equalTo(self.academicLab);
            make.size.mas_equalTo(self.academicIcon);
        }];
        self.experienceLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.experienceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.experienceIcon.mas_right);
            make.centerY.equalTo(self.experienceIcon);
        }];
        
        //地址
        self.addressIcon = [UIImageView new];
        self.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.experienceLab.mas_right).offset(20);
            make.centerY.equalTo(self.academicLab);
            make.size.mas_equalTo(self.academicIcon);
        }];
        self.addressLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right);
            make.centerY.equalTo(self.addressIcon);
        }];
//        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 10));
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
