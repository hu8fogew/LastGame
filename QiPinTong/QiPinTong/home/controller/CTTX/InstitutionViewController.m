//
//  InstitutionViewController.m
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InstitutionViewController.h"

@interface InstitutionViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,SGSegmentedControlDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;


/**页面切换视图*/
@property (strong,nonatomic) UIView *seleBarView;
@property (strong,nonatomic) SGSegmentedControl *segment;
@property (strong,nonatomic) NSString *segStr;
@property (strong,nonatomic) NSArray *seleBarArr;


@end

@implementation InstitutionViewController

id venCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"投资机构";

    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.seleBarView];
    [self.headerView addSubview:self.cycleView];
    
    self.seleBarArr = @[@"投资机构",@"投资人"];
    
    [self createSeleBarView];
    
    self.segStr = @"投资机构";
}

#pragma mark -----懒加载-------

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight+10)];
        _headerView.backgroundColor = grayC;
        
    }
    return _headerView;
}


#pragma mark ---轮播
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    HWLog(@"点击了第%ld张图片",index);
}


/*页面切换视图*/
-(UIView *)seleBarView{
    if (!_seleBarView) {
        _seleBarView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight+DistanceForCell, SCREEN_WIDTH, siftHeight)];
        _seleBarView.backgroundColor = grayC;
//        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1)];
//        view.backgroundColor = whiteC;
//        [_seleBarView addSubview:view];
        
    }
    return _seleBarView;
}

/*添加选项栏*/
-(void)createSeleBarView
{
    _segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
    _segment.backgroundColor = whiteC;
    _segment.titleColorStateSelected = HWColor(96, 136, 186);
    _segment.indicatorColor = HWColor(96, 136, 186);
    [self.seleBarView addSubview:_segment];
}


-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    
    if (index == 0) {
        self.segStr = @"投资机构";
        [self.tableView reloadData];
    }
    else{
        self.segStr = @"投资人";
        [self.tableView reloadData];
    }
}

#pragma mark ------tableview及方法------

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.seleBarView.y+self.seleBarView.height;
    }
    
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"投资人"]) {
        PartnerLayout *layout = [[PartnerLayout alloc]initWithPartnerCell];
        return layout.partnerCellH;
    }
    else{
        return SubCellHeight;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"identifier";
    if ([self.segStr isEqualToString:@"投资人"]) {
       PartnerTableViewCell *cell = [[PartnerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cia"];
        venCell = cell;
    }
    
    if ([self.segStr isEqualToString:@"投资机构"]) {
        GoodItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[GoodItemsTableViewCell alloc]initWithFrame:cell.bounds];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            venCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"comImage.jpg"];
            cell.titleLabel.text = @"中国银江投资集团";
            cell.amountLabel.text = @"成功投资:234个";
            cell.amountLabel.textColor = SecondTitleColor;
            cell.subLabel.text = @"领域 : 社交、电子商务、媒体分类";
            cell.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
            cell.addressLabel.text = @"西安";
            cell.praiseLabel.text = @"2323";
            cell.praiseIcon.image = [UIImage imageNamed:@"eyeIcon"];
            
        }
    }
    
    return venCell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if ([self.segStr isEqualToString:@"投资人"]){
        InvestorViewController *vc = [InvestorViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    if ([self.segStr isEqualToString:@"投资机构"]){
        InstiDetailViewController *vc = [InstiDetailViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
