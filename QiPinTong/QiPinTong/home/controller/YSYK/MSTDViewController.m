//
//  MSTDViewController.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MSTDViewController.h"

@interface MSTDViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

/*tableView*/
@property (strong,nonatomic) UITableView *tableView;

/*tableView的headerView*/
@property (strong,nonatomic) UIView *headerView;

/*轮播数组*/
@property (nonatomic,strong) NSMutableArray *arrLunBo;

@property(nonatomic,strong) SDCycleScrollView *cycleView;
/*筛选视图*/
@property (strong,nonatomic) UIView *siftView;

@property (strong,nonatomic) UIButton *btn1;
@property (strong,nonatomic) UIButton *btn2;
@property (strong,nonatomic) UIButton *btn3;
@property (strong,nonatomic) UIButton *btn4;
@property (strong,nonatomic) UIButton *btn5;

/*筛选按钮数组*/
@property (strong,nonatomic) NSMutableArray *buttonArray;

@end

@implementation MSTDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.tableView];
    [self.headerView addSubview:self.cycleView];
    

}

#pragma mark -----懒加载-----

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight+5)];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}


#pragma mark /*********轮播图的实现*******/
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HWLog(@"%zd",index);
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    
}



#pragma mark =====tableview及方法======

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}


-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    YSYKLayout *lay = [[YSYKLayout alloc]initYsykListCell];
    
    return lay.businessCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifier = @"identifier";
        YSYKTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[YSYKTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            [self configMSTDcell:cell atIndexPath:indexPath];
        }
    
    return cell;

}

-(void)configMSTDcell:(YSYKTableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    cell.accessoryType = UITableViewCellAccessoryNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
