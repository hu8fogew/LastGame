//
//  CoinDouProfitViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/28.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "CoinDouProfitViewController.h"

@interface CoinDouProfitViewController ()
{
    UILabel *yesterdayNum;
    UILabel *coinNum;
    UILabel *monthNum;
    UIButton *openBtn;
    UIButton *chargeBtn;
    UIButton *incomeBtn;
    UIButton *outBtn;
}

@property (strong,nonatomic) UIView *oView;
@property (strong,nonatomic) UIView *yView;
@property (strong,nonatomic) UIView *wView;

//币斗规则
@property (strong,nonatomic) UIView *coverView;
@property (strong,nonatomic) UIView *ruleView;

@end

@implementation CoinDouProfitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"币斗收益";
    self.view.backgroundColor = grayC;
    
    [self.view addSubview:self.oView];
    [self.view addSubview:self.yView];
    [self.view addSubview:self.wView];
    
    [self initWithFrame];
    
    [self.ruleView addSubview:({
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(self.ruleView.width-35, 10, 25, 25);
        closeBtn.adjustsImageWhenHighlighted = NO;
        [closeBtn setImage:[UIImage imageNamed:@"rClose_gray"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        closeBtn;
    })];
}

//橙色view
-(UIView *)oView{
    if (!_oView) {
        _oView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.4*0.7-32)];
        _oView.backgroundColor = HWColor(253, 145, 36);
    }
    return _oView;
}

//浅橙色view
-(UIView *)yView{
    if (!_yView) {
        _yView = [[UIView alloc]initWithFrame:CGRectMake(0, self.oView.height, SCREEN_WIDTH, SCREEN_HEIGHT*0.4*0.3)];
        _yView.backgroundColor = orangeC;
    }
    return _yView;
}

//白色view
-(UIView *)wView{
    if (!_wView) {
        _wView = [[UIView alloc]initWithFrame:CGRectMake(0, self.yView.y+self.yView.height+10, SCREEN_WIDTH, SCREEN_HEIGHT*0.6-10-32)];
        _wView.backgroundColor = whiteC;
    }
    return _wView;
}

