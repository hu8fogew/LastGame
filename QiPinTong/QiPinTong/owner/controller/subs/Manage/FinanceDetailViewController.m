//
//  FinanceDetailViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "FinanceDetailViewController.h"

@interface FinanceDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;


@end

@implementation FinanceDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    NSArray *fAry = @[@"今日开通提现",@"今日提现金额",@"累计开通提现",@"累计提现金额"];
    NSArray *sAry = @[@"今日充值用户",@"今日充值金额",@"累计充值用户",@"累计充值金额"];
    
    self.navigationItem.title = self.sectionIndex==0?fAry[self.rowIndex]:sAry[self.rowIndex];
    
}


#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 8;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    headView.backgroundColor = grayC;
    
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return topToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return DeCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TAddDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
    if (cell == nil) {
        cell = [[TAddDetailTableViewCell alloc]initWithFrame:cell.bounds isSelect:YES];
        if (self.sectionIndex==0) {
            if (self.rowIndex==0) {
                cell.imgView.image = [UIImage imageNamed:@"classics.jpg"];
                cell.titleLab.text = @"沈敏华";
                cell.addressLab.text = @"上海市";
                cell.dateLab.text = @"05-05 11:40:32";
            }
            else if (self.rowIndex==1) {
                cell.imgView.image = [UIImage imageNamed:@"MF"];
                cell.titleLab.text = @"小王吧";
                cell.addressLab.text = @"西安市";
                cell.dateLab.text = @"05-05 11:40:32";
                cell.showLab.text = @"¥10.00";
            }
            else if (self.rowIndex==2) {
                cell.imgView.image = [UIImage imageNamed:@"MS"];
                cell.titleLab.text = @"纵横四海";
                cell.addressLab.text = @"广东省 深圳市";
                cell.dateLab.text = @"05-05 11:40:32";
            }
            else{
                cell.imgView.image = [UIImage imageNamed:@"classics.jpg"];
                cell.titleLab.text = @"纵横四海";
                cell.addressLab.text = @"广东省 深圳市";
                cell.dateLab.text = @"05-05 11:40:32";
                cell.showLab.text = @"9次1501元";
            }
        }
        
        if (self.sectionIndex==1) {
            if (self.rowIndex==0) {
                cell.imgView.image = [UIImage imageNamed:@"classics.jpg"];
                cell.titleLab.text = @"沈敏华";
                cell.addressLab.text = @"上海市";
                cell.dateLab.text = @"05-05 11:40:32";
            }
            else if (self.rowIndex==1) {
                cell.imgView.image = [UIImage imageNamed:@"MF"];
                cell.titleLab.text = @"小王吧";
                cell.addressLab.text = @"西安市";
                cell.dateLab.text = @"05-05 11:40:32";
                cell.showLab.text = @"¥103.00";
            }
            else if (self.rowIndex==2) {
                cell.imgView.image = [UIImage imageNamed:@"MS"];
                cell.titleLab.text = @"纵横四海";
                cell.addressLab.text = @"广东省 深圳市";
                cell.dateLab.text = @"05-05 11:40:32";
            }
            else{
                cell.imgView.image = [UIImage imageNamed:@"classics.jpg"];
                cell.titleLab.text = @"纵横四海";
                cell.addressLab.text = @"广东省 深圳市";
                cell.dateLab.text = @"05-05 11:40:32";
                cell.showLab.text = @"9次1501元";
            }

        }
        
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
