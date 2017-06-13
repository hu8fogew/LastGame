//
//  ProfitDeViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/1/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ProfitDeViewController.h"

@interface ProfitDeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation ProfitDeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    
    self.navigationItem.title = @"收支明细";
    
}

#pragma mark /*-----tableView-------*/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.sectionFooterHeight = 0;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 5;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 30;
}

//自定义分组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
    headView.backgroundColor = grayC;

    NSArray *titleArray = @[@"2016年12月",@"2016年11月",@"2016年10月"];
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.frame = CGRectMake(10, 5, SCREEN_WIDTH*0.4, 20);
    titleLabel.textColor = SecondTitleColor;
    titleLabel.text = titleArray[section];

    
    UILabel *amountLabel = [[UILabel alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.6, 5, SCREEN_WIDTH*0.4-10, 20)];
    amountLabel.textAlignment = NSTextAlignmentRight;
    amountLabel.textColor = SecondTitleColor;
    
    amountLabel.text = @"余额 : 23";  //
    
    [headView addSubview:amountLabel];
    [headView addSubview:titleLabel];

    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return SCREEN_WIDTH*0.2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    ProfitDeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cee"];
    if (cell == nil) {
        cell = [[ProfitDeTableViewCell alloc]initWithFrame:cell.bounds];
        cell.titleLab.text = @"新人福利";
        cell.timeLab.text = @"11-20 20:50";
        cell.amountLab.text = @"+23";
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
