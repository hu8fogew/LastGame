//
//  PayCompleteViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/6/3.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PayCompleteViewController.h"
@class PayView;
@interface PayCompleteViewController ()

@end

@implementation PayCompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"支付";
    self.view.backgroundColor = whiteC;
    
    [self setupFrame];
}

-(void)setupFrame{
    UIImageView *completeIcon = [UIImageView new];
    completeIcon.image = [UIImage imageNamed:@"ico_check_select"];
    [self.view addSubview:completeIcon];
    [completeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(SCREEN_WIDTH*0.16);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.13, SCREEN_WIDTH*0.13));
    }];
    
    UILabel *successLab = [UILabel labelWithTextColor:blueC FontSize:MTitleSize+2 Sview:self.view];
    successLab.text = @"支付成功";
    [successLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(completeIcon);
        make.top.equalTo(completeIcon.mas_bottom).offset(topToMargin);
    }];
    
    ////
    UILabel *amountLab = [UILabel labelWithTextColor:MainColor FontSize:40 Sview:self.view];
    amountLab.text = self.amountStr;
    [amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(completeIcon);
        make.top.equalTo(successLab.mas_bottom).offset(25);
    }];
    UILabel *yuanLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+8 Sview:self.view];
    yuanLab.text = @"¥";
    [yuanLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(amountLab);
        make.right.equalTo(amountLab.mas_left).offset(-3);
    }];
    
    UIView *fv = [UIView new];
    fv.backgroundColor = grayC;
    [self.view addSubview:fv];
    [fv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(amountLab.mas_bottom).offset(SCREEN_WIDTH*0.13);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-70, 1));
    }];
    
    UILabel *personLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.view];
    personLab.text = @"收款人";
    [personLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(fv);
        make.top.equalTo(fv).offset(30);
    }];
    
    ////
    UILabel *titleLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.view];
    titleLab.text = self.titleStr;
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(personLab);
        make.right.equalTo(fv);
    }];
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = self.image;
    [self.view addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(titleLab.mas_left).offset(-5);
        make.centerY.equalTo(titleLab);
        make.size.mas_equalTo(CGSizeMake(DeImageSize.width*0.6, DeImageSize.height*0.6));
    }];
    
    UIButton *completeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [completeBtn setTitle:@"完成" forState:UIControlStateNormal];
    [completeBtn setTitleColor:blueC forState:UIControlStateNormal];
    completeBtn.layer.borderColor = blueC.CGColor;
    completeBtn.layer.borderWidth = 1;
    completeBtn.layer.masksToBounds = YES;
    completeBtn.layer.cornerRadius = 3;
    [completeBtn addTarget:self action:@selector(completeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:completeBtn];
    [completeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.mas_equalTo(-SCREEN_WIDTH*0.18);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.45, 33));
    }];
}

-(void)completeBtnClick{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


@end
