//
//  PhoneModifyViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PhoneModifyViewController.h"

@interface PhoneModifyViewController ()<UITextFieldDelegate>

@property (strong,nonatomic) UILabel *phoneNo;

@property (strong,nonatomic) UITextField *phoneField;
@property (strong,nonatomic) UITextField *commitField;
@property (strong,nonatomic) UIButton *commitBtn;
@property (strong,nonatomic) UIButton *finishBtn;

@end

@implementation PhoneModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"修改手机号";
    self.view.backgroundColor = whiteC;
    [self initWithFrame];
}

#pragma mark /--------布局--------/
-(void)initWithFrame{
    UILabel *bindNoLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.view];
    bindNoLab.text = @"当前绑定手机号";
    [bindNoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(SCREEN_WIDTH*0.23);
    }];
    
    self.phoneNo = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    self.phoneNo.text = @"186****5323";
    [self.phoneNo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(bindNoLab.mas_bottom).offset(topToMargin);
    }];
    
    UILabel *phoneLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    phoneLab.text = @"手机号";
    [phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(40);
        make.top.equalTo(self.phoneNo.mas_bottom).offset(SCREEN_WIDTH*0.13);
    }];
    
    self.phoneField = [UITextField new];
    self.phoneField.placeholder = @"请输入新手机号";
    self.phoneField.font = [UIFont systemFontOfSize:MTitleSize];
    [self.view addSubview:self.phoneField];
    [self.phoneField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLab.mas_right).offset(topToMargin);
        make.centerY.equalTo(phoneLab);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-150, 30));
    }];
    
    UIView *fv = [UIView new];
    fv.backgroundColor = grayC;
    [self.view addSubview:fv];
    [fv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(topToMargin);
        make.top.equalTo(phoneLab.mas_bottom).offset(topToMargin);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
    }];
    
    UILabel *commitLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    commitLab.text = @"验证码";
    [commitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(phoneLab.mas_left);
        make.top.equalTo(fv.mas_bottom).offset(topToMargin);
    }];
    
    self.commitField = [UITextField new];
    self.commitField.placeholder = @"请输入验证码";
    self.commitField.font = [UIFont systemFontOfSize:MTitleSize];
    self.commitField.delegate = self;
    [self.view addSubview:self.commitField];
    [self.commitField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(commitLab.mas_right).offset(topToMargin);
        make.centerY.equalTo(commitLab);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-240, 30));
    }];
    
    self.commitBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.commitBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [self.commitBtn setTitleColor:blueC forState:UIControlStateNormal];
    self.commitBtn.titleLabel.font = [UIFont systemFontOfSize:subTitleSize];
    self.commitBtn.layer.borderColor = blueC.CGColor;
    self.commitBtn.layer.borderWidth = 1;
    self.commitBtn.layer.cornerRadius = 13;
    self.commitBtn.tag = 23;
    [self.commitBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.commitBtn];
    [self.commitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(commitLab);
        make.right.equalTo(fv).offset(-topToMargin);
        make.size.mas_equalTo(CGSizeMake(90, 26));
    }];
    
    UIView *vv = [UIView new];
    vv.backgroundColor = grayC;
    [self.view addSubview:vv];
    [vv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(fv.mas_left);
        make.top.equalTo(commitLab.mas_bottom).offset(topToMargin);
        make.size.mas_equalTo(fv);
    }];
    
    self.finishBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.finishBtn.backgroundColor = blueC;
    [self.finishBtn setTitle:@"确定更改手机号码" forState:UIControlStateNormal];
    [self.finishBtn setTitleColor:whiteC forState:UIControlStateNormal];
    self.finishBtn.layer.cornerRadius = 4;
    [self.finishBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.finishBtn.tag = 24;
    [self.view addSubview:self.finishBtn];
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vv);
        make.top.equalTo(vv).offset(SCREEN_WIDTH*0.15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
    }];
}

-(void)btnClick:(UIButton *)btn{
    if (btn.tag==23) {
        HWLog(@"23");
    }
    else{
        HWLog(@"24");
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
