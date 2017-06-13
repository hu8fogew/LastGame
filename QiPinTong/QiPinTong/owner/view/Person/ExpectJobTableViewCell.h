//
//  ExpectJobTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/2/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ExpectJobTableViewCell : UITableViewCell

//地址
@property (strong,nonatomic) UILabel *addressLabel;

//职位
@property (strong,nonatomic) UILabel *postLabel;

//薪资
@property (strong,nonatomic) UILabel *salaryLabel;

//行业
@property (strong,nonatomic) UILabel *industryLabel;

@end
