//
//  YSYKViewController.m
//  家长界
//
//  Created by taylor on 2016/12/1.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKViewController.h"
#import "BusinessSelectScrollView.h"
#import "DOPDropDownMenu.h"
@interface YSYKViewController ()<UITableViewDelegate,UITableViewDataSource,BtnViewDidSelectDelegate,BusinessSelectDelegate,DOPDropDownMenuDelegate,DOPDropDownMenuDataSource>

/*tableView*/
@property (strong,nonatomic) UITableView *tableView;

/*tableView的headerView*/
@property (strong,nonatomic) UIView *headerView;

/*选择按钮数组*/
@property (strong,nonatomic) NSMutableArray *seleBarArr;


/*立即加入*/
@property (nonatomic ,strong) UIView *activityView;

/*选择按钮视图*/
@property (strong,nonatomic) UIView *seleBtnView;

/*抢通币视图*/
@property (nonatomic,strong) UIView *tbView;
@property (nonatomic ,strong) DOPDropDownMenu *menu;


@property (nonatomic, strong) NSArray *classifys;
@property (nonatomic, strong) NSArray *cates;
@property (nonatomic, strong) NSArray *movices;
@property (nonatomic, strong) NSArray *hostels;
@property (nonatomic, strong) NSArray *areas;
@property (nonatomic ,strong) NSArray *areasFirst;

@property (nonatomic, strong) NSArray *sorts;
@property (nonatomic ,strong) NSArray *siftArray;

@property (nonatomic,assign) NSInteger currentMenuIndex;

/*tableView的footerView*/
//@property (strong,nonatomic) UIView *footerView;

//@property (strong,nonatomic) UIView *footShowView;

//@property (strong,nonatomic) UITableView *footerTable;


@property (strong,nonatomic) UIButton *iconBtn;

@end

@implementation YSYKViewController

id ycell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"有商有客";

    [self.view addSubview:self.tableView];
    [self.headerView addSubview:self.seleBtnView];
    [self.headerView addSubview:self.tbView];
    [self.headerView addSubview:self.cycleView];
    [self.headerView addSubview:self.activityView];
    
    [self loadData];//数据
    [self.menu reloadData];
    [QPTUtils addPullRefreshForScrollView:self.tableView pullRefreshCallBack:^{
       
        
        
    }];
    [QPTUtils addLoadMoreForScrollView:self.tableView loadMoreCallBack:^{

    }];
    
}

-(void)loadData
{
    
    // 数据
    self.classifys = @[@"美食",@"超市",@"丽人",@"休闲娱乐",@"KTV",@"运动健身",@"亲子"];
    self.cates = @[@"全部美食",@"自助餐",@"快餐",@"火锅",@"鲁菜",@"西餐",@"烧烤小吃"];
    self.movices = @[@"全部超市",@"超市",@"便利店"];
    self.hostels = @[@"全部丽人",@"美发",@"美容",@"美甲"];
    self.areas = @[@"附近",@"热门商圈",@"新城区",@"碑林区",@"莲湖区",@"灞桥区",@"未央区",@"雁塔区",@"长安区",@"阎良区"];
    self.areasFirst = @[@"1km",@"2km",@"3km",@"5km",@"10km",@"附近"];
    self.sorts = @[@"智能排序",@"离我最近",@"好评优先",@"人气优先",@"最新发布"];
    self.siftArray = @[@"点菜",@"排号",@"预定",@"外卖",@"游戏",@"Wi-Fi",@"停车位",@"无烟区",@"包厢",@"无地沟油"];
    
    
    
    
}


#pragma mark /******懒加载******/

-(NSMutableArray *)seleBarArr{
    if (!_seleBarArr) {
        _seleBarArr = [DataBase addYSYKSelectBarArr];
    }
    return _seleBarArr;
}

/**------headerView------**/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        _headerView.backgroundColor = grayC;
        
    }
    return _headerView;
}
/** 立即加入*/

/**高薪职位，加入**/
-(UIView *)activityView{
    if (!_activityView) {
        _activityView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight+6, SCREEN_WIDTH, 50)];
        _activityView.backgroundColor = whiteC;
        
        
        JoinInView *vi = [[JoinInView alloc]initWithFrame:_activityView.bounds];
        [vi setPropertyWithLabText:@"   易拉客、易推广、易招聘" andLabC:MainColor andBtnTitle:@"立即入驻" andBtnTextC:HWColor(224, 122, 74) andImage:[UIImage imageNamed:@"life_image"] andTarget:self andAction:@selector(jzdrBtnAction)];
        
        [_activityView addSubview:vi];
        
    }
    return _activityView;
}

//立即入住
-(void)jzdrBtnAction{
    HWLog(@"6668");
    [self loginAction];
    
    if (self.loginOrNot) {
        [LWAlertView shoWithMessage:@"立即入住"];
    }
    
    
}

/**-------选择按钮视图-------**/
-(UIView *)seleBtnView{
    if (!_seleBtnView) {
        _seleBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, self.activityView.botoom+8, SCREEN_WIDTH, businessSelectViewHeight)];
        
        
        [self creatSelectViewWith:_seleBtnView.bounds andselectArray:(NSMutableArray *)self.seleBarArr andSuperView:_seleBtnView];
        
    }
    return _seleBtnView;
}

/**-----抢通币-----**/
-(UIView *)tbView{
    if (!_tbView) {
        _tbView = [[UIView alloc]initWithFrame:CGRectMake(0, self.seleBtnView.botoom+8, SCREEN_WIDTH, SCREEN_WIDTH*0.1)];
        _tbView.backgroundColor = grayC;
        
        [_tbView addSubview:self.menu];
        [self.menu selectIndexPath:[DOPIndexPath indexPathWithCol:0 row:0 item:0]];
        
    }
    return _tbView;
}

