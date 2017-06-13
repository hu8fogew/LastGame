//
//  RegisterTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "RegisterTableViewCell.h"

@implementation RegisterTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        //标题
        self.titleLabel = [UILabel labelWithTextColor:MainColor FontSize:21 Sview:self];
        self.titleLabel.text = @"会员注册";
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(SCREEN_WIDTH*0.13);
            make.centerX.equalTo(self);
        }];
        
        //类别
        self.classLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.classLabel.text = @"类    别";
        [self.classLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).offset(SCREEN_WIDTH*0.12);
            make.left.mas_equalTo(25);
        }];
        self.classBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.classBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
        [self.classBtn setTitleColor:MainColor forState:UIControlStateNormal];
        [self.classBtn setTitle:@"个人" forState:UIControlStateNormal];
        [self addSubview:self.classBtn];
        [self.classBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.classLabel.mas_right).offset(50);
            make.centerY.equalTo(self.classLabel);
        }];
        
        //横线
        UIView *firstView = [UIView new];
        firstView.backgroundColor = grayC;
        [self addSubview:firstView];
        [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.classLabel.mas_bottom).offset(topToMargin);
            make.left.mas_equalTo(leftToMargin);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-20, 1));
        }];
        
        //手机号
        self.phoneLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.phoneLabel.text = @"手机号";
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(firstView.mas_bottom).offset(topToMargin);
            make.left.equalTo(self.classLabel);
            
        }];
        self.phoneField = [UITextField new];
        self.phoneField.font = [UIFont systemFontOfSize:MTitleSize];
        self.phoneField.textColor = SecondTitleColor;
        self.phoneField.keyboardType = UIKeyboardTypePhonePad;
        [self addSubview:self.phoneField];
        [self.phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.phoneLabel.mas_right).offset(20);
            make.centerY.equalTo(self.phoneLabel);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.6, 30));
        }];
        
        //横线
        UIView *secondView = [UIView new];
        secondView.backgroundColor = grayC;
        [self addSubview:secondView];
        [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.phoneLabel.mas_bottom).offset(topToMargin);
            make.left.equalTo(firstView);
            make.size.mas_equalTo(firstView);
        }];
        
        //验证码
        self.commitLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.commitLabel.text = @"验证码";
        [self.commitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(secondView.mas_bottom).offset(topToMargin);
            make.left.equalTo(self.phoneLabel);
        }];
        self.commitField = [UITextField new];
        self.commitField.font = [UIFont systemFontOfSize:MTitleSize];
        self.commitField.textColor = SecondTitleColor;
        self.commitField.keyboardType = UIKeyboardTypePhonePad;
        [self addSubview:self.commitField];
        [self.commitField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.commitLabel);
            make.left.equalTo(self.commitLabel.mas_right).offset(20);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.4, 30));
        }];
        self.commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.commitBtn.backgroundColor = [UIColor darkGrayColor];
        self.commitBtn.titleLabel.font = [UIFont systemFontOfSize:12];
        self.commitBtn.layer.cornerRadius = 4;
        [self.commitBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.commitBtn setTitleColor:whiteC forState:UIControlStateNormal];
        [self addSubview:self.commitBtn];
        [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.commitLabel);
            make.right.equalTo(self).offset(-20);
            make.size.mas_equalTo(CGSizeMake(70, 25));
        }];
        
        //横线
        UIView *thirdView = [UIView new];
        thirdView.backgroundColor = grayC;
        [self addSubview:thirdView];
        [thirdView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.commitLabel.mas_bottom).offset(topToMargin);
            make.left.equalTo(firstView);
            make.size.mas_equalTo(firstView);
        }];
        
        //密码
        self.pwdLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.pwdLabel.text = @"密  码";
        [self.pwdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(thirdView.mas_bottom).offset(topToMargin);
            make.left.equalTo(self.commitLabel);
        }];
        UITextField *pwdField = [UITextField new];
        pwdField.font = [UIFont systemFontOfSize:MTitleSize];
        self.pwdField.textColor = SecondTitleColor;
        [self addSubview:pwdField];
        [pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.pwdLabel.mas_right).offset(20);
            make.centerY.equalTo(self.pwdLabel);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.6, 30));
            
        }];
        
        //横线
        UIView *fourthView = [UIView new];
        fourthView.backgroundColor = grayC;
        [self addSubview:fourthView];
        [fourthView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.pwdLabel.mas_bottom).offset(topToMargin);
            make.left.equalTo(firstView);
            make.size.mas_equalTo(firstView);
        }];
        
        //重置密码
        self.resetLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.resetLabel.text = @"重置密码";
        [self.resetLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fourthView.mas_bottom).offset(topToMargin);
            make.left.equalTo(self.pwdLabel);
        }];
        self.resetField = [UITextField new];
        self.resetField.font = [UIFont systemFontOfSize:MTitleSize];
        self.resetField.textColor = SecondTitleColor;
        [self addSubview:self.resetField];
        [self.resetField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.resetLabel.mas_right).offset(20);
            make.centerY.equalTo(self.resetLabel);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.6, 30));
            
        }];
        
        //横线
        UIView *fifthView = [UIView new];
        fifthView.backgroundColor = grayC;
        [self addSubview:fifthView];
        [fifthView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.resetLabel.mas_bottom).offset(topToMargin);
            make.left.equalTo(firstView);
            make.size.mas_equalTo(firstView);
        }];
        
        //注册按钮
        self.registerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.registerBtn.backgroundColor = blueC;
        self.registerBtn.layer.cornerRadius = 4;
        [self.registerBtn setTitle:@"注  册" forState:UIControlStateNormal];
        [self.registerBtn setTitleColor:whiteC forState:UIControlStateNormal];
        [self addSubview:self.registerBtn];
        [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fifthView.mas_bottom).offset(topToMargin);
            make.centerX.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-40, formBtnHeight));
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
