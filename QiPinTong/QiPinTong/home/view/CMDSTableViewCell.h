//
//  CMDSTableViewCell.h
//  家长界
//
//  Created by mac on 2016/11/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMDSTableViewCell : UITableViewCell

//图像
@property(nonatomic,strong)UIImageView *imgView;

//人名
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UIImageView *vipIcon;

//薪资
@property(nonatomic,strong)UILabel *salaryLabel;

//职位
@property(nonatomic,strong)UILabel *jobLabel;

//学历
@property(nonatomic,strong)UIImageView *academicIcon;
@property(nonatomic,strong)UILabel *academicLabel;

//工作年限
@property(nonatomic,strong)UIImageView *ageIcon;
@property(nonatomic,strong)UILabel *ageLabel;

//地址
@property(nonatomic,strong)UIImageView *addressIcon;
@property(nonatomic,strong)UILabel *addressLabel;

//查看人数
@property(nonatomic,strong)UIImageView *eyeIcon;
@property(nonatomic,strong)UILabel *numLabel;


@property (nonatomic,strong) UILabel *detailLabel;

@end
