//
//  IdentitySwitchViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "IdentitySwitchViewController.h"

@interface IdentitySwitchViewController ()

//图像
@property (strong,nonatomic) UIImageView *imgView;

//姓名
@property (strong,nonatomic) UILabel *nameLab;

//个人按钮
@property (strong,nonatomic) UIButton *perBtn;
//企业按钮
@property (strong,nonatomic) UIButton *comBtn;
//商户
@property (strong ,nonatomic) UIButton *businessBtn;

//@property (nonatomic,assign) BOOL isPerson;


@end

@implementation IdentitySwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"切换身份";
    self.view.backgroundColor = whiteC;
    [self creatHeaderView];
    
//    self.isPerson = [QPTUserInfoManager sharedUserInfoManager].isPerson;
    
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [self creatSelectButton];
}

-(void)viewDidDisappear:(BOOL)animated
{
    [self.comBtn removeFromSuperview];
    self.comBtn = nil;
    [self.perBtn removeFromSuperview];
    self.perBtn = nil;
    
    [self.businessBtn removeFromSuperview];
    self.businessBtn = nil;
}


-(void) creatHeaderView
{
    UIImageView *backImg = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.55)];
    backImg.image = [UIImage imageNamed:@"qh_bg"];
    [self.view addSubview:backImg];
    
    self.imgView = [UIImageView new];
    self.imgView.image = [UIImage imageNamed:@"perImage.jpg"];
    self.imgView.layer.masksToBounds = YES;
    self.imgView.layer.cornerRadius = SubImageSize.width/2;
    [self.view addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(SubImageSize);
        make.centerY.equalTo(backImg.mas_bottom);
    }];
    
    self.nameLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self.view];
    self.nameLab.text = @"你好,苗仔";
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView.mas_bottom).offset(leftToMargin);
        make.centerX.equalTo(self.view);
    }];
    
    UILabel *showLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self.view];
    showLab.text = @"企聘通，无所不能...";
    [showLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.mas_equalTo(-25);
    }];
}


//创建按钮
-(void)creatSelectButton
{
    
    self.perBtn = [self creatBtnWithFrame:CGRectMake(30, SCREEN_WIDTH*0.85, SCREEN_WIDTH-60, 50) andTag:100 andIsPerson:[QPTUserInfoManager sharedUserInfoManager].isPerson andText:@"我是个人" andImg:[QPTUserInfoManager sharedUserInfoManager].isPerson ? @"gerenN":@"gerenS"];
    
    self.comBtn = [self creatBtnWithFrame:CGRectMake(self.perBtn.left, self.perBtn.botoom+25, self.perBtn.width, self.perBtn.height) andTag:101 andIsPerson:[QPTUserInfoManager sharedUserInfoManager].isCompany andText:@"我是企业" andImg: [QPTUserInfoManager sharedUserInfoManager].isCompany ? @"qiyeN" : @"qiyeS"];
    
    self.businessBtn = [self creatBtnWithFrame:CGRectMake(self.perBtn.left, self.comBtn.botoom+25, self.perBtn.width, self.perBtn.height) andTag:102 andIsPerson:[QPTUserInfoManager sharedUserInfoManager].isBusiness andText:@"我是商户" andImg:[QPTUserInfoManager sharedUserInfoManager].isBusiness ? @"shanghuiN" : @"shanghuiS"];
}


-(UIButton *)creatBtnWithFrame:(CGRect)frame andTag:(NSInteger)tag andIsPerson:(BOOL)isPerson andText:(NSString *)str andImg:(NSString *)imgStr
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = frame;
    btn.layer.borderColor = blueC.CGColor;
    btn.layer.borderWidth = 1;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 25;
    btn.selected = isPerson;
    [btn setImage:[UIImage imageNamed:@"whiteView"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"blueView"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(clickSelecetAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.adjustsImageWhenHighlighted = NO;
    btn.tag = tag;
    
    UIImageView *iconView = [UIImageView new];
    iconView.image = [UIImage imageNamed:imgStr];
    
    [btn addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(topToMargin);
        make.centerY.equalTo(btn);
        make.size.mas_equalTo(CGSizeMake(30, 30));
    }];
    
    UILabel *lab = [UILabel labelWithTextColor:isPerson?whiteC:blueC FontSize:MTitleSize Sview:btn];
    lab.text = str;
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(leftToMargin);
        make.centerY.equalTo(iconView);
    }];
    
    UIImageView *selectImg = [UIImageView new];
    selectImg.image = [UIImage imageNamed:isPerson ? @"selected_icon_white":@""];
    [btn addSubview:selectImg];
    [selectImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-topToMargin);
        make.centerY.equalTo(btn);
        make.size.equalTo(iconView);
    }];
    
    [self.view addSubview:btn];
    return btn;
}


-(void)clickSelecetAction:(UIButton *)sender{

    if (sender.tag ==100) {

        [QPTFileCacheManger saveUserData:@"个人" forKey:QPTComOrPerOrBusinessIdentifier];
        
    }
    if (sender.tag ==101) {

        [QPTFileCacheManger saveUserData:@"企业" forKey:QPTComOrPerOrBusinessIdentifier];
        
    }
    if (sender.tag == 102) {
        [QPTFileCacheManger saveUserData:@"商户" forKey:QPTComOrPerOrBusinessIdentifier];
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
