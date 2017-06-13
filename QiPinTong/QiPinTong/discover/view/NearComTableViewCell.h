//
//  NearComTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/5/2.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NearComTableViewCell : UITableViewCell

//图像
@property (strong,nonatomic) UIImageView *imgView;

//名称
@property (strong,nonatomic) UILabel *nameLab;


//行业
@property (strong,nonatomic) UILabel *industryLab;


//职位
@property (strong,nonatomic) UILabel *jobLab;
@property (strong,nonatomic) NSString *moreStr;


//地址
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLab;

//浏览
@property (strong,nonatomic) UIImageView *eyeIcon;
@property (strong,nonatomic) UILabel *eyeLab;

@end
