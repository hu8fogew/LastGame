//
//  MyProfitViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/1/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WalletViewController.h"

@interface WalletViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>
{
    UILabel *balanceLab;
    UILabel *todayProfitLab;
    UILabel *totolProfitLab;
    UIButton *chargeBtn;
    UIButton *openBtn;
}

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;

//提现规则
@property (strong,nonatomic) UIView *coverView;
@property (strong,nonatomic) UIView *ruleView;

@end

@implementation WalletViewController
id walletCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.navigationItem.title = @"我的钱包";
    
    [self.view addSubview:self.tableView];
    
    [self.ruleView addSubview:({
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        closeBtn.frame = CGRectMake(self.ruleView.width-35, 10, 25, 25);
        closeBtn.adjustsImageWhenHighlighted = NO;
        [closeBtn setImage:[UIImage imageNamed:@"rClose_gray"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        closeBtn;
    })];
    
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

#pragma mark /*-----headerView-------*/

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, [QPTUserInfoManager sharedUserInfoManager].isCompany?SCREEN_HEIGHT*0.7-60:SCREEN_HEIGHT*0.7)];
        
        //余额
        UILabel *titleLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:_headerView];
        titleLabel.text = @"余额 (元)";
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headerView);
            make.top.mas_equalTo(SCREEN_WIDTH*0.12);
        }];
        ////
        balanceLab = [UILabel labelWithTextColor:MainColor FontSize:50 Sview:_headerView];
        balanceLab.font = [UIFont boldSystemFontOfSize:50];
        balanceLab.text = @"1.00";
        [balanceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headerView);
            make.top.equalTo(titleLabel.mas_bottom).offset(SCREEN_WIDTH/20);
        }];
        
        //灰横线
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [_headerView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(balanceLab.mas_bottom).offset(SCREEN_WIDTH*0.1);
            make.left.equalTo(_headerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
        
        //灰竖线
        UIView *hv = [UIView new];
        hv.backgroundColor = grayC;
        [_headerView addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headerView);
            make.centerY.equalTo(vv).offset(SCREEN_WIDTH*0.18);
            make.size.mas_equalTo(CGSizeMake(1, 70));
        }];
        
        //今日收益
        UILabel *todayLabel = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:_headerView];
        todayLabel.text = @"今日收益(个)";
        [todayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(-SCREEN_WIDTH/4);
            make.top.equalTo(hv).offset(leftToMargin);
        }];
        ////
        todayProfitLab = [UILabel labelWithTextColor:MainColor FontSize:23 Sview:_headerView];
        todayProfitLab.font = [UIFont boldSystemFontOfSize:23];
        todayProfitLab.text = @"0";
        [todayProfitLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(todayLabel);
            make.top.equalTo(todayLabel.mas_bottom).offset(topToMargin);
        }];
        
        //
        //累计收益
        UILabel *totalLabel = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:_headerView];
        totalLabel.text = @"累计收益(个)";
        [totalLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(SCREEN_WIDTH/4);
            make.centerY.equalTo(todayLabel);
        }];
        //
        totolProfitLab = [UILabel labelWithTextColor:MainColor FontSize:23 Sview:_headerView];
        totolProfitLab.font = [UIFont boldSystemFontOfSize:23];
        totolProfitLab.text = @"10";
        [totolProfitLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(todayProfitLab);
            make.centerX.equalTo(totalLabel);
        }];
        
        //开通提现按钮
        if ([QPTUserInfoManager sharedUserInfoManager].isPerson) {
            openBtn = [self createBtnWithTitle:@"开通提现" andTitleColor:whiteC andBackColor:HWColor(247, 192, 10) andFont:MTitleSize+1 andTag:11 andAction:@selector(walletBtnClick:) andSview:_headerView];
            openBtn.layer.cornerRadius = 3;
            [openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.bottom.mas_equalTo(-topToMargin);
                make.centerX.equalTo(_headerView);
                make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
            }];
        }
        
        //充值按钮
        chargeBtn = [self createBtnWithTitle:@"充值" andTitleColor:whiteC andBackColor:blueC andFont:MTitleSize+1 andTag:10 andAction:@selector(walletBtnClick:) andSview:_headerView];
        chargeBtn.layer.cornerRadius = 3;
        [chargeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            if ([QPTUserInfoManager sharedUserInfoManager].isCompany) {
                make.bottom.mas_equalTo(-topToMargin);
            }else{
                make.bottom.mas_equalTo(-75);
            }
            make.centerX.equalTo(_headerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
        
        //
        //收支明细按钮
        UIButton *profitDeBtn = [self createBtnWithTitle:@"收支明细" andTitleColor:SecondTitleColor andBackColor:clearC andFont:subTitleSize+1 andTag:12 andAction:@selector(walletBtnClick:) andSview:_headerView];
        [profitDeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.left.mas_equalTo(leftToMargin);
        }];
        
        UIView *view = [UIView new];
        if ([QPTUserInfoManager sharedUserInfoManager].isBusiness) {
            view.backgroundColor = clearC;
        }else{
            view.backgroundColor = grayC;
        }
        [_headerView addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.equalTo(_headerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
        
        //提现规则
        if ([QPTUserInfoManager sharedUserInfoManager].isPerson) {
            UIButton *ruleBtn = [self createBtnWithTitle:@"提现规则" andTitleColor:SecondTitleColor andBackColor:clearC andFont:subTitleSize+1 andTag:13 andAction:@selector(walletBtnClick:) andSview:_headerView];
            [ruleBtn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-leftToMargin);
                make.centerY.equalTo(profitDeBtn);
            }];
        }
        
    }
    return _headerView;
}

