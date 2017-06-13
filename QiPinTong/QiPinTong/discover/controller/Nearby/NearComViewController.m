//
//  FamousComViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/25.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "NearComViewController.h"

@interface NearComViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation NearComViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT - 64 -50)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return SubCellHeight;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NearComTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bb"];
    cell = [[NearComTableViewCell alloc]initWithFrame:cell.bounds];
    
    cell.imgView.image = [UIImage imageNamed:@"zwListImage.jpg"];
    cell.nameLab.text = @"康威通信国际";
    cell.industryLab.text = @"移动互联网,O2O";
    cell.addressIcon.image= [UIImage imageNamed:@"locationIcon"];
    cell.addressLab.text = @"西安市南三环i都会  2.5km";
    cell.eyeLab.text = @"3228";
    cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
    
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
