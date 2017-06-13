//
//  VtPersonFormViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/1/18.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "VtPersonFormViewController.h"

@interface VtPersonFormViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate,VentureBtnClickDelegate,VtTCLYCellBtnClickDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) SGSegmentedControl *segment;
@property (strong,nonatomic) NSString *segStr;

//发布按钮
@property (strong,nonatomic) UIButton *sendBtn;

@property (strong,nonatomic) UIView *footerView;


@end

@implementation VtPersonFormViewController

id vCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
}

#pragma mark /**--------headerView----------**/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40)];
        _headerView.backgroundColor = grayC;
        
        self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 39) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:@[@"我的项目",@"同城•路演"]];
        self.segment.backgroundColor = whiteC;
        self.segment.titleColorStateNormal = MainColor;
        self.segment.titleColorStateSelected = blueC;
        self.segment.indicatorColor = blueC;
        [self.headerView addSubview:self.segment];
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
        [self.sendBtn setTitle:@"发布项目" forState:UIControlStateNormal];
        self.sendBtn.tag = 0;
        
        self.navigationItem.title = @"我的项目";

    }
    
    else{
        HWLog(@"2");
        self.segStr = @"同城•路演";
        [self.tableView reloadData];
        [self.sendBtn setTitle:@"发路演" forState:UIControlStateNormal];
        self.sendBtn.tag = 1;
        
        self.navigationItem.title = @"路演列表";

    }
}

#pragma mark -------footerView----------
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        self.sendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.sendBtn setTitle:@"发布项目" forState:UIControlStateNormal];
        self.sendBtn.backgroundColor = blueC;
        self.sendBtn.layer.masksToBounds = YES;
        self.sendBtn.layer.cornerRadius = 3;
        [self.sendBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:self.sendBtn];
        [self.sendBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.and.bottom.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
        }];
    }
    return _footerView;
}

//发布按钮跳转
-(void)btnAction:(UIButton *)sender{
    HWLog(@"发布");
    VtPerSendViewController *vc = [VtPerSendViewController new];
    vc.vtPerIndex = sender.tag;
    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:vc];
    [self presentViewController:nav animated:YES completion:nil];
}

#pragma mark /**---------tableview及方法----------**/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
        
        _tableView.separatorStyle = NO;
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
    
    else{
        VtTCLYCellLayout *layout = [[VtTCLYCellLayout alloc]initWithVtShowCell];
        return layout.vtShowCellHeight;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"我的项目"]) {
        VtProjectTableViewCell *cell = [[VtProjectTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ce"];
        vCell = cell;
        cell.delegate = self;
    }
    else{
        VtTCLYTableViewCell *cell = [[VtTCLYTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"c"];
        vCell = cell;
        cell.delegate = self;
    }
    
    
    return vCell;
}


-(void)clickVtEditBtn:(VtProjectTableViewCell *)cell{
    HWLog(@"1");
}
-(void)clickVtDeleteBtn:(VtProjectTableViewCell *)cell{
    HWLog(@"3");
}


-(void)clickVtCLYCEditBtn:(VtTCLYTableViewCell *)cell{
    HWLog(@"4");
}
-(void)clickVtCLYCDeleteBtn:(VtTCLYTableViewCell *)cell{
    HWLog(@"6");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
