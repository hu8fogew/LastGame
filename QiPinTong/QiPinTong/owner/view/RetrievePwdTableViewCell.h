//
//  RetrievePwdTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RetrievePwdTableViewCell : UITableViewCell

//标题
@property (strong,nonatomic) UILabel *titleLabel;

//手机号
@property (strong,nonatomic) UILabel *phoneLabel;
@property (strong,nonatomic) UITextField *phoneField;

//验证码
@property (strong,nonatomic) UILabel *commitLabel;
@property (strong,nonatomic) UITextField *commitField;
@property (strong,nonatomic) UIButton *commitBtn;

//下一步
@property (strong,nonatomic) UIButton *nextBtn;


@end
