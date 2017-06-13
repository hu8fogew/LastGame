//
//  NearbyTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/3/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "NearHighTableViewCell.h"

@implementation NearHighTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 10));
        }];
        
        //图像
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.with.offset(leftToMargin);
            make.centerY.equalTo(self.mas_centerY).with.offset(-5);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        //姓名
        self.nameLab = [UILabel labelWithTextColor:MainColor FontSize:mainTitleSize Sview:self];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(leftToMargin);
            make.top.equalTo(self.imgView);
        }];
        
        //职位
        self.postLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        [self.postLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab.mas_right).with.offset(5);
            make.centerY.equalTo(self.nameLab);
        }];
        
        //薪资
        self.salaryLab = [UILabel labelWithTextColor:orangeC FontSize:mainTitleSize-1 Sview:self];
        [self.salaryLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.with.offset(-leftToMargin);
            make.centerY.equalTo(self.nameLab);
        }];
        
        //学历
        self.academicIcon = [UIImageView new];
        [self addSubview:self.academicIcon];
        [self.academicIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.centerY.equalTo(self.imgView);
            make.size.mas_equalTo(CGSizeMake(mainTitleSize-1, mainTitleSize-1));
        }];
        self.academicLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        [self.academicLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicIcon.mas_right).with.offset(1);
            make.centerY.equalTo(self.academicIcon);
        }];
        
        //经验
        self.experIcon = [UIImageView new];
        [self addSubview:self.experIcon];
        [self.experIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicLab.mas_right).offset(20);
            make.centerY.equalTo(self.academicLab);
            make.size.mas_equalTo(self.academicIcon);
        }];
        self.experLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        [self.experLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.experIcon.mas_right).with.offset(1);
            make.centerY.equalTo(self.experIcon);
        }];
        
        
        //地址
        self.addressIcon = [UIImageView new];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.size.mas_equalTo(self.academicIcon);
        }];
        self.addressLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(1);
            make.centerY.equalTo(self.addressIcon);
        }];

        self.eyeLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        [self.eyeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.salaryLab.mas_right);
            make.centerY.equalTo(self.addressLab);
        }];
        self.eyeIcon = [UIImageView new];
        [self addSubview:self.eyeIcon];
        [self.eyeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.eyeLab.mas_left).with.offset(-1);
            make.centerY.equalTo(self.eyeLab);
            make.size.mas_equalTo(self.academicIcon);
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
