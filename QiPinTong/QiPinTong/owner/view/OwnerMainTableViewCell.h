//
//  OwnerMainTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OwnerMainTableViewCell : UITableViewCell

//标题
@property (strong,nonatomic) UILabel *titleLabel;

//账号
@property (strong,nonatomic) UILabel *accoutLabel;
@property (strong,nonatomic) UITextField *accoutField;

//密码
@property (strong,nonatomic) UILabel *pwdLabel;
@property (strong,nonatomic) UITextField *pwdField;

//登录
@property (strong,nonatomic) UIButton *loginBtn;

//找回密码
@property (strong,nonatomic) UIButton *retrievePwdBtn;

//用户注册
@property (strong,nonatomic) UIButton *registerBtn;


@end
