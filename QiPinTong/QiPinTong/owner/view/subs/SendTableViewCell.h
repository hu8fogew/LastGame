//
//  SendTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/11.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SendTableViewCell : UITableViewCell

//图像
@property (strong,nonatomic) UIImageView *imgView;

//职位
@property (strong,nonatomic) UILabel *postLab;

//公司
@property (strong,nonatomic) UILabel *comLab;

//时间
@property (strong,nonatomic) UILabel *timeLab;

//薪资
@property (strong,nonatomic) UILabel *salaryLab;


@end
