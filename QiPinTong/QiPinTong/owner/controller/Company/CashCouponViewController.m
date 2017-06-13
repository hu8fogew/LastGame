//
//  DiscountCouponViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "CashCouponViewController.h"
@interface CashCouponViewController ()<UIGestureRecognizerDelegate>

@property (strong,nonatomic) UIButton *selectBtn;
@property (strong,nonatomic) UITextField *amountField;
@property (strong,nonatomic) UITextField *useAmountField;
@property (strong,nonatomic) UIButton *dateBtn;
@property (strong,nonatomic) UIButton *sendBtn;

@end

@implementation CashCouponViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"发代金券";
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

#pragma mark -------布局---------
-(void)setupFrame{
    ///
    UIView *fView = [[UIView alloc]initWithFrame:CGRectMake(topToMargin, SCREEN_WIDTH*0.13, SCREEN_WIDTH-30, 40)];
    fView.backgroundColor = whiteC;
    fView.layer.masksToBounds = YES;
    fView.layer.cornerRadius = 4;
    [self.view addSubview:fView];
    UILabel *storeLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:fView];
    storeLab.text = @"门店选择";
    [storeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftToMargin);
        make.centerY.equalTo(fView);
    }];
    self.selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selectBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
    [self.selectBtn setTitle:@"通用" forState:UIControlStateNormal];
    [self.selectBtn setTitleColor:MainColor forState:UIControlStateNormal];
    [self.selectBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.selectBtn.tag = 0;
    [fView addSubview:self.selectBtn];
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-leftToMargin);
        make.centerY.equalTo(fView);
    }];
    
    ///////////
    UIView *sView = [[UIView alloc]initWithFrame:CGRectMake(topToMargin, fView.botoom+30, SCREEN_WIDTH-30, 40)];
    sView.backgroundColor = whiteC;
    sView.layer.masksToBounds = YES;
    sView.layer.cornerRadius = 4;
    [self.view addSubview:sView];
    UILabel *amountLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:sView];
    amountLab.text = @"代金券金额";
    [amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(storeLab);
        make.centerY.equalTo(sView);
    }];
    self.amountField = [UITextField new];
    self.amountField.font = [UIFont systemFontOfSize:MTitleSize];
    self.amountField.textAlignment = NSTextAlignmentRight;
    self.amountField.keyboardType = UIKeyboardTypeNumberPad;
    self.amountField.placeholder = @"填写金额";
    [sView addSubview:self.amountField];
    [self.amountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.selectBtn);
        make.centerY.equalTo(amountLab);
        make.size.mas_equalTo(CGSizeMake(100, 30));
    }];
    
    ///////
    UIView *tView = [[UIView alloc]initWithFrame:CGRectMake(topToMargin, sView.botoom+30, SCREEN_WIDTH-30, 40)];
    tView.backgroundColor = whiteC;
    tView.layer.masksToBounds = YES;
    tView.layer.cornerRadius = 4;
    [self.view addSubview:tView];
    UILabel *useLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:tView];
    useLab.text = @"满多少可用";
    [useLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(amountLab);
        make.centerY.equalTo(tView);
    }];
    self.useAmountField = [UITextField new];
    self.useAmountField.font = [UIFont systemFontOfSize:MTitleSize];
    self.useAmountField.keyboardType = UIKeyboardTypeNumberPad;
    self.useAmountField.placeholder = @"填写金额";
    self.useAmountField.textAlignment = NSTextAlignmentRight;
    [tView addSubview:self.useAmountField];
    [self.useAmountField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.amountField);
        make.centerY.equalTo(useLab);
        make.size.equalTo(self.amountField);
    }];
    
    /////
    UIView *bView = [[UIView alloc]initWithFrame:CGRectMake(topToMargin, tView.botoom+30, SCREEN_WIDTH-30, 40)];
    bView.backgroundColor = whiteC;
    bView.layer.masksToBounds = YES;
    bView.layer.cornerRadius = 4;
    [self.view addSubview:bView];
    UILabel *limitLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:bView];
    limitLab.text = @"活动截止";
    [limitLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(useLab);
        make.centerY.equalTo(bView);
    }];
    UIImageView *bArIcon = [UIImageView new];
    bArIcon.image = [UIImage imageNamed:@"downArrowIcon"];
    [bView addSubview:bArIcon];
    [bArIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-leftToMargin);
        make.centerY.equalTo(limitLab);
        make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
    }];
    self.dateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.dateBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
    [self.dateBtn setTitle:@"请选择" forState:UIControlStateNormal];
    [self.dateBtn setTitleColor:MainColor forState:UIControlStateNormal];
    [self.dateBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.dateBtn.tag = 1;
    [bView addSubview:self.dateBtn];
    [self.dateBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bArIcon.mas_left);
        make.centerY.equalTo(bView);
    }];
    
    self.sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    self.sendBtn.frame = CGRectMake(topToMargin, bView.botoom+50, SCREEN_WIDTH-30, 45);
    self.sendBtn.layer.masksToBounds = YES;
    self.sendBtn.layer.cornerRadius = 4;
    [self.sendBtn setTitle:@"立即发放" forState:UIControlStateNormal];
    [self.sendBtn setTitleColor:whiteC forState:UIControlStateNormal];
    self.sendBtn.backgroundColor = orangeC;
    [self.sendBtn addTarget:self action:@selector(sendBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.sendBtn];

}

-(void)selectBtnAction:(UIButton *)sender{
    if (sender.tag == 0) {
        HWLog(@"%ld",(long)sender.tag);
        SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:@"" TitleArr:@[@"通用",@"雁塔店",@"未央店",@"长安店"]];
        [single showView:^(NSString *singleStr) {
            [sender setTitle:singleStr forState:UIControlStateNormal];
        }];
    }
    else{
        HWLog(@"%ld",(long)sender.tag);
        DateSelectView *date = [[DateSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectDateTtitle:@""];
        [date showDateView:^(NSString *selectStr) {
            [sender setTitle:selectStr forState:UIControlStateNormal];
        }];
    }
}


//发放
-(void)sendBtnClick{
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
