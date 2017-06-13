//
//  HotZWTableViewCell.h
//  家长界
//
//  Created by mac on 2016/11/26.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Fjoblist.h"

@class Fjoblist,Company;

@interface HotZWTableViewCell : UITableViewCell


@property (nonatomic,strong) Fjoblist *jobList;

@property (nonatomic,strong) Company *compan;

@property (nonatomic,strong) NSIndexPath *indePath;

@property (nonatomic,strong) NSMutableArray *modelArr;


//图像
@property(nonatomic,strong)UIImageView *imgView;

//职位
@property(nonatomic,strong)UILabel *postLab;

//公司
@property(nonatomic,strong)UILabel *companyLab;

//vip
@property(nonatomic,strong)UIImageView *vipIcon;

//行业
@property(nonatomic,strong)UILabel *typeLab;

//学历
@property(nonatomic,strong)UIImageView *academicIcon;
@property(nonatomic,strong)UILabel *academicLab;

//工作经验
@property(nonatomic,strong)UIImageView *timeIcon;
@property(nonatomic,strong)UILabel *timeLab;

//定位
@property(nonatomic,strong)UIImageView *addressIcon;
@property(nonatomic,strong)UILabel *addressLab;

//薪资
@property(nonatomic,strong)UILabel *salaryLab;

//查看
@property(nonatomic,strong)UIImageView *eyeIcon;
@property(nonatomic,strong)UILabel *numLab;


@end
