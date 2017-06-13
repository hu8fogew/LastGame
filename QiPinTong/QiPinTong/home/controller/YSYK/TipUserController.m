//
//  TipUserController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/6/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TipUserController.h"

@interface TipUserController ()

@end

@implementation TipUserController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatView];
    
}




-(void)creatView
{
    //宣传图片
    UIImageView *image = [[UIImageView alloc]init];
    
    image.image = [UIImage imageNamed:@"tip_for_user"];
    
    [self.view addSubview:image];
    
    [image mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.centerX.equalTo(self.view);
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT*4/7));
    }];
    
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectZero andTextColor:deepGrayColor andTextFont:MTitleSize+1];
    
    lab.numberOfLines = 3;
    
    
    
    lab.text = @"企聘通求职招聘更轻松！实现信息“四通”交互模式，精准的信息匹配限制，真正地开启了减法模式————非同凡响的轻松！";
    
    
    lab.font = [UIFont systemFontOfSize:MTitleSize+1 weight:UIFontWeightHeavy];
    
    [self.view addSubview:lab];
    
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self.view);
        make.top.equalTo(image.mas_bottom).offset(30);
        
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 80));
        
    }];
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:@"立即激活" forState:UIControlStateNormal];
    [btn setTitleColor:whiteC forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize+2 weight:UIFontWeightHeavy];
    btn.backgroundColor = orangeC;
    btn.layer.cornerRadius = 4.0f;
    btn.layer.masksToBounds = YES;
    
    
    [btn addTarget:self action:@selector(openPayClick) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
    
        make.centerX.equalTo(self.view);
        
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60, 55));
        
        make.top.equalTo(lab.mas_bottom).offset(30);
        
        
    }];
    
    
    
    
    
    
    
    
}


-(void)openPayClick
{
//    [LWAlertView shoWithMessage:@"立即激活"];
    [self alertViewMessage:@"您的账户余额为0，请先充值！"];
    
}

-(void)okDeleteClick
{
    [self hideCurrentView];
    [LWAlertView shoWithMessage:@"充值"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
