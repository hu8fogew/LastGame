//
//  ShareRecordViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/6/8.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ShareRecordViewController.h"

@interface ShareRecordViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;

@property (strong,nonatomic) SGSegmentedControl *segment;
@property (strong,nonatomic) NSString *segStr;

@end

@implementation ShareRecordViewController

id shareCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"达人帮";
    
    [self.view addSubview:self.tableView];
    
}

#pragma mark /*-----headerView------*/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _headerView.backgroundColor = grayC;
        
        self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:@[@"共享邀请",@"已共享"]];
        self.segment.backgroundColor = whiteC;
        self.segment.titleColorStateNormal = MainColor;
        self.segment.titleColorStateSelected = blueC;
        self.segment.indicatorColor = blueC;
        [_headerView addSubview:self.segment];
        
        
    }
    return _headerView;
}
-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    if (index == 0) {
        HWLog(@"0");
        self.segStr = @"共享邀请";
        [self.tableView reloadData];
        
    }
    else {
        HWLog(@"1");
        self.segStr = @"高薪职位";
        [self.tableView reloadData];
    }
}

#pragma mark /*------tableView及方法------*/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO ;
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
    TalentGangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if ([self.segStr isEqualToString:@"共享邀请"]) {
        if (cell == nil) {
            cell = [[TalentGangTableViewCell alloc]initWithFrame:cell.bounds];
            shareCell = cell;
            [cell.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"classics.jpg"]];
            cell.nameLab.text = @"叶冬梅";
            cell.sexIcon.image = [UIImage imageNamed:@"femaleIcon"];
            cell.addressLab.text = @"西安市";
            cell.numIcon.image = [UIImage imageNamed:@"eyeIcon"];
            cell.numLab.text = @"30";
            
            [cell.shareBtn setTitleColor:whiteC forState:UIControlStateNormal];
            [cell.shareBtn setTitle:@"同意" forState:UIControlStateNormal];
            [cell.shareBtn setTitle:@"已接受" forState:UIControlStateSelected];
            cell.shareBtn.backgroundColor = blueC;
            [cell.shareBtn addTarget:self action:@selector(shareBtnClick:) forControlEvents:UIControlEventTouchUpInside];
            
        }
    }
    else{
        if (cell == nil) {
            cell = [[TalentGangTableViewCell alloc]initWithFrame:cell.bounds];
            shareCell = cell;
            [cell.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"classics.jpg"]];
            cell.nameLab.text = @"叶冬梅";
            cell.sexIcon.image = [UIImage imageNamed:@"femaleIcon"];
            cell.addressLab.text = @"西安市";
            cell.numIcon.image = [UIImage imageNamed:@"gFans"];
            cell.numLab.text = @"30";
            cell.didShareLab.text = @"已共享";
            cell.shareNoLab.text = @"85";
            
        }
    }
    
    return shareCell;
}

-(void)shareBtnClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected == YES){
        btn.backgroundColor = SecondTitleColor;
    }
    else{
        btn.backgroundColor = blueC;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
