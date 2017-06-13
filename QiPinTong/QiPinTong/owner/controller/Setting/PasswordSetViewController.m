//
//  PasswordSetViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PasswordSetViewController.h"

@interface PasswordSetViewController ()

@property (strong,nonatomic) UITextField *pwdField;
@property (strong,nonatomic) UITextField *commitField;
@property (strong,nonatomic) UIButton *finishBtn;

@end

@implementation PasswordSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"设置密码";
    self.view.backgroundColor = whiteC;
    [self initWithFrame];
}

#pragma mark /--------布局--------/
-(void)initWithFrame{
    UILabel *pwdLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    pwdLab.text = @"设置密码";
    [pwdLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(40);
        make.top.mas_equalTo(SCREEN_WIDTH*0.2);
    }];
    
    self.pwdField = [UITextField new];
    self.pwdField.placeholder = @"请输入密码";
    self.pwdField.font = [UIFont systemFontOfSize:MTitleSize];
    [self.view addSubview:self.pwdField];
    [self.pwdField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pwdLab.mas_right).offset(topToMargin);
        make.centerY.equalTo(pwdLab);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-150, 30));
    }];
    
    UIView *fv = [UIView new];
    fv.backgroundColor = grayC;
    [self.view addSubview:fv];
    [fv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(topToMargin);
        make.top.equalTo(pwdLab.mas_bottom).offset(topToMargin);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
    }];
    
    UILabel *commitLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    commitLab.text = @"确认密码";
    [commitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(pwdLab.mas_left);
        make.top.equalTo(fv.mas_bottom).offset(topToMargin);
    }];
    
    self.commitField = [UITextField new];
    self.commitField.placeholder = @"请确认密码";
    self.commitField.font = [UIFont systemFontOfSize:MTitleSize];
    [self.view addSubview:self.commitField];
    [self.commitField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(commitLab.mas_right).offset(topToMargin);
        make.centerY.equalTo(commitLab);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-240, 30));
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
        make.top.equalTo(vv).offset(SCREEN_WIDTH*0.13);
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
