//
//  DiscoverTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/4.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoverTableViewCell : UITableViewCell

//图像
@property (strong,nonatomic) UIImageView *icon;

//标题
@property (strong,nonatomic) UILabel *title;

//箭头
@property (strong,nonatomic) UIImageView *arrowIcon;

//箭头前展示文本
@property (strong,nonatomic) UILabel *showLab;



@end
