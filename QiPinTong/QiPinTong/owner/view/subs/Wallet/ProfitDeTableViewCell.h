//
//  ProfitDeTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfitDeTableViewCell : UITableViewCell

//标题
@property (strong,nonatomic) UILabel *titleLab;

//金额
@property (strong,nonatomic) UILabel *amountLab;

//时间
@property (strong,nonatomic) UILabel *timeLab;

@end
