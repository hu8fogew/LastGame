//
//  Campus365ViewController.m
//  企聘通
//
//  Created by taylor on 2016/11/26.
//  Copyright © 2016年 taylorZhang. All rights reserved.
//

#import "Campus365ViewController.h"

@interface Campus365ViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate,UIScrollViewDelegate,SDCycleScrollViewDelegate,BtnViewDidSelectDelegate>

@property (nonatomic,strong) UITableView *tableView;

/*tableView的headerView*/
@property (nonatomic,strong) UIView *headerView;

/**校聘通*/
@property (nonatomic,strong) UIView *activityView;

/*校招专场view*/
@property (nonatomic,strong) UIView *campusView;

/*页面切换视图*/
@property (nonatomic,strong) UIView *seleBarView;

/*按钮数组*/
@property (nonatomic,strong) NSArray *seleBarArr;

@property (nonatomic,strong) SGSegmentedControl *segment;

@property (nonatomic,strong) NSString *segStr;


/*选择按钮视图*/
@property (nonatomic,strong) UIView *selectBtnView;

/*选择按钮数组*/
@property (nonatomic,strong) NSMutableArray *seleArr;

/**滚动视图*/
@property (nonatomic,strong) UIView *scrollView;

@end

@implementation Campus365ViewController

id campusCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"校园365";
    
    [self.view addSubview:self.tableView];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.seleBarArr = @[@"热门兼职",@"最新职位"];
    [self createSeleBarView];
    
    [self.headerView addSubview:self.activityView];
    [self.headerView addSubview:self.selectBtnView];
    [self.headerView addSubview:self.campusView];
    [self.headerView addSubview:self.seleBarView];
    [self.headerView addSubview:self.scrollView];
    [self.headerView addSubview:self.cycleView];
    
}

#pragma mark ----懒加载----

/*选择*/
-(NSMutableArray *)seleArr{
    if (!_seleArr) {
        _seleArr = [DataBase addCampusSelectBarArray];
    }
    return _seleArr;
}


/*tableView的headerView*/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight+50)];
        _headerView.backgroundColor = grayC;
    }
    return _headerView;
}


/**校聘通，一键领取**/
-(UIView *)activityView{
    if (!_activityView) {
        _activityView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, 50)];
        _activityView.backgroundColor = whiteC;
        
        JoinInView *vi = [[JoinInView alloc]initWithFrame:_activityView.bounds];
        [vi setPropertyWithLabText:@"校聘通，兼职无忧" andLabC:MainColor andBtnTitle:@"立即获取" andBtnTextC:HWColor(43, 106, 64) andImage:[UIImage imageNamed:@"xy365_image"] andTarget:self andAction:@selector(CampusBtnAction)];
        
        [_activityView addSubview:vi];
    }
    
    return _activityView;
}

-(void)CampusBtnAction{
    
    HWLog(@"66666");
}

/*选择按钮视图*/
-(UIView *)selectBtnView
{
    if (!_selectBtnView) {
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0,self.activityView.y+self.activityView.height+DistanceForCell, SCREEN_WIDTH, SCREEN_WIDTH*0.24)];
        _selectBtnView.backgroundColor = whiteC;
        [self creatSelectViewWith:_selectBtnView.bounds andselectArray:(NSMutableArray *)self.seleArr andSuperView:_selectBtnView];
    }
    return _selectBtnView;
}

/*校招专场view*/
-(UIView *)campusView{
    if (!_campusView) {
        _campusView = [[UIView alloc]initWithFrame:CGRectMake(0, self.selectBtnView.y+self.selectBtnView.height+DistanceForCell, SCREEN_WIDTH, 60)];
        _campusView.backgroundColor = whiteC;
        
        UILabel *campusLabel = [UILabel new];
        campusLabel.font = [UIFont systemFontOfSize:mainTitleSize+2];
        campusLabel.textColor = MainColor;
        campusLabel.text = @"校招专场";
        [self.campusView addSubview:campusLabel];
        [campusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.campusView);
        }];
        
        UIView *hView = [UIView new];
        hView.backgroundColor = MainColor;
        [self.campusView addSubview:hView];
        [hView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(campusLabel.mas_bottom).with.offset(10);
            make.centerX.equalTo(campusLabel);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(1);
        }];
        
    }
    return _campusView;
}

/**滚动视图*/
-(UIView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIView alloc]initWithFrame:CGRectMake(0, self.campusView.y+self.campusView.height, SCREEN_WIDTH, SCREEN_WIDTH*0.45+10)];
        
        MyScrollView *vi = [[MyScrollView alloc]initWithFrame:_scrollView.bounds];
        
        [_scrollView addSubview:vi];
    }
    return _scrollView;
}

/*页面切换视图*/
-(UIView *)seleBarView{
    if (!_seleBarView) {
        _seleBarView = [[UIView alloc]initWithFrame:CGRectMake(0, self.scrollView.y+self.scrollView.height+DistanceForCell, SCREEN_WIDTH, siftHeight)];
        _seleBarView.backgroundColor = grayC;
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1)];
        view.backgroundColor = whiteC;
        [_seleBarView addSubview:view];
        
    }
    return _seleBarView;
}


#pragma mark /***********选择按钮的创建***********/

/*选择器添加的手势实现方法*/
-(void)didselectViewAtIndex:(NSInteger)index{
    if (index == 0) {
        HWLog(@"0");
        StudentJobViewController *stuVC = [StudentJobViewController new];
        [self.navigationController pushViewController:stuVC animated:YES];
    }
    
    else if (index == 1) {
        HWLog(@"1");
        PracticeViewController *praVC = [PracticeViewController new];
        [self.navigationController pushViewController:praVC animated:YES];
    }
    
    else {
        HWLog(@"2");
        WorkGuideViewController *workVC = [WorkGuideViewController new];
        [self.navigationController pushViewController:workVC animated:YES];
    }
    
    HWLog(@"%zd",index);
    
}


#pragma mark /*-----添加选项栏-----*/
-(void)createSeleBarView
{
    _segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
    _segment.titleColorStateSelected = HWColor(51, 51, 51);
    _segment.titleColorStateNormal = HWColor(102,   102, 102);
    _segment.indicatorColor = HWColor(51, 51, 51);
    [self.seleBarView addSubview:_segment];
}

/**跳转**/
-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    
    if (index == 0) {
        self.segStr = @"热门兼职";
        [self.tableView reloadData];
    }
    else{
        self.segStr = @"最新职位";
        [self.tableView reloadData];
    }
    
}

#pragma mark /*********轮播图的代理实现*******/

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HWLog(@"---点击了第%ld张图片", (long)index);
    
}

#pragma mark /+++++++ tableView +++++++/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height =self.seleBarView.y+self.seleBarView.height;
        
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
    
    static NSString *identifier = @"identifier";
    if ([self.segStr isEqualToString:@"热门兼职"]) {
        JZDRTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[JZDRTableViewCell alloc]initWithFrame:cell.bounds];
            campusCell = cell;
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
    else{
        
        HotZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[HotZWTableViewCell alloc]initWithFrame:cell.bounds];
            cell.imgView.image = [UIImage imageNamed:@"comImage.jpg"];
            campusCell = cell;
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
    }
    
    return campusCell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    YCJobDeViewController *vc = [YCJobDeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
