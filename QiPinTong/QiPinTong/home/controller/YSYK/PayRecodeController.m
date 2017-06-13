//
//  PayRecodeController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/31.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PayRecodeController.h"
#import "TipUserController.h"
@interface PayRecodeController ()

@end

@implementation PayRecodeController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatBackView];
    
    
    
    
}

-(void)creatBackView
{
    //背景图
    UIImageView *backImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT)];
    backImg.image = [UIImage imageNamed:@"backImage_pay.jpg"];
//    [backImg sizeToFit];
    backImg.userInteractionEnabled = YES;
    [self.view addSubview:backImg];
    
    
    //提示语
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectZero andTextColor:whiteC andTextFont:MTitleSize+4];
    lab.backgroundColor = clearC;
    lab.text = @"欢迎使用企聘通支付";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.font = [UIFont systemFontOfSize:MTitleSize +4 weight:UIFontWeightHeavy];
    
    [backImg addSubview:lab];
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
      
        make.centerX.equalTo(backImg);
        make.top.mas_equalTo(60);
        make.width.mas_equalTo(SCREEN_HEIGHT-20);
        make.height.mas_equalTo(30);
    }];
    
    //二维码白色框
    
    UIView *vo = [UIView new];
    vo.backgroundColor = whiteC;
    
    vo.layer.cornerRadius = 4.0f;
    vo.layer.masksToBounds = YES;
    vo.layer.borderColor = [blueC CGColor];
    vo.layer.borderWidth = 1.0f;
    [backImg addSubview:vo];
    
    [vo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(backImg);
        make.width.mas_equalTo(SCREEN_WIDTH-20);
        make.top.equalTo(lab).with.mas_offset(80);
        make.height.mas_equalTo(SCREEN_WIDTH);
        
    }];
    
    UIView *vi = [UIView new];
    
    vi.backgroundColor = grayC;
    vi.layer.cornerRadius = 4.0f;
    vi.layer.masksToBounds = YES;
    
    [vo addSubview:vi];
    
    [vi mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(vo);
        make.width.equalTo(vo);
        make.top.equalTo(vo);
        make.height.mas_equalTo(55);
        
    }];
   
    
    UIImageView *image = [[UIImageView alloc]init];
    image.image = [UIImage imageNamed:@"give_tongbi"];
    image.backgroundColor = clearC;
    [vi addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.equalTo(vi).with.mas_offset(10);
        make.size.mas_equalTo(CGSizeMake(25, 25));
        make.centerY.equalTo(vi);
        
    }];
    
    UILabel *labT = [[UILabel alloc]initWithFrame:CGRectZero andTextColor:blueC andTextFont:MTitleSize];
    labT.backgroundColor = clearC;
    labT.text = @"二维码收款";
    [vi addSubview:labT];
    
    [labT mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.left.mas_offset(38);
        
        make.centerY.equalTo(vi);
        
        make.width.mas_equalTo(SCREEN_WIDTH/2);
        
        make.height.equalTo(vi);
    }];
    
    
    UILabel *labF = [[UILabel alloc]initWithFrame:CGRectZero andTextColor:SecondTitleColor andTextFont:MTitleSize];
    
    labF.text = @"企聘通扫一扫，向我付钱";
    
    labF.textAlignment = NSTextAlignmentCenter;
    
    [vo addSubview:labF];
    
    [labF mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(vo);
        make.width.equalTo(vo);
        
        make.top.equalTo(vi.mas_bottom).offset(40);
        
        make.height.mas_equalTo(20);
        
    }];

//    二维码

    UIImageView *re_codeImg = [[UIImageView alloc]init];
    
//    [re_codeImg sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"Qpt_icon"]];
    re_codeImg.image = [UIImage imageNamed:@"Qpt_icon"];
    [vo addSubview:re_codeImg];
    
    [re_codeImg mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(vo);
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.48, SCREEN_WIDTH*0.48));
        
        make.top.equalTo(labF.mas_bottom).offset(40);
        
        
    }];

    UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [checkBtn setTitleColor:whiteC forState:UIControlStateNormal];
    checkBtn.backgroundColor = clearC;
    [checkBtn setTitle:@"查看钱包" forState:UIControlStateNormal];
    
    [checkBtn addTarget:self action:@selector(checkClick) forControlEvents:UIControlEventTouchUpInside];
    
    [backImg addSubview:checkBtn];
    
    [checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(backImg);
        
        make.bottom.mas_equalTo(-25);
        
        make.size.mas_equalTo(CGSizeMake(80, 35));
        
        
    }];
   
    
}

#pragma mark ---查看钱包
-(void)checkClick
{
    [LWAlertView shoWithMessage:@"查看钱包"];
    
    WalletViewController *walletVC = [WalletViewController new];
    [self.navigationController pushViewController:walletVC animated:YES];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
