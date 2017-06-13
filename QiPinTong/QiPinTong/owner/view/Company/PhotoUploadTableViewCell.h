//
//  PhotoUploadTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/4/8.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoUploadTableViewCell : UITableViewCell

//title
@property (strong,nonatomic) UILabel *titleLab;

//图像
@property (strong,nonatomic) UIImageView *imgView;

//箭头
@property (strong,nonatomic) UIImageView *arrowIcon;

@end
