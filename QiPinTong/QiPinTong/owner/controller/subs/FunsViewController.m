//
//  FunsViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/8.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "FunsViewController.h"

@interface FunsViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) SGSegmentedControl *segment;

@property (strong,nonatomic) NSString *segStr;

@end

@implementation FunsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"我的粉丝";

    [self.view addSubview:self.tableView];
    
}

#pragma mark /--------headerView---------/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
        _headerView.backgroundColor = grayC;
        
        NSArray *arr = @[@"我的粉丝",@"我的关注"];
        self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arr];
        self.segment.backgroundColor = whiteC;
        self.segment.titleColorStateNormal = MainColor;
        self.segment.titleColorStateSelected = blueC;
        self.segment.indicatorColor = blueC;
        [self.headerView addSubview:self.segment];
        
    }
    return _headerView;
}


-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    if (index == 0) {
        HWLog(@"0");
        self.segStr = @"我的粉丝";
        [self.tableView reloadData];
        
    }
    
    else{
        HWLog(@"2");
        self.segStr = @"我的关注";
        [self.tableView reloadData];
       
    }
}

#pragma mark /----------tableview及方法----------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = NO;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;

    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return DeCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    FunsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"c"];
    cell = [[FunsTableViewCell alloc]initWithFrame:cell.bounds];
    cell.imgView.image = [UIImage imageNamed:@"classics.jpg"];
    cell.nameLab.text = @"小博士";
    cell.addressLab.text = @"陕西省 西安市";
    [cell.addBtn addTarget:self action:@selector(addBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}

-(void)addBtnClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        HWLog(@"add");

    }
    HWLog(@"no");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
