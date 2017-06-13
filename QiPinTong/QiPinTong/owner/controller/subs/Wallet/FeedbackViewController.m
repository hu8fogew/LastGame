//
//  FeedbackViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/31.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "FeedbackViewController.h"
#import "SGQRCode.h"

@interface FeedbackViewController ()

@end

@implementation FeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = whiteC;
    self.navigationItem.title = @"帮助与反馈";
    [self setupFrame];
}

-(void)setupFrame{
    UILabel *title = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    title.text = @"帮助与反馈";
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(leftToMargin);
        make.top.mas_equalTo(SCREEN_WIDTH*0.15);
    }];
    
    UIImageView *icon = [UIImageView new];
    icon.image = [UIImage imageNamed:@"feedback_icon"];
    [self.view addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(title);
        make.right.equalTo(title.mas_left).offset(-5);
        make.size.mas_equalTo(CGSizeMake(MTitleSize+5, MTitleSize+5));
    }];
    
    UILabel *sub = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+2 Sview:self.view];
    sub.text = @"企聘通助手开放";
    [sub mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(title.mas_bottom).offset(SCREEN_WIDTH*0.15);
        make.centerX.equalTo(self.view);
    }];
    UILabel *de = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+2 Sview:self.view];
    de.text = @"长按识别二维码联系客服";
    [de mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(sub.mas_bottom).offset(leftToMargin);
    }];
    
    // 1、借助UIImageView显示二维码
    UIImageView *codeView = [[UIImageView alloc] init];
    [self.view addSubview:codeView];
    [codeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(de.mas_bottom).offset(SCREEN_WIDTH*0.1);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.4, SCREEN_WIDTH*0.4));
    }];
    
    // 2、将最终合得的图片显示在UIImageView上
    codeView.image = [SGQRCodeTool SG_generateWithLogoQRCodeData:@"http://weixin.qipintong.com" logoImageName:@"codeLogo" logoScaleToSuperView:0.3];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
