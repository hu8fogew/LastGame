//
//  TeamDetailViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TeamDetailViewController.h"

@interface TeamDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) UIView *footerView;
@end

@implementation TeamDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
}

#pragma mark ------headerView---------
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.23)];
        _headerView.backgroundColor = blueC;
        
        UIView *vv = [UIView new];
        vv.backgroundColor = whiteC;
        [_headerView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_headerView);
            make.size.mas_equalTo(CGSizeMake(1, SCREEN_WIDTH*0.1));
        }];
        
        //钱包
        UILabel *wallet = [UILabel labelWithTextColor:whiteC FontSize:MTitleSize Sview:_headerView];
        wallet.text = @"钱包";
        [wallet mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(-SCREEN_WIDTH/4);
            make.bottom.equalTo(_headerView.mas_centerY).offset(-5);
        }];
        UILabel *walletNum = [UILabel labelWithTextColor:whiteC FontSize:23 Sview:_headerView];
        walletNum.font = [UIFont systemFontOfSize:23 weight:UIFontWeightMedium];
        walletNum.text = @"13.30";
        [walletNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(wallet);
            make.top.equalTo(_headerView.mas_centerY);
        }];
        
        //币斗
        UILabel *coin = [UILabel labelWithTextColor:whiteC FontSize:MTitleSize Sview:_headerView];
        coin.text = @"币斗";
        [coin mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(SCREEN_WIDTH/4);
            make.centerY.equalTo(wallet);
        }];
        UILabel *coinNum = [UILabel labelWithTextColor:whiteC FontSize:23 Sview:_headerView];
        coinNum.font = [UIFont systemFontOfSize:23 weight:UIFontWeightMedium];
        coinNum.text = @"0.00";
        [coinNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(coin);
            make.centerY.equalTo(walletNum);
        }];
        
    }
    return _headerView;
}

#pragma mark --------footerView--------
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT*0.55)];
        
        UIButton *changeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        changeBtn.frame = CGRectMake(20, _footerView.height-70,SCREEN_WIDTH*0.7-40, formBtnHeight);
        changeBtn.backgroundColor = whiteC;
        changeBtn.layer.borderColor = SecondTitleColor.CGColor;
        changeBtn.layer.borderWidth = 1;
        changeBtn.layer.masksToBounds = YES;
        changeBtn.layer.cornerRadius = 3;
        [changeBtn setTitle:@"岗位调整" forState:UIControlStateNormal];
        [changeBtn setTitleColor:MainColor forState:UIControlStateNormal];
        changeBtn.tag = 0;
        [changeBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:changeBtn];
        
        UIButton *deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        deleteBtn.frame = CGRectMake(changeBtn.right+20, _footerView.height-70,SCREEN_WIDTH*0.3-20, formBtnHeight);
        deleteBtn.backgroundColor = whiteC;
        deleteBtn.layer.borderColor = SecondTitleColor.CGColor;
        deleteBtn.layer.borderWidth = 1;
        deleteBtn.layer.masksToBounds = YES;
        deleteBtn.layer.cornerRadius = 3;
        [deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [deleteBtn setTitleColor:redC forState:UIControlStateNormal];
        deleteBtn.tag = 1;
        [deleteBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:deleteBtn];
    }
    return _footerView;
}

-(void)btnClick:(UIButton *)btn{
    if (btn.tag==0) {
        PostChangeViewController *vc = [PostChangeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark /-------tableView-------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        _tableView.backgroundColor = grayC;
        _tableView.sectionFooterHeight = 0;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 2;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return leftToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[DiscoverTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.icon.image = [UIImage imageNamed: indexPath.section==0?@[@"person_icon",@"company_icon"][indexPath.row]:@"empty"];
        cell.title.text = indexPath.section==0?@[@"今日新增",@"用户统计"][indexPath.row]:@"财务统计";
        cell.showLab.text = indexPath.section==0?@"2":nil;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TodayAddViewController *todayVC = [TodayAddViewController new];
    FinanceViewController *financeVC = [FinanceViewController new];
    [self.navigationController pushViewController:indexPath.section==0?todayVC:financeVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
