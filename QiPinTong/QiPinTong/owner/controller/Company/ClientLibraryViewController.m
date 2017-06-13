//
//  ClientLibraryViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ClientLibraryViewController.h"

@interface ClientLibraryViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;

@end

@implementation ClientLibraryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"客户库";
    [self.view addSubview:self.tableView];
    
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


#pragma mark --------headerView----------
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH/3)];
        _headerView.backgroundColor = blueC;
        
        UILabel *totalLab = [UILabel labelWithTextColor:whiteC FontSize:MTitleSize Sview:_headerView];
        totalLab.text = @"客户总量";
        [totalLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headerView);
            make.bottom.equalTo(_headerView.mas_centerY).offset(-leftToMargin);
        }];
        
        UILabel *num = [UILabel labelWithTextColor:whiteC FontSize:30 Sview:_headerView];
        num.text = @"1";
        [num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(totalLab);
            make.top.equalTo(_headerView.mas_centerY);
        }];
    }
    return _headerView;
}


#pragma mark --------tableView----------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        _tableView.backgroundColor = grayC;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return leftToMargin;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[DiscoverTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        cell.selectionStyle = NO;
        cell.icon.image = [UIImage imageNamed:indexPath.section==0?@"jrsy_image":@"ljsy_image"];
        cell.title.text = indexPath.section==0?@"今日新增":@"客户明细";
        cell.showLab.textColor = MainColor;
        cell.showLab.text = indexPath.section==0?@"2":nil;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TodayAddViewController *todayVC = [TodayAddViewController new];
    ClientDetialViewController *detailVC = [ClientDetialViewController new];
    [self.navigationController pushViewController:indexPath.section==0?todayVC:detailVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
