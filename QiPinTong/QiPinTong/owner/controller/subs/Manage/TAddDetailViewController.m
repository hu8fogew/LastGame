//
//  TodayGetViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/15.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TAddDetailViewController.h"

@interface TAddDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *footerView;


@end

@implementation TAddDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
    if (self.cellClickIndex==0) {
        self.navigationItem.title = @"商户列表";
    }
    if (self.cellClickIndex==1) {
        self.navigationItem.title = @"企业列表";
    }
    if (self.cellClickIndex==2) {
        self.navigationItem.title = @"个人列表";
    }
    
}

#pragma mark /--------footerView--------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _footerView.backgroundColor = whiteC;
    
        UILabel *total = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:_footerView];
//        total.text = [[NSString stringWithFormat:@"%ld",self.dateSource.count] stringByAppendingString:@"位成员"];
        NSInteger num = 0;
        if (self.cellClickIndex==0) {
            num = 1;
        }
        if (self.cellClickIndex==1) {
            num = 2;
        }
        if (self.cellClickIndex==2) {
            num = 3;
        }
        total.text = [[NSString stringWithFormat:@"%ld",num] stringByAppendingString:@"位成员"];
        [total mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_footerView);
        }];
    }
    return _footerView;
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.cellClickIndex==0) {
        return 1;
    }
    if (self.cellClickIndex==1) {
        return 2;
    }
    if (self.cellClickIndex==2) {
        return 3;
    }
    
    return 0;
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
    
    return DeCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TAddDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
    if (cell == nil) {
        cell = [[TAddDetailTableViewCell alloc]initWithFrame:cell.bounds isSelect:NO];
        if (self.cellClickIndex==0) {
            [cell.imgView sd_setImageWithURL:nil placeholderImage: [UIImage imageNamed:@"classics.jpg"]];
            cell.titleLab.text = @"大话西游";
            cell.addressLab.text = @"中国 香港";
            cell.dateLab.text = @"05-05 11:40:32";
        
        }
        if (self.cellClickIndex==1) {
            cell.imgView.image = [UIImage imageNamed:@"MF"];
            cell.titleLab.text = @"一笑奈何";
            cell.addressLab.text = @"陕西省 西安市";
            cell.dateLab.text = @"05-05 11:40:32";
        }
        if (self.cellClickIndex==2) {
            cell.imgView.image = [UIImage imageNamed:@"MS"];
            cell.titleLab.text = @"纵横四海";
            cell.addressLab.text = @"广东省 深圳市";
            cell.dateLab.text = @"05-05 11:40:32";
        }
       
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.cellClickIndex==0) {
        
    }
    if (self.cellClickIndex==1) {
        YCComDeViewController *vc = [YCComDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    if (self.cellClickIndex==2) {
        YCPersonDeViewController *vc = [YCPersonDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
