//
//  RankingViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "RankingViewController.h"

@interface RankingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation RankingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"排行帮";
    [self.view addSubview:self.tableView];
}

#pragma mark ------tableView-------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = grayC;
        _tableView.separatorStyle = NO;
        _tableView.sectionFooterHeight = 0;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return section==0?3:10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return leftToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return DeCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TeamListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[TeamListTableViewCell alloc]initWithFrame:cell.bounds];
        if (indexPath.section==1) {
            cell.addressLab.text = [NSString stringWithFormat:@"%ld  ",indexPath.row+4];
        }
        else{
            NSString *str = [NSString stringWithFormat:@"%ld  ",indexPath.row+1];
            NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc]initWithString:str];
            NSArray *arr = @[redC,blueC,orangeC];
            [attributed addAttribute:NSForegroundColorAttributeName value:arr[indexPath.row] range:NSMakeRange(0, 1)];
            cell.addressLab.attributedText = attributed;
        }
        [cell.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"classics.jpg"]];
        cell.nameLab.text = @"小跳蛙";
        cell.departmentLab.text = @"技术部";
        cell.dateLab.text = @"西安市";
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
