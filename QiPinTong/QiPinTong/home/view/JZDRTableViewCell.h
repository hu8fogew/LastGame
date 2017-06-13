//
//  RMJZTableViewCell.h
//  家长界
//
//  Created by mac on 2016/11/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JZDRTableViewCell : UITableViewCell

//图像
@property(nonatomic,strong)UIImageView *imgView;

//职位类型
@property(nonatomic,strong)UILabel *postLab;

//公司
@property(nonatomic,strong)UILabel *companyLab;

//vip
@property(nonatomic,strong)UIImageView *vipIcon;

//行业
@property(nonatomic,strong)UILabel *typeLab;

//招聘
@property(nonatomic,strong)UIImageView *employIcon;
@property(nonatomic,strong)UILabel *employLab;

//定位
@property(nonatomic,strong)UIImageView *addressIcon;
@property(nonatomic,strong)UILabel *addressLab;

//薪资
@property(nonatomic,strong)UILabel *salaryLab;

//日结
@property (strong,nonatomic)UILabel *payOfWayLab;

//查看人
@property(nonatomic,strong)UIImageView *eyeIcon;
@property(nonatomic,strong)UILabel *numLab;



@end
