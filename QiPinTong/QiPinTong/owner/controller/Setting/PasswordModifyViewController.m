//
//  PasswordModifyViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PasswordModifyViewController.h"

@interface PasswordModifyViewController ()

@property (strong,nonatomic) UITextField *oPwdField;
@property (strong,nonatomic) UITextField *nPwdField;
@property (strong,nonatomic) UITextField *commitField;
@property (strong,nonatomic) UIButton *finishBtn;

@end

@implementation PasswordModifyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设置密码";
    self.view.backgroundColor = whiteC;
    [self initWithFrame];
}

#pragma mark /--------布局--------/
-(void)initWithFrame{
    UILabel *oPwdLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    oPwdLab.text = @"设置密码";
    [oPwdLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(SCREEN_WIDTH*0.23);
    }];
    
    self.oPwdField = [UITextField new];
    self.oPwdField.placeholder = @"请输入旧密码";
    self.oPwdField.font = [UIFont systemFontOfSize:MTitleSize];
    [self.view addSubview:self.oPwdField];
    [self.oPwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oPwdLab.mas_right).offset(topToMargin*2);
        make.centerY.equalTo(oPwdLab);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-150, 30));
    }];
    
    UIView *fv = [UIView new];
    fv.backgroundColor = grayC;
    [self.view addSubview:fv];
    [fv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.top.equalTo(oPwdLab.mas_bottom).offset(topToMargin);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
    }];
    
    UILabel *nPwdLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    nPwdLab.text = @"新密码";
    [nPwdLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(oPwdLab);
        make.top.equalTo(fv.mas_bottom).offset(topToMargin);
    }];
    
    self.nPwdField = [UITextField new];
    self.nPwdField.placeholder = @"设置新密码";
    self.nPwdField.font = [UIFont systemFontOfSize:MTitleSize];
    [self.view addSubview:self.nPwdField];
    [self.nPwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.oPwdField);
        make.centerY.equalTo(nPwdLab);
        make.size.equalTo(self.oPwdField);
    }];
    
    UIView *sv = [UIView new];
    sv.backgroundColor = grayC;
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(fv.mas_left);
        make.top.equalTo(nPwdLab.mas_bottom).offset(topToMargin);
        make.size.mas_equalTo(fv);
    }];
    
    UILabel *commitLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    commitLab.text = @"确认新密码";
    [commitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(nPwdLab.mas_left);
        make.top.equalTo(sv.mas_bottom).offset(topToMargin);
    }];
    
    self.commitField = [UITextField new];
    self.commitField.placeholder = @"请确认新密码";
    self.commitField.font = [UIFont systemFontOfSize:MTitleSize];
    [self.view addSubview:self.commitField];
    [self.commitField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.oPwdField);
        make.centerY.equalTo(commitLab);
        make.size.mas_equalTo(self.oPwdField);
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
    [self.finishBtn setTitle:@"完成" forState:UIControlStateNormal];
    [self.finishBtn setTitleColor:whiteC forState:UIControlStateNormal];
    self.finishBtn.layer.cornerRadius = 4;
    [self.finishBtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.finishBtn];
    [self.finishBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(vv);
        make.top.equalTo(vv).offset(SCREEN_WIDTH*0.15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
    }];
}

-(void)btnClick{
    HWLog(@"23");
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
