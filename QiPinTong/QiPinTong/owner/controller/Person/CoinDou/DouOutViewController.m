//
//  DouExpendViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/4/12.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "DouOutViewController.h"

@interface DouOutViewController ()

@property (strong,nonatomic) UIView *wView;

@property (strong,nonatomic) UITextField *coinField;

@property (strong,nonatomic) UIButton *confirmBtn;

@end

@implementation DouOutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"币斗收益";
    self.view.backgroundColor = grayC;
    
    [self initWithFrame];
}

//布局
-(void)initWithFrame{
    
    //币斗通币结余
    UILabel *tLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.view];
    tLab.text = @"币斗通币结余为0个";
    [tLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftToMargin);
        make.top.mas_equalTo(20);
    }];
    
    //白色view
    self.wView = [UIView new];
    self.wView.backgroundColor = whiteC;
    [self.view addSubview:self.wView];
    [self.wView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(tLab.mas_bottom).offset(20);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*0.3));
    }];
    
    //转出通币数量
    UILabel *coinNo = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.wView];
    coinNo.text = @"转出通币数量";
    [coinNo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tLab);
        make.top.mas_equalTo(25);
    }];
    
    //币斗图标
    UIImageView *coinImg = [UIImageView new];
    coinImg.image = [UIImage imageNamed:@"coin_image"];
    [self.wView addSubview:coinImg];
    [coinImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(topToMargin);
        make.bottom.mas_equalTo(-20);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    //币斗数量输入
    self.coinField = [UITextField new];
    [self.coinField becomeFirstResponder];
    self.coinField.tintColor = MainColor;
    self.coinField.keyboardType = UIKeyboardTypeNumberPad;
    self.coinField.font = [UIFont systemFontOfSize:30];
    [self.wView addSubview:self.coinField];
    [self.coinField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(coinImg.mas_right).offset(leftToMargin);
        make.centerY.equalTo(coinImg);
        make.width.mas_equalTo(SCREEN_WIDTH-80);
    }];
    
    //确定按钮
    self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.confirmBtn setTitleColor:whiteC forState:UIControlStateNormal];
    self.confirmBtn.backgroundColor = blueC;
    self.confirmBtn.layer.cornerRadius = 3;
    [self.confirmBtn addTarget:self action:@selector(confirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(self.wView.mas_bottom).offset(SCREEN_WIDTH*0.15);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-40, formBtnHeight));
    }];
    
}


-(void)confirmBtnClick{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
