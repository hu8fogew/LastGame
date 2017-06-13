//
//  RegisterTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterTableViewCell : UITableViewCell

//标题
@property (strong,nonatomic) UILabel *titleLabel;

//类别
@property (strong,nonatomic) UILabel *classLabel;
@property (strong,nonatomic) UIButton *classBtn;

//手机号
@property (strong,nonatomic) UILabel *phoneLabel;
@property (strong,nonatomic) UITextField *phoneField;

//验证码
@property (strong,nonatomic) UILabel *commitLabel;
@property (strong,nonatomic) UITextField *commitField;
@property (strong,nonatomic) UIButton *commitBtn;

//密码
@property (strong,nonatomic) UILabel *pwdLabel;
@property (strong,nonatomic) UITextField *pwdField;

//重置密码
@property (strong,nonatomic) UILabel *resetLabel;
@property (strong,nonatomic) UITextField *resetField;

//注册
@property (strong,nonatomic) UIButton *registerBtn;

@end
