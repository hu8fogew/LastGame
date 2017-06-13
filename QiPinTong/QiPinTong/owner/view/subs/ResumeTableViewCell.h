//
//  ResumeTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResumeTableViewCell : UITableViewCell

//名字
@property (strong,nonatomic) UILabel *nameLab;

//职位//////
@property (strong,nonatomic) UILabel *postLab;

//学历
@property (strong,nonatomic) UILabel *educaLab;

//经验
@property (strong,nonatomic) UILabel *ageLab;

//地址
@property (strong,nonatomic) UILabel *addressLab;


//日期///////
@property (strong,nonatomic) UILabel *dateLab;
//箭头///////
@property (strong,nonatomic) UIImageView *arrowIcon;



//薪资//////
@property (strong,nonatomic) UILabel *salaryLab;



@end
