//
//  TalentsTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/3/30.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalentsTableViewCell : UITableViewCell

//图像
@property (strong,nonatomic) UIImageView *imgView;

//姓名
@property (strong,nonatomic) UILabel *nameLab;

//性别
@property (strong,nonatomic) UIImageView *sexImg;

//日期
@property (strong,nonatomic) UILabel *dateLab;

//期望职位
@property (strong,nonatomic) UILabel *expectLab;
@property (strong,nonatomic) UILabel *jobLab;

//薪资
@property (strong,nonatomic) UILabel *salaryLab;

//学历
@property (strong,nonatomic) UIImageView *academicIcon;
@property (strong,nonatomic) UILabel *academicLab;

//经验
@property (strong,nonatomic) UIImageView *experienceIcon;
@property (strong,nonatomic) UILabel *experienceLab;

//地址
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLab;

@end
