//
//  RankingListViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TodayRankViewController.h"

@interface TodayRankViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation TodayRankViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"今日排行";
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
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
        if (indexPath.section==1) {
            cell.titleLabel.text = [[NSString stringWithFormat:@"%ld  ",indexPath.row+4]  stringByAppendingString:@"西安企聘通信息技术有限公司"];
        }
        else{
            NSString *str = [[NSString stringWithFormat:@"%ld  ",indexPath.row+1] stringByAppendingString:@"苏州企聘通信息技术有限公司"];
            NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc]initWithString:str];
            NSArray *arr = @[redC,blueC,orangeC];
            [attributed addAttribute:NSForegroundColorAttributeName value:arr[indexPath.row] range:NSMakeRange(0, 1)];
            cell.titleLabel.attributedText = attributed;
        }
        cell.cityLab.text = @"西安市";
        cell.arrowIcon.image = [UIImage imageNamed:@""];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
