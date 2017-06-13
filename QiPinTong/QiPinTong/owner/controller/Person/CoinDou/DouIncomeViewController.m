//
//  DouIncomeViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/4/12.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "DouIncomeViewController.h"

@interface DouIncomeViewController ()

@property (strong,nonatomic) UITextField *coinField;
@property (strong,nonatomic) UIButton *saveBtn;
@property (strong,nonatomic) UIButton *confirmBtn;

@end

@implementation DouIncomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"币斗收益";
    self.view.backgroundColor = grayC;
    
    [self initWithFrame];
}

//布局
-(void)initWithFrame{
    
    //通币余额为1280个，预计月赚120个
    UILabel *tLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.view];
    tLab.text = @"通币余额为10个，预计月赚0个";
    [tLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftToMargin);
        make.top.mas_equalTo(2*leftToMargin);
    }];
    
    //白色view
    UIView *wView = [UIView new];
    wView.backgroundColor = whiteC;
    [self.view addSubview:wView];
    [wView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view);
        make.top.equalTo(tLab.mas_bottom).offset(2*leftToMargin);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*0.42));
    }];
    
    //到账时间
    UILabel *limitLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:wView];
    limitLab.text = @"预计收益到账时间3月24日";
    [limitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tLab);
        make.bottom.mas_equalTo(-topToMargin);
    }];
    
    //灰色横线
    UIView *vv = [UIView new];
    vv.backgroundColor = grayC;
    [wView addSubview:vv];
    [vv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(wView);
        make.bottom.mas_equalTo(limitLab.mas_top).offset(-topToMargin);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
    }];
    
    //通币数量
    UILabel *coinNo = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:wView];
    coinNo.text = @"通币数量";
    [coinNo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(tLab);
        make.top.mas_equalTo(25);
    }];
    
    //通币图标
    UIImageView *coinImg = [UIImageView new];
    coinImg.image = [UIImage imageNamed:@"coin_image"];
    [wView addSubview:coinImg];
    [coinImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(topToMargin);
        make.bottom.equalTo(vv).offset(-2*leftToMargin);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    
    //通币数量输入
    UITextField *coinField = [UITextField new];
    [coinField becomeFirstResponder];
    coinField.tintColor = MainColor;
    coinField.keyboardType = UIKeyboardTypeNumberPad;
    coinField.font = [UIFont systemFontOfSize:30];
    [wView addSubview:coinField];
    [coinField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(coinImg.mas_right).offset(leftToMargin);
        make.centerY.equalTo(coinImg);
        make.width.mas_equalTo(SCREEN_WIDTH-150);
    }];
    
    //全部存入按钮
    self.saveBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.saveBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
    [self.saveBtn setTitle:@"全部存入" forState:UIControlStateNormal];
    [self.saveBtn setTitleColor:blueC forState:UIControlStateNormal];
    [self.saveBtn addTarget:self action:@selector(saveBtnAction) forControlEvents:UIControlEventTouchUpInside];
    [wView addSubview:self.saveBtn];
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-leftToMargin);
        make.centerY.equalTo(coinImg);
    }];
    
    //勾选按钮
    UIButton *agreeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    agreeBtn.adjustsImageWhenHighlighted = NO;
    agreeBtn.selected = YES;
    [agreeBtn setImage:[UIImage imageNamed:@"agreeIconN"] forState:UIControlStateNormal];
    [agreeBtn setImage:[UIImage imageNamed:@"agreeIconS"] forState:UIControlStateSelected];
    [agreeBtn addTarget:self action:@selector(agreeBtnSelect:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:agreeBtn];
    [agreeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(limitLab);
        make.top.equalTo(wView.mas_bottom).offset(SCREEN_WIDTH*0.13);
        make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
    }];
    
    //规则文本
    UILabel *agreeLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.view];
    agreeLab.text = @"我已阅读并同意服务协议及规则";
    [agreeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(agreeBtn.mas_right).offset(3);
        make.centerY.equalTo(agreeBtn);
    }];
    
    //确定按钮
    self.confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    [self.confirmBtn setTitleColor:whiteC forState:UIControlStateNormal];
    self.confirmBtn.selected = YES;
    self.confirmBtn.backgroundColor = blueC;
    self.confirmBtn.layer.cornerRadius = 3;
    [self.confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.confirmBtn];
    [self.confirmBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(agreeLab.mas_bottom).offset(2*topToMargin);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
    }];
    
}

-(void)saveBtnAction{
    
}

-(void)agreeBtnSelect:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        self.confirmBtn.backgroundColor = blueC;
        [self.confirmBtn setTitleColor:whiteC forState:UIControlStateNormal];
        self.confirmBtn.selected = YES;
        
    }
    else{
        self.confirmBtn.backgroundColor = SecondTitleColor;
        [self.confirmBtn setTitleColor:HWColor(100, 100, 100) forState:UIControlStateNormal];
        self.confirmBtn.selected = NO;
    }
}

-(void)confirmBtnClick:(UIButton *)btn{
    if (btn.selected == YES) {
        HWLog(@"confirm");
    }
    return;
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
