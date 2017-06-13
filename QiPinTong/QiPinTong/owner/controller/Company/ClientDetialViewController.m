//
//  ClientDetialViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/24.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ClientDetialViewController.h"

@interface ClientDetialViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *footerView;


@end

@implementation ClientDetialViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    self.navigationItem.title = @"客户列表";
}

#pragma mark /--------footerView--------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _footerView.backgroundColor = whiteC;
        
        UILabel *total = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:_footerView];
        //        total.text = [[NSString stringWithFormat:@"%ld",self.dateSource.count] stringByAppendingString:@"位成员"];
        NSInteger num = 10;
        total.text = [[NSString stringWithFormat:@"%ld",num] stringByAppendingString:@"位成员"];
        [total mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_footerView);
        }];
    }
    return _footerView;
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
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
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
        [cell.imgView sd_setImageWithURL:nil placeholderImage: [UIImage imageNamed:@"classics.jpg"]];
        cell.titleLab.text = @"大话西游";
        cell.addressLab.text = @"中国 香港";
        cell.dateLab.text = @"05-05 11:40:32";
    }
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