#pragma mark ------//布局-------
-(void)initWithFrame{
    //昨日收益（个）
    UILabel *tLab = [UILabel labelWithTextColor:whiteC FontSize:MTitleSize Sview:self.oView];
    tLab.text = @"昨日收益(个)";
    tLab.font = [UIFont systemFontOfSize:MTitleSize weight:UIFontWeightBold];
    [tLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.oView.mas_centerY).offset(-leftToMargin);
        make.centerX.equalTo(self.oView);
    }];
    yesterdayNum = [UILabel labelWithTextColor:whiteC FontSize:40 Sview:self.oView];
    yesterdayNum.text = @"0";
    [yesterdayNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.oView);
        make.top.equalTo(self.oView.mas_centerY);
    }];
    
    //竖白线
    UIView *wView = [UIView new];
    wView.backgroundColor = whiteC;
    [self.yView addSubview:wView];
    [wView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.yView);
        make.top.mas_equalTo(20);
        make.size.mas_equalTo(CGSizeMake(1, self.yView.height-40));
    }];
    
    
    //币斗通币结余(个)
    UILabel *coinLab = [UILabel labelWithTextColor:whiteC FontSize:subTitleSize Sview:self.yView];
    coinLab.text = @"币斗通币结余(个)";
    [coinLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(-SCREEN_WIDTH/4);
        make.bottom.equalTo(self.yView.mas_centerY).offset(-5);
    }];
    coinNum = [UILabel labelWithTextColor:whiteC FontSize:30 Sview:self.yView];
    coinNum.text = @"1";
    [coinNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.yView.mas_centerY);
        make.centerX.equalTo(coinLab);
    }];
    
    //预计月收益(个)
    UILabel *mouthLab = [UILabel labelWithTextColor:whiteC FontSize:subTitleSize Sview:self.yView];
    mouthLab.text = @"预计月收益(个)";
    [mouthLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(SCREEN_WIDTH/4);
        make.centerY.equalTo(coinLab);
    }];
    monthNum = [UILabel labelWithTextColor:whiteC FontSize:30 Sview:self.yView];
    monthNum.text = @"0";
    [monthNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(coinNum);
        make.centerX.equalTo(mouthLab);
    }];
    
    //钱包图像
    UIImageView *walletIcon = [UIImageView new];
    walletIcon.image = [UIImage imageNamed:@"coindou_icon"];
    [self.wView addSubview:walletIcon];
    [walletIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftToMargin);
        make.top.mas_equalTo(topToMargin);
        make.size.mas_equalTo(CGSizeMake(20, 20));
    }];
    UILabel *getLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.wView];
    getLab.text = @"免费提现,快速到账";
    [getLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(walletIcon.mas_right).offset(leftToMargin);
        make.centerY.equalTo(walletIcon);
    }];
    //开通按钮
    openBtn = [self createBtnWithTitle:@"立即开通" andTitleColor:orangeC andTitleFont:subTitleSize andCornRaduis:13 andTarget:self andAction:@selector(btnRespond:) andSview:self.wView];
    openBtn.tag = 0;
    [openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(getLab);
        make.right.mas_equalTo(-leftToMargin);
        make.size.mas_equalTo(CGSizeMake(80, 26));
    }];
    
    //灰色横线
    UIView *vv = [UIView new];
    vv.backgroundColor = grayC;
    [self.wView addSubview:vv];
    [vv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.wView);
        make.top.equalTo(walletIcon.mas_bottom).offset(topToMargin);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
    }];
    
    //充值图标
    UIImageView *chargeIcon = [UIImageView new];
    chargeIcon.image = [UIImage imageNamed:@"coin_icon"];
    [self.wView addSubview:chargeIcon];
    [chargeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(walletIcon);
        make.top.equalTo(vv).offset(topToMargin);
        make.size.equalTo(walletIcon);
    }];
    UILabel *chargeLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.wView];
    chargeLab.text = @"充值赚通币,多存多收益";
    [chargeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(getLab);
        make.centerY.equalTo(chargeIcon);
    }];
    //充值按钮
    chargeBtn = [self createBtnWithTitle:@"立即充值" andTitleColor:orangeC andTitleFont:subTitleSize andCornRaduis:13 andTarget:self andAction:@selector(btnRespond:) andSview:self.wView];
    chargeBtn.tag = 1;
    [chargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(chargeIcon);
        make.right.equalTo(openBtn);
        make.size.equalTo(openBtn);
    }];
    
    //灰色横线
    UIView *hv = [UIView new];
    hv.backgroundColor = grayC;
    [self.wView addSubview:hv];
    [hv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.wView);
        make.top.equalTo(chargeIcon.mas_bottom).offset(topToMargin);
        make.size.equalTo(vv);
    }];
    
    //规则
    UIImageView *ruleIcon = [UIImageView new];
    ruleIcon.image = [UIImage imageNamed:@"rule_icon"];
    [self.wView addSubview:ruleIcon];
    [ruleIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(chargeIcon);
        make.top.equalTo(hv).offset(topToMargin);
        make.size.equalTo(chargeIcon);
    }];
    UILabel *ruleLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.wView];
    ruleLab.text = @"币斗规则";
    [ruleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(getLab);
        make.centerY.equalTo(ruleIcon);
    }];
    UIButton *ruleBtn = [self createBtnWithTitle:@"查看详情" andTitleColor:blueC andTitleFont:subTitleSize andCornRaduis:0 andTarget:self andAction:@selector(btnRespond:) andSview:self.wView];
    ruleBtn.layer.borderColor = clearC.CGColor;
    ruleBtn.tag = 4;
    [ruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(chargeBtn);
        make.size.equalTo(chargeBtn);
        make.centerY.equalTo(ruleLab);
    }];
    
    //灰色横线
    UIView *lv = [UIView new];
    lv.backgroundColor = grayC;
    [self.wView addSubview:lv];
    [lv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.wView);
        make.top.equalTo(ruleIcon.mas_bottom).offset(topToMargin);
        make.size.equalTo(vv);
    }];
    
    
    //转入
    incomeBtn = [self createBtnWithTitle:@"转入" andTitleColor:orangeC andTitleFont:MTitleSize andCornRaduis:3 andTarget:self andAction:@selector(btnRespond:) andSview:self.wView];
    incomeBtn.tag = 2;
    [incomeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftToMargin);
        make.bottom.mas_equalTo(-topToMargin);
        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH-30)*0.6, 40));
    }];
    
    //转出
    outBtn = [self createBtnWithTitle:@"转出" andTitleColor:SecondTitleColor andTitleFont: MTitleSize andCornRaduis:3 andTarget:self andAction:@selector(btnRespond:) andSview:self.wView];
    outBtn.backgroundColor = grayC;
    outBtn.tag = 3;
    [outBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(incomeBtn);
        make.right.mas_equalTo(-leftToMargin);
        make.size.mas_equalTo(CGSizeMake((SCREEN_WIDTH-30)*0.4, 40));
    }];
    
}

