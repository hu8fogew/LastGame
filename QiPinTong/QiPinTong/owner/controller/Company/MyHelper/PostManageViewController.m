//
//  GXZWFormViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/4.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PostManageViewController.h"

@interface PostManageViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) UIView *footerView;

@property (strong,nonatomic) NSString *segStr;
@property (strong,nonatomic) SGSegmentedControl *segment;

@end

@implementation PostManageViewController

id gxCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"职位管理";
    [self.view addSubview:self.tableView];
}

#pragma mark /--------headerView--------/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _headerView.backgroundColor = grayC;
        
        NSArray *arr = @[@"发布中",@"审核中",@"暂停中"];
        self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 39) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arr];
        self.segment.backgroundColor = whiteC;
        self.segment.titleColorStateNormal = MainColor;
        self.segment.titleColorStateSelected = blueC;
        self.segment.indicatorColor = blueC;
        [_headerView addSubview:self.segment];
    }
    return _headerView;
}

#pragma mark /-----选择条目列表------/
-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    if (index==0) {
        self.segStr = @"发布中";
    }
    else if (index==1){
        self.segStr = @"审核中";
    }
    else{
        self.segStr = @"暂停中";
    }
}

#pragma mark /--------footerView--------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"发布职位" forState:UIControlStateNormal];
        btn.backgroundColor = blueC;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        [btn addTarget:self action:@selector(gxzwBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

//发布按钮跳转
-(void)gxzwBtnClick{
    HWLog(@"发布");
    SendPostFormViewController *vc = [SendPostFormViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView= [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return DeCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.segStr isEqualToString:@"发布中"]) {
        ResumeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
        if (cell == nil) {
            cell = [[ResumeTableViewCell alloc]initWithFrame:cell.bounds];
            gxCell = cell;
            cell.nameLab.text = @"张苗仔";
            cell.salaryLab.text = @"5-8k";
            cell.educaLab.text = @"大专";
            cell.ageLab.text = @"3-5年";
            cell.addressLab.text = @"西安市雁塔区唐延南路";
        }
    }
    return gxCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
