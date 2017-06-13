//
//  YCYMFormTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/16.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCYMFormTableViewCell : UITableViewCell

/*标题*/
@property (strong,nonatomic) UILabel *titleLabel;

/*填写、选择显示*/
@property (strong,nonatomic) UILabel *selectLabel;

/*箭头*/
@property (strong,nonatomic) UIImageView *arrowIcon;

/*两个请选择按钮*/
@property (strong,nonatomic) UILabel *leftLab;
@property (strong,nonatomic) UILabel *rightLab;
@property (strong,nonatomic) UILabel *lab;

//退出
@property (strong,nonatomic) UILabel *exitLab;


/////岗位调整中
@property (strong,nonatomic) UILabel *showLab;


/////排行榜中
@property (strong,nonatomic) UILabel *cityLab;




@property (strong,nonatomic) UIImageView *imgView;


@end
