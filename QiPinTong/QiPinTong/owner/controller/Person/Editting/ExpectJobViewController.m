//
//  ExpectJobViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/2/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ExpectJobViewController.h"

@interface ExpectJobViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *footerView;

@end

@implementation ExpectJobViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"管理求职意向";

    [self.view addSubview:self.tableView];
    
}

#pragma mark /-------footerView----------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        _footerView.backgroundColor = whiteC;
        
        UIButton *addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [addBtn setTitle:@"添加期望职位" forState:UIControlStateNormal];
        [addBtn setImage:[UIImage imageNamed:@"add_icon_nav"] forState:UIControlStateNormal];
        addBtn.backgroundColor = blueC;
        addBtn.layer.masksToBounds = YES;
        addBtn.layer.cornerRadius = 3;
        [addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:addBtn];
        [addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(_footerView);
            make.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
         
    }
    return _footerView;
}

-(void)addBtnClick:(UIButton *)sender{
    HWLog(@"a");
    ExpectAddViewController *vc = [ExpectAddViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark /------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        _tableView.separatorStyle = NO;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
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
    
    return SCREEN_WIDTH*0.2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ExpectJobTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ca"];
    cell = [[ExpectJobTableViewCell alloc]initWithFrame:cell.bounds];
    cell.addressLabel.text = @"[西安]";
    cell.postLabel.text = @"iOS开发程序猿";
    cell.salaryLabel.text = @"7k-8k";
    cell.industryLabel.text = @"不限";
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    ExpectAddViewController *vc = [ExpectAddViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
