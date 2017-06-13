//
//  WorkGuideViewController.m
//  家长界
//
//  Created by taylor on 2016/11/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "WorkGuideViewController.h"

@interface WorkGuideViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;

/*轮播数组*/
@property(nonatomic,strong)NSMutableArray *arrLunBo;
@property(nonatomic,strong) SDCycleScrollView *cycleView;

@end

@implementation WorkGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"就业指南";
    
    [self.view addSubview:self.tableView];
    [self.headerView addSubview:self.cycleView];
}

#pragma mark /*++++++懒加载++++++*/

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight+10)];
        _headerView.backgroundColor = HWColor(241, 241, 241);
    }
    return _headerView;
}

/*轮播*/
-(SDCycleScrollView *)cycleView
{
    if (!_cycleView) {
        _cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight) delegate:self placeholderImage:[UIImage imageNamed:@"lunbo1"]];
        _cycleView.currentPageDotColor = whiteC;
        _cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        NSArray *imagesURLStrings = @[
                                      @"http://mob.qipintong.com/assets/js/kindeditor/attached/image/20161114/20161114150030_0003.png",
                                      @"http://mob.qipintong.com/assets/js/kindeditor/attached/image/20161114/20161114145642_5831.png",
                                      @"http://mob.qipintong.com/assets/js/kindeditor/attached/image/20161114/20161114145705_0472.png"
                                      ];
        _cycleView.imageURLStringsGroup = imagesURLStrings;
        
    }
    return _cycleView;
}

/*---轮播图的代理方法---*/

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    HWLog(@"%zd",index);
}


-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WorkGuideLayout *layout = [[WorkGuideLayout alloc]initWithWorkGuideCell];
    
    return layout.guideCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WorkGuideTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cee"];
    cell = [[WorkGuideTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cee"];
    
    return cell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
