//
//  RetrievePwdTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "RetrievePwdTableViewCell.h"

@implementation RetrievePwdTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        //标题label
        self.titleLabel = [UILabel labelWithTextColor:MainColor FontSize:21 Sview:self];
        self.titleLabel.text = @"找回密码";
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self).offset(SCREEN_WIDTH*0.13);
        }];
        
        //手机号
        self.phoneLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.phoneLabel.text = @"手机号";
        [self.phoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.top.equalTo(self.titleLabel.mas_bottom).offset(SCREEN_WIDTH*0.13);
        }];
        
        //手机号输入
        self.phoneField = [UITextField new];
        self.phoneField.textColor = SecondTitleColor;
        self.phoneField.font = [UIFont systemFontOfSize:MTitleSize];
        self.phoneField.placeholder = @"请输入手机号";
        self.phoneField.keyboardType = UIKeyboardTypeEmailAddress;
        [self addSubview:self.phoneField];
        [self.phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.phoneLabel);
            make.left.equalTo(self.phoneLabel.mas_right).offset(20);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.6, 30));
        }];
        
        //第一条横线
        UIView *firstView = [UIView new];
        firstView.backgroundColor = grayC;
        [self addSubview:firstView];
        [firstView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-20, 1));
            make.top.equalTo(self.phoneLabel.mas_bottom).offset(topToMargin);
            make.left.mas_equalTo(leftToMargin);
        }];
        
        //验证码
        self.commitLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.commitLabel.text = @"验证码";
        [self.commitLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(firstView.mas_bottom).offset(topToMargin);
            make.left.equalTo(self.phoneLabel);
        }];
        
        //验证码输入
        self.commitField = [UITextField new];
        self.commitField.font = [UIFont systemFontOfSize:MTitleSize];
        self.commitField.placeholder = @"请输入验证码";
        [self addSubview:self.commitField];
        [self.commitField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.commitLabel);
            make.left.equalTo(self.commitLabel.mas_right).offset(20);
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
        
        //第二条横线
        UIView *secondView = [UIView new];
        secondView.backgroundColor = grayC;
        [self addSubview:secondView];
        [secondView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(firstView);
            make.top.equalTo(self.commitLabel.mas_bottom).offset(topToMargin);
            make.left.equalTo(firstView);
        }];
        
        //下一步按钮
        self.nextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.nextBtn.layer.cornerRadius = 4;
        self.nextBtn.backgroundColor = blueC;
        [self.nextBtn setTitleColor:whiteC forState:UIControlStateNormal];
        [self.nextBtn setTitle:@"下一步" forState:UIControlStateNormal];
        [self addSubview:self.nextBtn];
        [self.nextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(secondView.mas_bottom).offset(30);
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
