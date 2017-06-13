//
//  AddUserViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/6/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "AddUserViewController.h"

@interface AddUserViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation AddUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"添加用户";
    self.view.backgroundColor = whiteC;
    
    [self.view addSubview:self.tableView];
}

#pragma mark ------tableView-------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.sectionFooterHeight = 0;
        _tableView.separatorStyle = NO;
        _tableView.backgroundColor = grayC;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return topToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cia"];
    if (cell == nil) {
        cell = [[DiscoverTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cia"];
        cell.selectionStyle = NO;
        cell.icon.image = [UIImage imageNamed:@[@"person_icon",@"company_icon",@"business_icon"][indexPath.row]];
        cell.title.text = @[@"添加个人",@"添加企业",@"添加商户"][indexPath.row];
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    AddFriendsViewController *friendVC = [AddFriendsViewController new];
    [self.navigationController pushViewController:friendVC animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
