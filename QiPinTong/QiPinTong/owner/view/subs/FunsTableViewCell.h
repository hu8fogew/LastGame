//
//  FunsTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/3/30.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FunsTableViewCell : UITableViewCell

//图像
@property (strong,nonatomic) UIImageView *imgView;

//姓名
@property (strong,nonatomic) UILabel *nameLab;

//地址
@property (strong,nonatomic) UILabel *addressLab;


//添加按钮
@property (strong,nonatomic) UIButton *addBtn;



@end
