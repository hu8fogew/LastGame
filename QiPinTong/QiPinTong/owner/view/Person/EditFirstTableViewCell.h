//
//  EditFirstTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/2/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditFirstTableViewCell : UITableViewCell

/*图像*/
@property (strong,nonatomic) UIImageView *imgView;

/*姓名*/
@property (strong,nonatomic) UILabel *nameLabel;


//个人
@property (strong,nonatomic) UIImageView *arrowIcon;

/*性别*/
@property (strong,nonatomic) UIImageView *sexImage;

/*更换图像*/
@property (strong,nonatomic) UILabel *changeLab;

@end
