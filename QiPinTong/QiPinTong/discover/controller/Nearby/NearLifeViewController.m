//
//  NearLifeViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/25.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "NearLifeViewController.h"

@interface NearLifeViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation NearLifeViewController

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
        
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    YSYKLayout *lay = [[YSYKLayout alloc]initYsykListCell];
    return lay.businessCellHeight;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YSYKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ee"];
    if (cell == nil) {
        cell = [[YSYKTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ee"];
        
        
        
    }

    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
