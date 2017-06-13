//
//  QZSPViewController.m
//  家长界
//
//  Created by mac on 2016/11/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QZSPViewController.h"

@interface QZSPViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

/*tableView的创建*/
@property(nonatomic,strong)UITableView *tableView;

/*headerView的创建*/
@property(nonatomic,strong)UIView *headerView;


@end

@implementation QZSPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"全职速聘";
    self.navigationController.navigationBar.backgroundColor = HWColor(241, 241, 241);
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.cycleView];
    
}

#pragma mark /**----------懒加载--------**/
//头部视图
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 300)];
        _headerView.backgroundColor = grayC;
    }
    
    return _headerView;
    
}


#pragma mark /*********轮播图代理方法*******/
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HWLog(@"%zd",index);
}

-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.backgroundColor = grayC;
        _tableView.tableHeaderView.height = lunBoheight+10;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

#pragma mark /*----------tableView的代理协议---------*/

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.subArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"identifier";
    HotZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        cell = [[HotZWTableViewCell alloc]initWithFrame:cell.bounds];
    }
    
    [self configCell:cell forIndexPathAtForRow:indexPath];
    
    
    
    
    return cell;
}


-(void)configCell:(HotZWTableViewCell *)cell forIndexPathAtForRow:(NSIndexPath *)indexPath
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    Fjoblist *jonModel = self.qzspArr[indexPath.row];
    cell.jobList = jonModel;
    
    cell.indePath = indexPath;
    cell.modelArr = self.subArr;
}



-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return MainCellHeight;
}

//点击cell的方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    YCJobDeViewController *vc = [YCJobDeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    HWLog(@"%zd",@(indexPath.row).intValue);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
