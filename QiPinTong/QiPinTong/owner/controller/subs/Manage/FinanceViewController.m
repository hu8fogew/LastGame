//
//  TotalGetViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/15.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "FinanceViewController.h"

@interface FinanceViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation FinanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    self.navigationItem.title = @"财务统计";
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.backgroundColor = whiteC;
        _tableView.sectionFooterHeight = 0;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    vi.backgroundColor = grayC;
    
    return vi;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return topToMargin;
    }
    return leftToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSArray *fAry = @[@"今日开通提现",@"今日提现金额",@"累计开通提现",@"累计提现金额"];
    NSArray *sAry = @[@"今日充值用户",@"今日充值金额",@"累计充值用户",@"累计充值金额"];
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
        cell.titleLabel.text = indexPath.section==0?fAry[indexPath.row]:sAry[indexPath.row];
        cell.selectLabel.textColor = MainColor;
        cell.selectLabel.text = @"22";
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    FinanceDetailViewController *vc = [FinanceDetailViewController new];
    vc.sectionIndex = indexPath.section;
    vc.rowIndex = indexPath.row;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
