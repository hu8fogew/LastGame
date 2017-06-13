//
//  TalentGangTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/5/31.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TalentGangTableViewCell : UITableViewCell
//图像
@property (strong,nonatomic) UIImageView *imgView;

//姓名
@property (strong,nonatomic) UILabel *nameLab;

//性别
@property (strong,nonatomic) UIImageView *sexIcon;

//地址
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLab;

//共享按钮
@property (strong,nonatomic) UIButton *shareBtn;

//数量
@property (strong,nonatomic) UIImageView *numIcon;
@property (strong,nonatomic) UILabel *numLab;



////
@property (strong,nonatomic) UILabel *didShareLab;
@property (strong,nonatomic) UILabel *shareNoLab;

@end
