//
//  OwnerMainTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "OwnerMainTableViewCell.h"

@implementation OwnerMainTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        //标题label
        self.titleLabel = [UILabel labelWithTextColor:MainColor FontSize:21 Sview:self];
        self.titleLabel.text = @"使用帐号和密码登录";
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.mas_equalTo(SCREEN_WIDTH*0.13);
        }];
        
        //账号
        self.accoutLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.accoutLabel.text = @"帐号";
        [self.accoutLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLabel.mas_left).offset(-leftToMargin);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(SCREEN_WIDTH*0.13);
        }];
        
        //账号输入
        self.accoutField = [UITextField new];
        self.accoutField.placeholder = @"手机号码/邮箱地址";
        self.accoutField.textColor = SecondTitleColor;
        self.accoutField.font = [UIFont systemFontOfSize:MTitleSize];
        self.accoutField.keyboardType = UIKeyboardTypeEmailAddress;
        [self addSubview:self.accoutField];
        [self.accoutField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.accoutLabel);
            make.left.equalTo(self.accoutLabel.mas_right).offset(20);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.6, 30));
        }];
        
        //第一条横线
        UIView *firstView = [UIView new];
        firstView.backgroundColor = grayC;
        [self addSubview:firstView];
        [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-20, 1));
            make.top.equalTo(self.accoutLabel.mas_bottom).offset(topToMargin);
            make.left.mas_equalTo(leftToMargin);
        }];
        
        //密码
        self.pwdLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.pwdLabel.text = @"密码";
        [self.pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(firstView.mas_bottom).offset(topToMargin);
            make.centerX.equalTo(self.accoutLabel);
            
        }];
        
        //密码输入
        self.pwdField = [[UITextField alloc]init];
        self.pwdField.placeholder = @"请输入密码";
        self.pwdField.font = [UIFont systemFontOfSize:MTitleSize];
        self.pwdField.secureTextEntry = YES;
        [self addSubview:self.pwdField];
        [self.pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.pwdLabel);
            make.left.equalTo(self.accoutField);
            make.size.mas_equalTo(self.accoutField);
        }];
        
        //第二条横线
        UIView *secondView = [[UIView alloc]init];
        secondView.backgroundColor = grayC;
        [self addSubview:secondView];
        [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(firstView);
            make.top.equalTo(self.pwdLabel.mas_bottom).offset(topToMargin);
            make.left.equalTo(firstView);
        }];
        
        //登录按钮
        self.loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.loginBtn.layer.cornerRadius = 4;
        self.loginBtn.backgroundColor = blueC;
        [self.loginBtn setTitleColor:whiteC forState:UIControlStateNormal];
        [self.loginBtn setTitle:@"登     录" forState:UIControlStateNormal];
        [self addSubview:self.loginBtn];
        [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(secondView.mas_bottom).offset(25);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-40, formBtnHeight));
        }];
        
        //找回密码
        self.retrievePwdBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.retrievePwdBtn setTitle:@"找回密码" forState:UIControlStateNormal];
        [self.retrievePwdBtn setTitleColor:HWColor(91, 85, 132) forState:UIControlStateNormal];
        self.retrievePwdBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
        [self addSubview:self.retrievePwdBtn];
        [self.retrievePwdBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.loginBtn.mas_bottom).offset(topToMargin);
            make.right.equalTo(self.mas_centerX).offset(-leftToMargin);
        }];
        
        //用户注册
        self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.registerBtn setTitle:@"用户注册" forState:UIControlStateNormal];
        [self.registerBtn setTitleColor:HWColor(91, 85, 132) forState:UIControlStateNormal];
        self.registerBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
        [self addSubview:self.registerBtn];
        [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.loginBtn.mas_bottom).offset(topToMargin);
            make.left.equalTo(self.mas_centerX).offset(leftToMargin);
        }];
        
    }
    return self;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endEditing:YES];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
