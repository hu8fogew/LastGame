//
//  TeamDetailTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/5/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TeamListTableViewCell : UITableViewCell

//图像
@property (strong,nonatomic) UIImageView *imgView;

//姓名
@property (strong,nonatomic) UILabel *nameLab;

//职位
@property (strong,nonatomic) UILabel *postLab;

//地址
@property (strong,nonatomic) UILabel *addressLab;

//部门
@property (strong,nonatomic) UILabel *departmentLab;

//日期
@property (strong,nonatomic) UILabel *dateLab;

//箭头
@property (strong,nonatomic) UIImageView *arrowIcon;

@end