-(DOPDropDownMenu *)menu
{
    if (!_menu) {
        _menu = [[DOPDropDownMenu alloc]initWithOrigin:CGPointMake(0, 0) width:SCREEN_WIDTH andHeight:SCREEN_WIDTH*0.1];
        _menu.backgroundColor = whiteC;
        _menu.delegate = self;
        _menu.dataSource = self;
        _menu.indicatorColor = SecondTitleColor;
        _menu.separatorColor = grayC;
        
    }
    return _menu;
}



#pragma mark ---------栏目选择；
/*-----按钮跳转--------*/

//
//-(void)onTapSelectView:(UITapGestureRecognizer *)tap
-(void)didselectViewAtIndex:(NSInteger)index
{
//    HWLog(@"%zd",tap.view.tag);
    NSInteger num = index;
    
    switch (num) {
        case 0:
        {
            MSTDViewController *vc = [MSTDViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
        {
            [LWAlertView shoWithMessage:@"还未开通，敬请期待"];
        }
            break;
    }
    
    
}


#pragma mark /*********轮播图的代理实现*******/
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HWLog(@"---点击了第%ld张图片", (long)index);
    
}

#pragma mark ---scrolleDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat offset = self.tableView.contentOffset.y;
    
    if (offset>self.tbView.top || offset == self.tbView.top) {
        [self.menu removeFromSuperview];
        [self.view insertSubview:self.menu aboveSubview:self.tableView];
        
    }else if (offset<self.tbView.top){
        
        [self.menu removeFromSuperview];
        [self.tbView addSubview:self.menu];
    }
    
    
    
    
}


#pragma mark ----meun的代理方法

//menu的筛选条件个数
-(NSInteger)numberOfColumnsInMenu:(DOPDropDownMenu *)menu
{
    return 4;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column
{
    if (column == 3) {
        return YES;
    }
    return NO;
}

//具体筛选条件对应的个数
-(NSInteger)menu:(DOPDropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column
{
    if (column == 0) {
        return self.classifys.count;
    }else if (column == 1){
        return self.areas.count;
    }else if (column == 2){
        return self.sorts.count;
    }else
    {
        return self.siftArray.count;
    }
}

-(NSString *)menu:(DOPDropDownMenu *)menu titleForRowAtIndexPath:(DOPIndexPath *)indexPath
{
    NSInteger index = indexPath.column;
    if (index == 0) {
        return self.classifys[indexPath.row];
    }else if (index == 1){
        return self.areas[indexPath.row];
    }else if (index == 2){
        return self.sorts[indexPath.row];
    }else{
        return self.siftArray[indexPath.row];
    }
}

-(NSInteger)menu:(DOPDropDownMenu *)menu numberOfItemsInRow:(NSInteger)row column:(NSInteger)column
{
    if (column == 0) {
        if (row == 0) {
            return self.cates.count;
        }else if (row == 1){
            return self.movices.count;
        }else if (row == 2){
            return self.hostels.count;
        }
    }else if (column == 1){
        if (row == 0) {
            return self.areasFirst.count;
        }
    }
    if (column == 3) {
        return self.siftArray.count;
    }
    return 0;
}

-(NSString *)menu:(DOPDropDownMenu *)menu titleForItemsInRowAtIndexPath:(DOPIndexPath *)indexPath
{
//    [menu changeMenuSelectView];
    if (indexPath.column == 0) {
        
        if (indexPath.row == 0) {
            
            return self.cates[indexPath.item];
            
        }else if (indexPath.row == 1){
            
            return self.movices[indexPath.item];
            
        }else if (indexPath.row == 2){
            
            return self.hostels[indexPath.item];
        }
    }else if (indexPath.column == 1){
        if (indexPath.row == 0) {
            return self.areasFirst[indexPath.item];
        }
    }
//    if (indexPath.column == 3) {
//        
//        return self.siftArray[indexPath.item];
//    }
    
    return nil;
}


//点击了筛选器执行的代理方法。
-(void)didClickedMenu
{
    CGFloat contentOffsetY = self.tableView.contentOffset.y;
    if (contentOffsetY < self.tbView.top) {
        [self.menu removeFromSuperview];
        [self.tableView setContentOffset:CGPointMake(0, self.tbView.top+1.0f) animated:NO];
        [self.view insertSubview:self.menu aboveSubview:self.tableView];
    }
}

-(void)menu:(DOPDropDownMenu *)menu didSelectRowAtIndexPath:(DOPIndexPath *)indexPath
{
    
    
    
}


//最后一个筛选条件的代理方法
-(void)menu:(DOPDropDownMenu *)menu didSelectSiftArray:(NSMutableArray *)arr
{
    HWLog(@"%@",arr);
}


#pragma mark /++++++tableView及方法实现+++++++/
-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.tbView.botoom;
        
    }
    
    return _tableView;
}

/*-------footerView上的tableview------*/
/*
-(UITableView *)footerTable{
    if (!_footerTable) {
        _footerTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 50, SCREEN_WIDTH, SCREEN_WIDTH*0.24*4)];
        _footerTable.delegate = self;
        _footerTable.dataSource = self;
        
        _footerTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _footerTable.allowsSelection = NO;
        
    }
    return _footerTable;
    
}

*/
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
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
            
            [self configBusinessCell:cell withIndexPath:indexPath];
            
        }
    
    return cell;
}

-(void)configBusinessCell:(YSYKTableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    YSYKDetailViewController *vc = [YSYKDetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