-(void)walletBtnClick:(UIButton *)btn{
    if (btn.tag == 10) {
        //充值
        MyCoinViewController *vc = [MyCoinViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag == 11) {
        //开通提现
        CoinOpenViewController *vc = [CoinOpenViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag == 12) {
        //收支明细
        ProfitDeViewController *vc = [ProfitDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (btn.tag == 13) {
        [UIView animateWithDuration:0.3 animations:^{
            [self.view addSubview:self.coverView];
        }];
    }
}

-(void)closeBtnClick{
    [UIView animateWithDuration:0.3 animations:^{
        [self.coverView removeFromSuperview];
    }];
}

#pragma mark -------提现规则视图----------
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
        _ruleView = [[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT*0.22-32, SCREEN_WIDTH-40, SCREEN_HEIGHT*0.56)];
        _ruleView.backgroundColor = whiteC;
        
        CGFloat distanceH = _ruleView.height/20;
        
        UILabel *title = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+1 Sview:_ruleView];
        title.text = @"提现规则";
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
        firstLab.attributedText = [self attributedString:@"开通提现功能须充值20元，提现最高额度5元/天；"];
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
        secondLab.attributedText = [self attributedString:@"币斗通币数量达500个或以上，7个工作日后，最高额度10元/天；"];
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
        threeLab.attributedText = [self attributedString:@"币斗通币数量达10000个或以上，7个工作日后，最高额度500元/天；"];
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
        fourLab.attributedText = [self attributedString:@"币斗通币数量达100000个或以上，7个工作日后，最高额度3000元/天；"];
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

#pragma mark /*-----tableView-------*/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([QPTUserInfoManager sharedUserInfoManager].isPerson) {
        return 2;
    }
    else if ([QPTUserInfoManager sharedUserInfoManager].isCompany){
        return 1;
    }
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WalletTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    cell = [[WalletTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ce"];
    if ([QPTUserInfoManager sharedUserInfoManager].isPerson) {
        walletCell = cell;
        cell.icon.image = [UIImage imageNamed:indexPath.row==0?@"coindou_image":@"feedback_icon"];
        cell.title.textColor = indexPath.row==0?grayBlueC:MainColor;
        cell.title.text = @[@"通币赚米",@"帮助与反馈"][indexPath.row];
        cell.showLab.text = indexPath.row==0?@"立即转入":nil;
    }
    else{
        walletCell = cell;
        cell.icon.image = [UIImage imageNamed:@"feedback_icon"];
        cell.title.textColor = MainColor;
        cell.title.text = @"帮助与反馈";
    }
    
    return walletCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    CoinDouViewController *douVC = [CoinDouViewController new];
    FeedbackViewController *vc = [FeedbackViewController new];
    [self.navigationController pushViewController:indexPath.row==0?douVC:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIButton *)createBtnWithTitle:(NSString *)title andTitleColor:(UIColor *)color andBackColor:(UIColor *)backColor andFont:(CGFloat)font andTag:(NSInteger)tag andAction:(SEL)action andSview:(UIView *)sView{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:color forState:UIControlStateNormal];
    [btn setBackgroundColor:backColor];
    btn.tag = tag;
    btn.titleLabel.font = [UIFont systemFontOfSize:font];
    [btn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
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

@end
