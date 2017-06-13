//
//  MyCoinViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/1/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "MyCoinViewController.h"

@interface MyCoinViewController ()

@property (strong,nonatomic) UIView *headerView;

@property (strong,nonatomic) UIView *coinShowView;

@property (strong,nonatomic) UIView *btnView;

@end

@implementation MyCoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"我的通币";
    
    self.view.backgroundColor = grayC;
    
    [self.view addSubview:self.headerView];
    [self.view addSubview:self.coinShowView];
    [self.view addSubview:self.btnView];
    
}

#pragma mark /*-----headerView-------*/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.36)];
        _headerView.backgroundColor = whiteC;
        
        //余额
        UILabel *balance = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:_headerView];
        balance.text = @"余额";
        [balance mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headerView.mas_centerX).offset(-leftToMargin);
            make.bottom.equalTo(_headerView.mas_centerY).offset(-topToMargin);
            
        }];
        
        //coin图标
        UIImageView *iconView = [UIImageView new];
        iconView.image = [UIImage imageNamed:@"icon_image"];
        [_headerView addSubview:iconView];
        [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(balance.mas_right).offset(3);
            make.centerY.equalTo(balance);
            make.size.mas_equalTo(CGSizeMake(MTitleSize+2, MTitleSize+2));
        }];
        
        //余额个数
        UILabel *amount = [UILabel labelWithTextColor:MainColor FontSize:60 Sview:_headerView];
        amount.font = [UIFont systemFontOfSize:60 weight:UIFontWeightRegular];
        amount.text = @"0";
        [amount mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headerView);
            make.top.equalTo(_headerView.mas_centerY).offset(-5);
        }];
        
    }
    return _headerView;
}

#pragma mark /*-----coinShowView-------*/
-(UIView *)coinShowView{
    if (!_coinShowView) {
        _coinShowView = [[UIView alloc]initWithFrame:CGRectMake(0, self.headerView.y+self.headerView.height+DistanceForCell, SCREEN_WIDTH, SCREEN_WIDTH)];
        _coinShowView.backgroundColor = whiteC;
        
        UILabel *titleLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:_coinShowView];
        titleLabel.text = @"请选择充值金额:";
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(topToMargin);
            make.top.mas_equalTo(_coinShowView.height/12);
        }];
        
        UIView *fv = [UIView new];
        fv.backgroundColor = grayC;
        [_coinShowView addSubview:fv];
        [fv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_coinShowView);
            make.top.equalTo(titleLabel.mas_bottom).offset(_coinShowView.height/20);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
        
        for (int i = 0; i < 5; i++) {
            UIView *bv = [[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_WIDTH*0.22+i*(SCREEN_WIDTH/8)+i*10, (SCREEN_WIDTH-40), SCREEN_WIDTH/8)];
            bv.tag = 100+i;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(coinAmountClick:)];
            [bv addGestureRecognizer:tap];
            [_coinShowView addSubview:bv];
            
            UIImageView *coinImg = [UIImageView new];
            coinImg.image = [UIImage imageNamed:@"fxtongbi"];
            [bv addSubview:coinImg];
            [coinImg mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(leftToMargin);
                make.centerY.equalTo(bv);
                make.size.mas_equalTo(CGSizeMake(bv.height/2, bv.height/2));
            }];
            
            NSArray *labAry = @[@"200",@"1200",@"6600",@"12000",@"24000"];
            UILabel *amountLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:bv];
            amountLab.text = labAry[i];
            [amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(coinImg.mas_right).offset(leftToMargin);
                make.centerY.equalTo(coinImg);
            }];
            
            NSArray *numAry = @[@"¥20",@"¥120",@"¥660",@"¥1200",@"¥2400"];
            UILabel *moneyLab = [UILabel labelWithTextColor:blueC FontSize:subTitleSize Sview:bv];
            moneyLab.text = numAry[i];
            moneyLab.layer.borderWidth = 1;
            moneyLab.layer.borderColor = blueC.CGColor;
            moneyLab.layer.cornerRadius = 12;
            moneyLab.textAlignment = NSTextAlignmentCenter;
            [moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-leftToMargin);
                make.centerY.equalTo(coinImg);
                make.size.mas_equalTo(CGSizeMake(60, 24));
            }];
            
            
            UIView *rv = [UIView new];
            rv.backgroundColor = grayC;
            [bv addSubview:rv];
            [rv mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.and.centerX.equalTo(bv);
                make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-40, 1));
            }];
        }
        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [_coinShowView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.equalTo(_coinShowView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
    }
    return _coinShowView;
}

//通币选择
-(void)coinAmountClick:(UITapGestureRecognizer *)tap{
    if (tap.view.tag == 100) {
        HWLog(@"100");
        
    }
    if (tap.view.tag == 101) {
        HWLog(@"101");
        
    }
    if (tap.view.tag == 102) {
        HWLog(@"102");
        
    }
    if (tap.view.tag == 103) {
        HWLog(@"103");
        
    }
    if (tap.view.tag == 104) {
        HWLog(@"104");
        
    }
    
}

#pragma mark /*-----btnView-------*/
-(UIView *)btnView{
    if (!_btnView) {
        _btnView = [[UIView alloc]initWithFrame:CGRectMake(0, self.coinShowView.botoom, SCREEN_WIDTH, SCREEN_HEIGHT-self.coinShowView.height-self.headerView.height-10-64)];
        _btnView.backgroundColor = whiteC;
        
        UIButton *recordBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [recordBtn setTitle:@"收支记录" forState:UIControlStateNormal];
        [recordBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
        recordBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
        [recordBtn addTarget:self action:@selector(recordBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_btnView addSubview:recordBtn];
        [recordBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(_btnView);
        }];
    }
    return _btnView;
}


-(void)recordBtnClick{
    ProfitDeViewController *vc = [ProfitDeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
