//
//  PayViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/6/2.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PayViewController.h"
#import "PayView.h"
@interface PayViewController ()<UITextFieldDelegate,PasswordFieldDidChange>

@property (strong,nonatomic) UIView *whiteView;

@property (strong,nonatomic) UIImageView *imgView;
@property (strong,nonatomic) UILabel *titleLab;
@property (strong,nonatomic) NSString *titleStr;
@property (strong,nonatomic) UITextField *moneyField;
@property (strong,nonatomic) UIButton *payBtn;


@property (strong,nonatomic) PayView *payView;

@end

@implementation PayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"支付";
    self.view.backgroundColor = grayC;
    
    [self.view addSubview:self.whiteView];
    [self.view addSubview:self.payBtn];
    [self initWithFrame];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

#pragma mark 键盘出现
-(void)keyboardWillShow:(NSNotification *)note
{
    self.view.frame = CGRectMake(0, 32, SCREEN_WIDTH, SCREEN_HEIGHT);

}
#pragma mark 键盘消失
-(void)keyboardWillHide:(NSNotification *)note
{
    self.view.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT);

}

#pragma mark ------------
-(UIView *)whiteView{
    if (!_whiteView) {
        _whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.53-32)];
        _whiteView.backgroundColor = whiteC;
    }
    return _whiteView;
}

#pragma mark ------控件布局--------
-(void)initWithFrame{
    CGFloat distanceH = self.whiteView.height/12;
    //图像
    self.imgView = [UIImageView new];
    [self.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"classics.jpg"]];
    [self.whiteView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(distanceH);
        make.centerX.equalTo(self.whiteView);
        make.size.mas_equalTo(DeImageSize);
    }];
    
    //收款账号
    self.titleLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.whiteView];
    self.titleStr = @"小二身患孤独症";
    NSMutableString *str = [[NSMutableString alloc]initWithString:@"向“”支付"];
    [str insertString:self.titleStr atIndex:2];
    self.titleLab.text = str;
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).offset(distanceH*0.8);
        make.centerX.equalTo(self.imgView);
    }];
    
    //支付金额
    UILabel *amountLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.whiteView];
    amountLab.text = @"支付金额";
    [amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(distanceH*0.8);
        make.left.mas_equalTo(topToMargin);
    }];
    UILabel *yuanLab = [UILabel labelWithTextColor:MainColor FontSize:30 Sview:self.whiteView];
    yuanLab.text = @"¥";
    [yuanLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(amountLab);
        make.top.equalTo(amountLab.mas_bottom).offset(distanceH);
    }];
    self.moneyField = [UITextField new];
    self.moneyField.textColor = MainColor;
    self.moneyField.font = [UIFont systemFontOfSize:50];
    self.moneyField.keyboardType = UIKeyboardTypeDecimalPad;
    [self.moneyField addTarget:self action:@selector(moneyFieldChanged:) forControlEvents:UIControlEventEditingChanged];
    self.moneyField.tintColor = MainColor;
    self.moneyField.delegate = self;
    [self.whiteView addSubview:self.moneyField];
    [self.moneyField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(yuanLab);
        make.left.equalTo(yuanLab.mas_right).offset(5);
        make.width.mas_equalTo(SCREEN_WIDTH*0.5);
    }];
    
    UIView *vv = [UIView new];
    vv.backgroundColor = grayC;
    [self.whiteView addSubview:vv];
    [vv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.whiteView);
        make.top.equalTo(self.moneyField.mas_bottom).offset(distanceH);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, 1));
    }];
    
    //余额
    UILabel *balanceLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize+1 Sview:self.whiteView];
    balanceLab.text = @"当前余额为20元 , ";
    [balanceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(vv).offset(distanceH*0.7);
        make.left.equalTo(vv);
    }];
    UIButton *chargeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [chargeBtn setTitle:@"立即充值" forState:UIControlStateNormal];
    [chargeBtn setTitleColor:blueC forState:UIControlStateNormal];
    chargeBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    chargeBtn.titleLabel.font = [UIFont systemFontOfSize:subTitleSize+1];
    [chargeBtn addTarget:self action:@selector(chargeBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:chargeBtn];
    [chargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(balanceLab.mas_right);
        make.centerY.equalTo(balanceLab);
    }];
}

-(void)moneyFieldChanged:(UITextField *)textField{
    HWLog(@"%@",textField.text);
    self.payView.amountLab.text = textField.text;
    if (textField.text.length >0) {
        self.payBtn.backgroundColor = blueC;
        self.payBtn.selected = YES;
    }
    if (textField.text.length ==0) {
        self.payBtn.backgroundColor = [blueC colorWithAlphaComponent:0.3];
        self.payBtn.selected = NO;
    }
}

-(void)chargeBtnClick{
    MyCoinViewController *vc = [MyCoinViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark -----payBtn-------
-(UIButton *)payBtn{
    if (!_payBtn) {
        _payBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _payBtn.frame = CGRectMake(15, self.whiteView.botoom+formBtnHeight, SCREEN_WIDTH-30, formBtnHeight);
        _payBtn.backgroundColor = [blueC colorWithAlphaComponent:0.3];
        _payBtn.layer.masksToBounds = YES;
        [_payBtn setTitleColor:whiteC forState:UIControlStateNormal];
        [_payBtn setTitle:@"支付" forState:UIControlStateNormal];
        _payBtn.layer.cornerRadius = 3;
        _payBtn.selected = NO;
        [_payBtn addTarget:self action:@selector(payBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _payBtn;
}

-(void)payBtnClick:(UIButton *)btn{
    if (btn.selected == YES) {
        HWLog(@"ssd");
        [UIView animateWithDuration:0.3 animations:^{
            [self.view addSubview:self.payView];
            [self.moneyField resignFirstResponder];
        }];
        
    }
    else{
        HWLog(@"nns");
    }
}

#pragma mark ------payView------
-(PayView *)payView{
    if (!_payView) {
        _payView = [[PayView alloc]initWithFrame:self.view.bounds];
        _payView.imgView.image = self.imgView.image;
        _payView.titleLab.text = self.titleLab.text;
        
        _payView.delegate = self;
    }
    return _payView;
}

-(void)passwordFieldDidChange:(TyTextField *)textField{
    HWLog(@"%@",textField.text);
    if (textField.text.length >=6) {
        PayCompleteViewController *vc = [PayCompleteViewController new];
        vc.amountStr = self.moneyField.text;
        vc.titleStr = self.titleStr;
        vc.image = self.imgView.image;
        [self.navigationController pushViewController:vc animated:YES];
    }
}

-(void)viewDidAppear:(BOOL)animated{
    [self.moneyField becomeFirstResponder];
    [self.payView.passwordField becomeFirstResponder];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
