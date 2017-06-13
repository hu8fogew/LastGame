//
//  SendCoinViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/1/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SendCoinViewController.h"

@interface SendCoinViewController ()<UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITextField *coinField;
@property (strong,nonatomic) UIButton *zoneBtn;
@property (strong,nonatomic) UIButton *sendBtn;

@end

@implementation SendCoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发通币";
    self.view.backgroundColor = grayC;
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;

    [self setupFrame];
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}


-(void)setupFrame{
    ////
    UIView *fView = [[UIView alloc]initWithFrame:CGRectMake(topToMargin, SCREEN_WIDTH*0.13, SCREEN_WIDTH-30, 40)];
    fView.backgroundColor = whiteC;
    fView.layer.masksToBounds = YES;
    fView.layer.cornerRadius = 4;
    [self.view addSubview:fView];
    
    UILabel *coinLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:fView];
    coinLabel.text = @"通币个数";
    [coinLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftToMargin);
        make.centerY.equalTo(fView);
    }];
    UILabel *coinNumLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:fView];
    coinNumLabel.text = @"个";
    [coinNumLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-leftToMargin);
        make.centerY.equalTo(fView);
    }];
    self.coinField = [UITextField new];
    self.coinField.placeholder = @"填写个数";
    self.coinField.textAlignment = NSTextAlignmentRight;
    self.coinField.keyboardType = UIKeyboardTypeNumberPad;
    [fView addSubview:self.coinField];
    [self.coinField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(coinNumLabel.mas_left).offset(-leftToMargin);
        make.centerY.equalTo(coinNumLabel);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    /////
    UIView *tView = [[UIView alloc]initWithFrame:CGRectMake(topToMargin, fView.botoom+30, SCREEN_WIDTH-30, 40)];
    tView.backgroundColor = whiteC;
    tView.layer.masksToBounds = YES;
    tView.layer.cornerRadius = 5;
    [self.view addSubview:tView];
    UILabel *zoneLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:tView];
    zoneLabel.text = @"区域";
    [zoneLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(coinLabel);
        make.centerY.equalTo(tView);
    }];
    UIImageView *arrowIcon = [UIImageView new];
    arrowIcon.image = [UIImage imageNamed:@"downArrowIcon"];
    [self.view addSubview:arrowIcon];
    [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(coinNumLabel);
        make.centerY.equalTo(tView);
        make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
    }];
    self.zoneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.zoneBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
    [self.zoneBtn setTitle:@"不限" forState:UIControlStateNormal];
    [self.zoneBtn setTitleColor:MainColor forState:UIControlStateNormal];
    [self.zoneBtn addTarget:self action:@selector(zoneBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [tView addSubview:self.zoneBtn];
    [self.zoneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(arrowIcon.mas_left);
        make.centerY.equalTo(tView);
    }];
    
    self.sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sendBtn.frame = CGRectMake(topToMargin, tView.botoom+50, SCREEN_WIDTH-30, formBtnHeight);
    self.sendBtn.layer.masksToBounds = YES;
    self.sendBtn.layer.cornerRadius = 4;
    [self.sendBtn setTitle:@"立即发放" forState:UIControlStateNormal];
    [self.sendBtn setTitleColor:whiteC forState:UIControlStateNormal];
    self.sendBtn.backgroundColor = orangeC;
    [self.sendBtn addTarget:self action:@selector(sendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sendBtn];
    
    
    UILabel *showLabel = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.view];
    showLabel.text = @"未抢取的通币 , 将于48小时后退回";
    [showLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.mas_equalTo(-30);
    }];
    
}

//区域选择
-(void)zoneBtnClick:(UIButton *)sender{
    HWLog(@"zone");
    SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:@"" TitleArr:@[@"不限",@"1公里内",@"5公里内",@"10公里内"]];
    [single showView:^(NSString *singleStr) {
        [sender setTitle:[NSString stringWithFormat:@"%@",singleStr] forState:UIControlStateNormal];
    }];
}

-(void)sendBtnClick{
    HWLog(@"send");
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
