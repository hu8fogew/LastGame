//
//  TAddDetailTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/5/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TAddDetailTableViewCell : UITableViewCell

//图像
@property (strong,nonatomic) UIImageView *imgView;

//名称
@property (strong,nonatomic) UILabel *titleLab;

//地址
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLab;

//时间
@property (strong,nonatomic) UIImageView *dateIcon;
@property (strong,nonatomic) UILabel *dateLab;

////
@property (strong,nonatomic) UILabel *nameLab;

//
@property (strong,nonatomic) UILabel *showLab;


-(instancetype)initWithFrame:(CGRect)frame isSelect:(BOOL)isSelect;

@end
