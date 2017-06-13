//
//  YCYMViewController.m
//  家长界
//
//  Created by mac on 2016/11/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "JZDRViewController.h"

@interface JZDRViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

/*tableView的创建*/
@property(nonatomic,strong)UITableView *tableView;

/*headerView的创建*/
@property(nonatomic,strong)UIView *headerView;

@property (strong,nonatomic) UIView *activityView;




@end

@implementation JZDRViewController
id jzdrCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"兼职达人";
    self.navigationController.navigationBar.backgroundColor = grayC;
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.cycleView];
    [self.headerView addSubview:self.activityView];
    

}

#pragma mark /**********懒加载************/

//头部视图
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        _headerView.backgroundColor = grayC;
    }
    
    return _headerView;
    
}

/**高薪职位，加入**/
-(UIView *)activityView{
    if (!_activityView) {
        _activityView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, 50)];
        _activityView.backgroundColor = whiteC;
        
        
        JoinInView *vi = [[JoinInView alloc]initWithFrame:_activityView.bounds];
        [vi setPropertyWithLabText:@"自由人职业时代来袭，兼职创业..." andLabC:MainColor andBtnTitle:@"我要加入" andBtnTextC:HWColor(224, 122, 74) andImage:[UIImage imageNamed:@"jzdr_image"] andTarget:self andAction:@selector(jzdrBtnAction)];
        
        [_activityView addSubview:vi];
        
    }
    return _activityView;
}

-(void)jzdrBtnAction{
    HWLog(@"6668");
}


#pragma mark /*********轮播图代理方法的实现*******/
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HWLog(@"%zd",index);
}



#pragma mark /++++++tableView的代理协议++++++/
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.activityView.y+self.activityView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
        JZDRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cia"];
        if (cell == nil) {
            cell = [[JZDRTableViewCell alloc]initWithFrame:cell.bounds];
            jzdrCell = cell;
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
    
    return cell;
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
