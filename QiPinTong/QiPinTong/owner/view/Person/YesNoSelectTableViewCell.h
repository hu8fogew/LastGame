//
//  YesNoSelectTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/3/21.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class LQXSwitch;

@interface YesNoSelectTableViewCell : UITableViewCell

@property (strong,nonatomic) UILabel *titleLab;

/*是否按钮*/
@property (strong,nonatomic) UIButton *yesBtn;
@property (strong,nonatomic) UIButton *noBtn;


@end
