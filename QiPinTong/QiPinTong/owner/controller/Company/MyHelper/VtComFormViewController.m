//
//  VentureFormViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/1/16.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "VtComFormViewController.h"

#import "VtSendViewController.h"

@interface VtComFormViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate,VentureBtnClickDelegate,VtTCLYCellBtnClickDelegate,InvestCaseCellBtnClick,InvestorCellBtnClickDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) SGSegmentedControl *segment;
@property (strong,nonatomic) NSString *segStr;

//蓝色按钮
@property (strong,nonatomic) UIButton *sendBtn;

@property (strong,nonatomic) UIView *footerView;


@end

@implementation VtComFormViewController

 id vtCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的项目";
    
    [self.view addSubview:self.tableView];
}

#pragma mark /--------headerView--------/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _headerView.backgroundColor = grayC;
        
        NSArray *arr = @[@"我的项目",@"投资人",@"投资案例",@"同城∙路演"];
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
-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index
{
    if (index == 0) {
        HWLog(@"0");
        self.segStr = @"我的项目";
        [self.tableView reloadData];
        self.sendBtn.tag = 0;
        [self.sendBtn setTitle:@"发布项目" forState:UIControlStateNormal];
        self.navigationItem.title = @"我的项目";
    }
    
    else if (index == 1){
        HWLog(@"1");
        self.segStr = @"投资人";
        [self.sendBtn setTitle:@"添加投资人" forState:UIControlStateNormal];
        self.sendBtn.tag = 1;
        [self.tableView reloadData];
        self.navigationItem.title = @"投资人";

        
    }
    
    else if (index == 2){
        HWLog(@"2");
        self.segStr = @"投资案例";
        [self.sendBtn setTitle:@"添加投资案例" forState:UIControlStateNormal];
        self.sendBtn.tag = 2;
        [self.tableView reloadData];
        self.navigationItem.title = @"投资案例";

    }
    
    else{
        HWLog(@"3");
        self.segStr = @"同城∙路演";
        [self.tableView reloadData];
        [self.sendBtn setTitle:@"发路演" forState:UIControlStateNormal];
        self.sendBtn.tag = 3;
        self.navigationItem.title = @"路演列表";
    }
}

#pragma mark -------footerView--------
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        
        self.sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.sendBtn setTitle:@"发布项目" forState:UIControlStateNormal];
        self.sendBtn.backgroundColor = blueC;
        self.sendBtn.layer.masksToBounds = YES;
        self.sendBtn.layer.cornerRadius = 3;
        [self.sendBtn addTarget:self action:@selector(sendProjectClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:self.sendBtn];
        [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.and.centerX.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
        
    }
    return _footerView;
}

-(void)sendProjectClickBtn:(UIButton *)sender{
    
    VtSendViewController *vc = [VtSendViewController new];
    vc.selectIndex = sender.tag;
    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
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
  
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([self.segStr isEqualToString:@"我的项目"]){
        VtProjectCellLayout *layout = [[VtProjectCellLayout alloc]initWithVtProjectCell];
        
        return layout.vtProjectCellHeight;
    }
    
    else if ([self.segStr isEqualToString:@"投资人"]){
        InvestorBackCellLayout *layout = [[InvestorBackCellLayout alloc]initWithInvestorBackCell];
        return layout.investorCellHeight;
    }
    else if ([self.segStr isEqualToString:@"投资案例"]){
        InvestCaseCellLayout *layout = [[InvestCaseCellLayout alloc]initWithInvestCaseCell];
        return layout.investCaseCellHeight;
    }
    
    else{
        VtTCLYCellLayout *layout = [[VtTCLYCellLayout alloc]initWithVtShowCell];
        return layout.vtShowCellHeight;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"我的项目"]) {
        VtProjectTableViewCell *cell = [[VtProjectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ce"];
        vtCell = cell;
        cell.delegate = self;
    }
    else if ([self.segStr isEqualToString:@"投资人"]){
       InvestorBackTableViewCell *cell = [[InvestorBackTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cc"];
        vtCell = cell;
        cell.delegate = self;
    }
    else if ([self.segStr isEqualToString:@"投资案例"]){
       InvestCaseTableViewCell *cell = [[InvestCaseTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cc"];
        vtCell = cell;
        cell.delegate = self;
    }
    else{
        VtTCLYTableViewCell *cell = [[VtTCLYTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"c"];
        vtCell = cell;
        cell.delegate = self;
    }
    
    return vtCell;
}


//我的项目
-(void)clickVtEditBtn:(VtProjectTableViewCell *)cell{
    HWLog(@"1");
}
-(void)clickVtDeleteBtn:(VtProjectTableViewCell *)cell{
    HWLog(@"2");
}

//投资人
-(void)investorCellEditBtnClick:(InvestorBackTableViewCell *)cell{
    HWLog(@"a");
}
-(void)investorCellDeleteBtnClick:(InvestorBackTableViewCell *)cell{
    HWLog(@"b");
}

//投资案例
-(void)investCaseEditBtnClick:(InvestCaseTableViewCell *)cell{
    HWLog(@"c");
}
-(void)investCaseDeleteBtnClick:(InvestCaseTableViewCell *)cell{
    HWLog(@"d");
}

//同城路演
-(void)clickVtCLYCEditBtn:(VtTCLYTableViewCell *)cell{
    HWLog(@"3");
}
-(void)clickVtCLYCDeleteBtn:(VtTCLYTableViewCell *)cell{
    HWLog(@"4");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
