//
//  CoinOpenViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/3.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "CoinOpenViewController.h"

@interface CoinOpenViewController ()

@property (strong,nonatomic) UIButton *openBtn;

@end

@implementation CoinOpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = whiteC;
    
    self.navigationItem.title = @"开通提现";
    
    [self initWithFrame];
}

-(void)initWithFrame{
    //币图标
    UIImageView *coinImg = [UIImageView new];
    coinImg.image = [UIImage imageNamed:@"coin_image"];
    [self.view addSubview:coinImg];
    [coinImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(SCREEN_WIDTH*0.1);
        make.size.mas_equalTo(SubImageSize);
    }];
    
    //标题
    UILabel *titleLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    titleLab.numberOfLines = 0;
    [titleLab setAttributedText:[self attributedString:@"你的账户余额不足100通币，请选择以下方式获得通币："]];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(coinImg.mas_bottom).offset(SCREEN_WIDTH*0.1);
        make.width.mas_equalTo(SCREEN_WIDTH-40);
    }];
    
    //A
    UILabel *ALab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self.view];
    ALab.numberOfLines = 0;
    [ALab setAttributedText:[self attributedString:@"A、通过“发现”的抢通币或发朋友动态打赏获得通币；（抢通币数量为2-5个；朋友动态好友打赏通币数量1-10个不等）"]];
    [ALab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(titleLab);
        make.top.equalTo(titleLab.mas_bottom).offset(SCREEN_WIDTH*0.1);
        make.width.equalTo(titleLab);
    }];
    
    //B
    UILabel *BLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self.view];
    BLab.numberOfLines = 0;
    [BLab setAttributedText:[self attributedString:@"B、通过“我”扫描二维码添加十位好友获得通币；（添加一个好友获得10个通币）"]];
    [BLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ALab);
        make.top.equalTo(ALab.mas_bottom).offset(SCREEN_WIDTH/12);
        make.width.equalTo(ALab);
    }];
    
    //开通按钮
    self.openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.openBtn setTitle:@"充值开通" forState:UIControlStateNormal];
    [self.openBtn setTitleColor:whiteC forState:UIControlStateNormal];
    self.openBtn.backgroundColor = orangeC;
    self.openBtn.layer.cornerRadius = 3;
    [self.openBtn addTarget:self action:@selector(openBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.openBtn];
    [self.openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.view);
        make.top.equalTo(BLab.mas_bottom).offset(SCREEN_WIDTH*0.13);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-40, formBtnHeight));
    }];
}

-(void)openBtnClick{
    HWLog(@"open");
    PayViewController *vc = [PayViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSMutableAttributedString *)attributedString:(NSString *)testString{
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:testString];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:10];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [testString length])];
    
    return attributedString;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