-(void)btnRespond:(UIButton *)btn{
    if (btn.tag == 0) {
        HWLog(@"立即开通");
        CoinOpenViewController *vc = [CoinOpenViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag == 1) {
        HWLog(@"立即充值");
        MyCoinViewController *vc = [MyCoinViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag == 2) {
        HWLog(@"转入");
        DouIncomeViewController *vc = [DouIncomeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag == 3) {
        HWLog(@"转出");
        if ([coinNum.text isEqual:@"0"]) {
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"币斗结余为0，不能转出" message:nil preferredStyle:UIAlertControllerStyleAlert];
            [self presentViewController:alert animated:YES completion:nil];
            [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(createAlert:) userInfo:alert repeats:NO];
        }
        else{
            DouOutViewController *vc = [DouOutViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        
    }
    if (btn.tag == 4) {
        [UIView animateWithDuration:0.3 animations:^{
            [self.view addSubview:self.coverView];
        }];
    }
}

-(void)createAlert:(NSTimer *)timer{
    UIAlertController *alert = [timer userInfo];
    [alert dismissViewControllerAnimated:alert completion:nil];
    alert = nil;
}

-(void)closeBtnClick{
    [UIView animateWithDuration:0.3 animations:^{
        [self.coverView removeFromSuperview];
    }];
}

#pragma mark -------币斗规则视图----------
-(UIView *)coverView{
    if (!_coverView) {
        _coverView = [[UIView alloc]initWithFrame:self.view.bounds];
        _coverView.backgroundColor = [MainColor colorWithAlphaComponent:0.7];
        
        [_coverView addSubview:self.ruleView];
    }
    return _coverView;
}

-(UIView *)ruleView{
    if (!_ruleView) {
        _ruleView = [[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT*0.19-32, SCREEN_WIDTH-40, SCREEN_HEIGHT*0.62)];
        _ruleView.backgroundColor = whiteC;
        
        CGFloat distanceH = _ruleView.height/20;
        
        UILabel *title = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+1 Sview:_ruleView];
        title.text = @"币斗规则";
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.ruleView);
            make.top.mas_equalTo(distanceH);
        }];
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [_ruleView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_ruleView);
            make.top.equalTo(title.mas_bottom).offset(distanceH*0.8);
            make.size.mas_equalTo(CGSizeMake(_ruleView.width-20, 1));
        }];
        
        /////
        UILabel *first = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        first.text = @"1、";
        [first mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vv.mas_bottom).offset(distanceH);
            make.left.mas_equalTo(topToMargin);
        }];
        UILabel *firstLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        firstLab.numberOfLines = 0;
        firstLab.attributedText = [self attributedString:@"用户钱包的通币可直接转入币斗，10个通币起；"];
        [firstLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(first.mas_right);
            make.top.equalTo(first);
            make.width.mas_equalTo(_ruleView.width-45);
        }];
        
        //////
        UILabel *second = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        second.text = @"2、";
        [second mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(firstLab.mas_bottom).offset(distanceH);
            make.left.equalTo(first);
        }];
        UILabel *secondLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        secondLab.numberOfLines = 0;
        secondLab.attributedText = [self attributedString:@"用户可向币斗中进行直接充值购买通币，币斗中的通币收益按天结算(24小时制)；"];
        [secondLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(second);
            make.width.equalTo(firstLab);
        }];
        
        //////
        UILabel *three = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        three.text = @"3、";
        [three mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(secondLab.mas_bottom).offset(distanceH);
            make.left.equalTo(second);
        }];
        UILabel *threeLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        threeLab.numberOfLines = 0;
        threeLab.attributedText = [self attributedString:@"通币的收益按照转入或购买的数量及时限进行计算收益比率(如1000个通币最高月收益≥80个)；"];
        [threeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(three);
            make.width.equalTo(firstLab);
        }];
        
        //////
        UILabel *four = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        four.text = @"4、";
        [four mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(threeLab.mas_bottom).offset(distanceH);
            make.left.equalTo(second);
        }];
        UILabel *fourLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        fourLab.numberOfLines = 0;
        fourLab.attributedText = [self attributedString:@"转入或购买的通币在币斗中须满7个工作日后可随意转出；"];
        [fourLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(four);
            make.width.equalTo(firstLab);
        }];
        
        //////
        UILabel *five = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        five.text = @"5、";
        [five mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(fourLab.mas_bottom).offset(distanceH);
            make.left.equalTo(second);
        }];
        UILabel *fiveLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:_ruleView];
        fiveLab.numberOfLines = 0;
        fiveLab.attributedText = [self attributedString:@"所有解释权归企聘通公司所有。"];
        [fiveLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstLab);
            make.top.equalTo(five);
            make.width.equalTo(firstLab);
        }];
        
    }
    return _ruleView;
}

-(UIButton *)createBtnWithTitle:(NSString *)title andTitleColor:(UIColor *)titleColor andTitleFont:(CGFloat)font andCornRaduis:(CGFloat)cornRadius andTarget:(id)target andAction:(SEL)action andSview:(UIView *)sView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.layer.borderColor = titleColor.CGColor;
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    btn.layer.borderWidth = 1;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = cornRadius;
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [sView addSubview:btn];
    
    return btn;
}

//行间距
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
