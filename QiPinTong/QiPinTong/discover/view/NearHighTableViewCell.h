//
//  NearbyTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/3/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearHighTableViewCell : UITableViewCell

//图像
@property (strong,nonatomic) UIImageView *imgView;

//名称
@property (strong,nonatomic) UILabel *nameLab;


//职位
@property (strong,nonatomic) UILabel *postLab;

/*薪资*/
@property (strong,nonatomic) UILabel *salaryLab;

//学历
@property (strong,nonatomic) UIImageView *academicIcon;
@property (strong,nonatomic) UILabel *academicLab;
//经验
@property (strong,nonatomic) UIImageView *experIcon;
@property (strong,nonatomic) UILabel *experLab;


//地址
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLab;

//浏览
@property (strong,nonatomic) UIImageView *eyeIcon;
@property (strong,nonatomic) UILabel *eyeLab;



@end
