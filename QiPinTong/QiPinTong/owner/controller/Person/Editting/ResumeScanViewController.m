//
//  ResumeScanViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/21.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ResumeScanViewController.h"

@interface ResumeScanViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation ResumeScanViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"简历预览";
    
    [self.view addSubview:self.tableView];
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    ResumeScanCellLayout *layout = [[ResumeScanCellLayout alloc]initWithResumeScanCell];
    return layout.resumeScanCellH;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ResumeScanTableViewCell *cell = [[ResumeScanTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cc"];
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
