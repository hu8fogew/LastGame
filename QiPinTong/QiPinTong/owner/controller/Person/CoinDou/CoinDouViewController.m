//
//  CoinDouViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "CoinDouViewController.h"

@interface CoinDouViewController ()<UIGestureRecognizerDelegate>

@property (strong,nonatomic) UIView *wView;
@property (strong,nonatomic) UIView *gView;

@property (strong,nonatomic) UIButton *coinBtn;

@end

@implementation CoinDouViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"币斗收益";
    self.view.backgroundColor = whiteC;

    [self.view addSubview:self.wView];
    [self.view addSubview:self.gView];
    
    [self initWithFrame];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}


//白色view
-(UIView *)wView{
    if (!_wView) {
        _wView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT/2-32)];
        _wView.backgroundColor = whiteC;
    }
    return _wView;
}

//灰色view
-(UIView *)gView{
    if (!_gView) {
        _gView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT/2-32, SCREEN_WIDTH, SCREEN_HEIGHT/2-32)];
        _gView.backgroundColor = grayC;
    }
    return _gView;
}

//布局
-(void)initWithFrame{
    //标题
    UILabel *titleLab = [UILabel labelWithTextColor:orangeC FontSize:23 Sview:self.wView];
    titleLab.text = @"币斗可以赚通币";
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.mas_equalTo(SCREEN_WIDTH*0.15);
    }];
    
    //币斗图片
    UIImageView *imgView = [UIImageView new];
    imgView.image = [UIImage imageNamed:@"coinDou"];
    [self.wView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(titleLab);
        make.centerY.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.4, SCREEN_WIDTH*0.4));
    }];
    
    //存取标题
    UILabel *saveLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.gView];
    saveLab.text = @"放心存 ∙ 大量赚 ∙ 随时取";
    [saveLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(topToMargin);
        make.top.mas_equalTo(SCREEN_WIDTH*0.12);
    }];
    UILabel *douLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self.gView];
    douLab.text = @"币斗是企聘通提供的服务支持,安全有保证,值得信赖。";
    [douLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(saveLab);
        make.top.equalTo(saveLab.mas_bottom).offset(leftToMargin);
    }];
    UILabel *deLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self.gView];
    deLab.text = @"灵活取出,随时到账。";
    [deLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(douLab);
        make.top.equalTo(douLab.mas_bottom).offset(leftToMargin);
    }];
    
    //赚通币按钮
    self.coinBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.coinBtn setTitle:@"我要赚通币" forState:UIControlStateNormal];
    [self.coinBtn setTitleColor:whiteC forState:UIControlStateNormal];
    self.coinBtn.backgroundColor = blueC;
    self.coinBtn.layer.cornerRadius = 3;
    [self.coinBtn addTarget:self action:@selector(coinBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.gView addSubview:self.coinBtn];
    [self.coinBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.gView);
        make.top.equalTo(deLab.mas_bottom).offset(SCREEN_WIDTH*0.12);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
    }];
}

-(void)coinBtnClick{
    HWLog(@"log");
    CoinDouProfitViewController *vc = [CoinDouProfitViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
