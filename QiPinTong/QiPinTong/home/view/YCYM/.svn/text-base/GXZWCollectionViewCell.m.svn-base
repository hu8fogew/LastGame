//
//  YCYMCollectionViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "GXZWCollectionViewCell.h"

@implementation GXZWCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //个人详情视图
        self.backgroundColor = HWColor(241, 241, 241);
        UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.3)];
        topView.backgroundColor = [UIColor whiteColor];
        [self addSubview:topView];
        
        //左边图标
        self.hMainImage = [UIImageView new];
        self.hMainImage.layer.borderWidth = 1.5;
        self.hMainImage.layer.borderColor = [HWColor(241, 241, 241) CGColor];
        self.hMainImage.layer.cornerRadius = 2;
        self.hMainImage.layer.masksToBounds = YES;
        [topView addSubview:self.hMainImage];
        [self.hMainImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(topView);
            make.left.equalTo(topView).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.23, SCREEN_WIDTH*0.23));
        }];
        
        //职位类型
        self.zwKindText = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:15 andsView:topView];
        [self.zwKindText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.hMainImage.mas_right).with.offset(10);
            make.top.equalTo(self.hMainImage);
        }];
        
        //薪资
        self.salaryText = [self addLabelWithTextColor:HWColor(255, 152, 23) andFont:15 andsView:topView];
        [self.salaryText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(topView).with.offset(-15);
            make.centerY.equalTo(self.zwKindText);
        }];
        
        //公司
        self.companyText = [self addLabelWithTextColor:HWColor(102, 102, 102) andFont:13 andsView:topView];
        [self.companyText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.zwKindText);
            make.top.equalTo(self.zwKindText.mas_bottom).with.offset(SCREEN_WIDTH*0.2/10);
        }];
        
        //vip
        self.vipImage = [UIImageView new];
        [topView addSubview:self.vipImage];
        [self.vipImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyText.mas_right).with.offset(1);
            make.centerY.equalTo(self.companyText);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        //行业类型
        self.hyText = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.hyText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.vipImage.mas_right).with.offset(8);
            make.centerY.equalTo(self.companyText);
        }];
        
        UIView *hv = [UIView new];
        hv.backgroundColor = HWColor(153, 153, 153);
        [topView addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.hyText.mas_right).with.offset(2);
            make.centerY.equalTo(self.companyText);
            make.size.mas_equalTo(CGSizeMake(1, 13));
        }];
        
        //是否上市
        self.bigCompanyText = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.bigCompanyText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hv).with.offset(3);
            make.centerY.equalTo(self.hyText);
        }];
        
        //学历照片
        self.academicImage = [UIImageView new];
        [topView addSubview:self.academicImage];
        [self.academicImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyText);
            make.top.equalTo(self.companyText.mas_bottom).with.offset(SCREEN_WIDTH*0.2/9);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        //学历
        self.academicText = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.academicText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicImage.mas_right).with.offset(2);
            make.centerY.equalTo(self.academicImage);
        }];
        
        //时间图片
        self.timeImageView = [UIImageView new];
        [topView addSubview:self.timeImageView];
        [self.timeImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicText.mas_right).with.offset(15);
            make.centerY.equalTo(self.academicText);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        //工作年限
        self.timeText = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.timeText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.timeImageView.mas_right).with.offset(2);
            make.centerY.equalTo(self.timeImageView);
        }];
        
        //地图图标
        self.mapImageView = [UIImageView new];
        [topView addSubview:self.mapImageView];
        [self.mapImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicImage);
            make.top.equalTo(self.academicImage.mas_bottom).with.offset(SCREEN_WIDTH*0.2/8);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        //地理位置
        self.earaText = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.earaText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mapImageView.mas_right).with.offset(2);
            make.centerY.equalTo(self.mapImageView);
        }];
        
        //查看人数
        self.numText = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.numText mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.salaryText);
            make.centerY.equalTo(self.mapImageView);
        }];
        
        //查看人图标
        self.eyeImage = [UIImageView new];
        [topView addSubview:self.eyeImage];
        [self.eyeImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numText.mas_left).with.offset(-2);
            make.centerY.equalTo(self.numText);
            make.size.mas_equalTo(CGSizeMake(15, 12));
        }];
        
        self.educationLabel = [UILabel new];
        self.educationLabel.textColor = HWColor(153, 153, 153);
        self.educationLabel.font = [UIFont systemFontOfSize:13];
        [topView addSubview:self.educationLabel];
        [self.educationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyText);
            make.top.equalTo(self.companyText.mas_bottom).with.offset(SCREEN_WIDTH*0.2/10);
        }];
        
        self.workLabel = [UILabel new];
        self.workLabel.textColor = HWColor(153, 153, 153);
        self.workLabel.font = [UIFont systemFontOfSize:13];
        [topView addSubview:self.workLabel];
        [self.workLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.educationLabel.mas_right).with.offset(10);
            make.centerY.equalTo(self.educationLabel);
        }];
        
        self.workAddressLabel = [UILabel new];
        self.workAddressLabel.textColor = HWColor(153, 153, 153);
        self.workAddressLabel.font = [UIFont systemFontOfSize:13];
        [topView addSubview:self.workAddressLabel];
        [self.workAddressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.educationLabel);
            make.top.equalTo(self.educationLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.2/10);
        }];
        
        
    }
    return self;
}

-(UILabel *)addLabelWithTextColor:(UIColor *)color andFont:(CGFloat)font andsView:(UIView *)sview
{
    UILabel *lab = [UILabel new];
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:font];
    [sview addSubview:lab];
    
    return lab;
}



@end
