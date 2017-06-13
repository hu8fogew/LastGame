//
//  NearJobViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/25.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "NearJobViewController.h"

@interface NearJobViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) SGSegmentedControl *segment;
@property (nonatomic,copy) NSString *segStr;


@end

@implementation NearJobViewController

id njCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.tableView];
    
}

#pragma mark /-------切换条目视图---------/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 45)];
        _headerView.backgroundColor = grayC;
        
        NSArray *arr = @[@"全职速聘",@"高薪兼职"];
        self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arr];
        self.segment.backgroundColor = whiteC;
        self.segment.titleColorStateNormal = MainColor;
        self.segment.titleColorStateSelected = blueC;
        self.segment.indicatorColor = blueC;
        
        [_headerView addSubview:self.segment];
        
    }
    return _headerView;
}

-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    if (index==0) {
        self.segStr = @"全职速聘";
        [self.tableView reloadData];
        
    }
    else{
        self.segStr = @"高薪兼职";
        [self.tableView reloadData];
    }
}

//-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    CGFloat offset = self.tableView.contentOffset.y;
//    if (offset > 64 ) {
//    [self.view addSubview:self.headerView];
//    }
//    if (0<=offset && offset <64) {
//    [self.headerView removeFromSuperview];
//    }
//}

#pragma mark --------tableview------------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT -64 -50)];
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
   
    return MainCellHeight;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"全职速聘"]) {
        HotZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cd"];
        cell = [[HotZWTableViewCell alloc]initWithFrame:cell.bounds];
        njCell = cell;
        cell.imgView.image = [UIImage imageNamed:@"comImage.jpg"];
        cell.postLab.text = @"中级UI设计师";
        cell.salaryLab.text = @"5-8k";
        cell.companyLab.text = @"西部家联教育有限公司";
        cell.vipIcon.image = [UIImage imageNamed:@"vipIcon"];
        cell.typeLab.text = @"IT软件/互联网";
        cell.academicIcon.image = [UIImage imageNamed:@"academicIcon"];
        cell.academicLab.text = @"本科";
        cell.timeIcon.image = [UIImage imageNamed:@"timeIcon"];
        cell.timeLab.text = @"3年";
        cell.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
        cell.addressLab.text = @"西安高新产业园逸翠园i都会";
        cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
        cell.numLab.text = @"3288";

    }
    else{
        JZDRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ca"];
        if (cell == nil) {
            cell = [[JZDRTableViewCell alloc]initWithFrame:cell.bounds];
            njCell = cell;
            cell.imgView.image = [UIImage imageNamed: @"comImage.jpg"];
            cell.postLab.text = @"ios软件开发";
            cell.payOfWayLab.text = @"日结";
            cell.salaryLab.text = @"80元/天";
            cell.companyLab.text = @"西部家联教育有限公司";
            cell.vipIcon.image = [UIImage imageNamed:@"vipIcon"];
            cell.typeLab.text = @"IT软件/互联网";
            ///////////
            cell.employIcon.image = [UIImage imageNamed:@"academicIcon"];
            cell.employLab.text = @"长期招聘";
            cell.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
            cell.addressLab.text = @"西安高新产业园逸翠园i都会";
            cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
            cell.numLab.text = @"3288";
        }
    }
    
    
    return njCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
