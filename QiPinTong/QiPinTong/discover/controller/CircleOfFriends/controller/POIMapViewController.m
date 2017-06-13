//
//  POIMapViewController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "POIMapViewController.h"
#import "SearchMapController.h"
#import "SendFriendsLifeController.h"
@interface POIMapViewController ()<UITableViewDelegate,UITableViewDataSource,AMapSearchDelegate,UISearchBarDelegate,UISearchControllerDelegate,UISearchResultsUpdating,SearchResultViewDelegate>
//定位manager
@property (nonatomic,strong) AMapLocationManager *locationManager;

@property (nonatomic ,strong) SearchMapController *mapVc;

@property (nonatomic ,strong) UITableViewController *searchController;


@property (nonatomic ,strong) UITableView *mapTable;

@property (nonatomic ,strong) UISearchBar *searchBar;

@property (nonatomic ,strong) UIView *headerVc;

//POI(point Of intrest)
@property (nonatomic ,strong) AMapSearchAPI *mapSearch;

@property (nonatomic ,strong) NSMutableArray *mapArray;

@property (nonatomic ,copy) NSString *currentCity;

@property (nonatomic ,assign) NSInteger pageIndex;
@property (nonatomic ,assign) NSString *backStr;
@property (nonatomic ,assign) BOOL isSearch;
@property (nonatomic ,assign) BOOL noDatal;


@end

@implementation POIMapViewController

CGFloat refreshHeight = 60;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.view.backgroundColor = whiteC;
    self.pageIndex = 1;
    //设置导航
    [self setupNav];
    
    
    
    [self.view addSubview:self.mapTable];
    
    self.edgesForExtendedLayout=UIRectEdgeNone;
    
    
    //上拉加载
    [QPTUtils addLoadMoreForScrollView:self.mapTable loadMoreCallBack:^{
        [self loadLocation];
    }];
    //下拉刷新
    [QPTUtils addPullRefreshForScrollView:self.mapTable pullRefreshCallBack:^{
        [self loadLocation];
    }];
    //开启上拉加载
    [QPTUtils beginAddMoreDataForScrollView:self.mapTable];
    
    [self creatSearchBar];
    
}



-(void)creatSearchBar
{
    
    SearchMapController *mapVc = [SearchMapController new];
    self.mapVc = mapVc;
    self.mapVc.delegate = self;
//
    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:mapVc];
////
    [nav.navigationBar setBarTintColor:grayC];
    self.searchCtrl = [[UISearchController alloc]initWithSearchResultsController:nav];
    //代理
    self.searchCtrl.delegate = self;
    self.searchCtrl.searchResultsUpdater = self;
    self.searchCtrl.active = NO;
    //搜索的时候背景变暗
    self.searchCtrl.dimsBackgroundDuringPresentation = YES;
    //点击搜索的时候，是否隐藏导航
    _searchCtrl.hidesNavigationBarDuringPresentation = YES;
    
    //设置搜索框外层的颜色
    [self.searchCtrl.searchBar setBarTintColor:grayC];
    
    //设置搜索
    self.searchCtrl.searchBar.frame = CGRectMake(self.searchCtrl.searchBar.frame.origin.x, self.searchCtrl.searchBar.frame.origin.y, self.searchCtrl.searchBar.width, 44.0f);
//    _searchCtrl.searchBar.backgroundImage = [UIImage imageNamed:@"line_icon_image"];
    self.searchCtrl.searchBar.keyboardType = UIKeyboardTypeDefault;
    
    self.searchCtrl.searchBar.delegate = self;
    self.searchCtrl.searchBar.placeholder = @"搜索";
    [self.searchCtrl.searchBar sizeToFit];
//    self.mapTable.tableHeaderView = self.searchCtrl.searchBar;
    [self.headerVc addSubview:self.searchCtrl.searchBar];
    //如果进入编辑状态，searchBar消失（UISearchController套到TabBarController可能会出现这个情况）所以设置下面的属性
    self.definesPresentationContext = YES;
    
}



/**
 定位
 */
-(void)loadLocation
{
//    [MBProgressHUD showLoading:@"正在定位..." toView:self.mapTable];
    //开始定位
    [self.locationManager requestLocationWithReGeocode:YES completionBlock:^(CLLocation *location, AMapLocationReGeocode *regeocode, NSError *error) {
        
        if (error) {
            self.noDatal = YES;
            [self.mapTable reloadData];
            HWLog(@"错误信息====%@",error);
            if (error.code == AMapLocationErrorLocateFailed) {
                return ;
            }
            
            [QPTUtils endLoadMoreDataForScrollView:self.mapTable];
            [QPTUtils endRefreshForScrollView:self.mapTable];
            
            [LWAlertView shoWithMessage:@"网络超时，请查看网络后重新加载！"];
            
        }
        
        if (regeocode) {
//            [QPTUtils endRefreshForScrollView:self.mapTable];
            
//            HWLog(@"反地理编码之后获取的字典信息=====%@",regeocode);
            
            self.currentCity = regeocode.city;

            [self loadDataWith:location];
            
            self.pageIndex++;
            
        }
        
    }];
    
    
}

/** 加载附近地图数据*/
-(void)loadDataWith:(CLLocation *)location
{
    //创建周围搜索
    
    AMapPOIAroundSearchRequest *requset = [[AMapPOIAroundSearchRequest alloc]init];
    
    requset.page = self.pageIndex;
    
    requset.location = [AMapGeoPoint locationWithLatitude:location.coordinate.latitude longitude:location.coordinate.longitude];
    requset.radius = 1000;
    
    requset.sortrule = 0;
    
    requset.requireExtension = YES;
    [self.mapSearch AMapPOIAroundSearch:requset];
}


//附近POI代理方法
-(void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if (response.pois.count == 0) {
        return;
    }
    [QPTUtils endRefreshForScrollView:self.mapTable];
    [QPTUtils endLoadMoreDataForScrollView:self.mapTable];
    
    [self.mapArray addObjectsFromArray:response.pois];
    
    [self.mapTable reloadData];
}

//关键字搜索代理方法





/**设置导航*/
-(void) setupNav
{
    
    self.navigationItem.title = @"所在位置";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(sendClick)];
    [self.navigationItem.leftBarButtonItem setTitleTextAttributes:@{NSForegroundColorAttributeName:whiteC} forState:UIControlStateNormal];
    
    
}

-(void)sendClick
{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark ---刷新

-(void)refreshBegin
{
    [UIView animateWithDuration:0.2f animations:^{
        self.mapTable.contentInset = UIEdgeInsetsMake(refreshHeight, 0, 0, 0);
    } completion:nil];
}

-(void) endRefresh
{
    [UIView animateWithDuration:0.2f animations:^{
        self.mapTable.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    } completion:nil];
}


//-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
//{
//    CGFloat offest = scrollView.contentOffset.y;
//    
//    if (offest >= refreshHeight) {
//        [self loadLocation];
//    }
//}



#pragma mark ------tableViewDelegate && dateSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mapArray.count + 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger _row = indexPath.row;
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        
        cell.detailTextLabel.textColor = SecondTitleColor;
        
    }
    if (_row == 0) {
        cell.textLabel.textColor = grayBlueC;
        cell.textLabel.text = @"不显示位置";
        cell.detailTextLabel.text = @"";
    }else if (_row == 1) {
        
        AMapPOI *objectMap = self.mapArray[0];
        
        cell.textLabel.text = objectMap.city;
        cell.detailTextLabel.text = @"";
        cell.textLabel.textColor = MainColor;
        
    }else
    {
        [self configCellWith:cell andIndexPath:indexPath];
        cell.textLabel.textColor = MainColor;
    }
    
    
    return cell;
}


-(void)configCellWith:(UITableViewCell *)cell andIndexPath:(NSIndexPath *)indexPath
{
    
    AMapPOI *mapObject = self.mapArray[indexPath.row - 2];
    
    cell.textLabel.text = mapObject.name;
    
    NSString *mapStr = [mapObject.province stringByAppendingFormat:@"%@%@%@",mapObject.city,mapObject.district,mapObject.address];
    
    cell.detailTextLabel.text = mapStr;
    
    
    
}







-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AMapPOI *objectPoi = nil;
    
    NSString *str = @"";
    
        if (indexPath.row == 0) {
            
            str = @"不显示位置";
            
        }else if (indexPath.row == 1) {
            objectPoi = self.mapArray[indexPath.row - 1];
            
            str = objectPoi.city;
            
        }else
        {
            objectPoi = self.mapArray[indexPath.row - 2];
            
            str = [objectPoi.city stringByAppendingFormat:@"・%@",objectPoi.name];
            
        }
//    }
    self.backStr = str;
    self.selectLocation(str);

    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    
}

-(void)didSelectRowIndexPath:(NSIndexPath *)indexPath andAreaText:(NSString *)area
{
    HWLog(@"===%@",area);
    
    
    [self.searchCtrl.searchBar resignFirstResponder];
    
//    HWLog(@"%@",self.searchCtrl.active);
    
    if (self.searchCtrl.active) {
        
        self.backStr = area;
        self.selectLocation(area);
        
        
        
    }
    
}



//-(void)backToFatherView
//{
//    self.selectLocation(self.backStr);
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

#pragma mark ----searchBarDelegate



//点击搜索调用的方法
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    self.mapVc.keyWords = searchBar.text;
    [self.mapVc loadSearchMapDataWith:searchBar.text andCity:self.currentCity];
    [searchBar resignFirstResponder];
    
    
}

-(BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar
{
    return YES;
}

#pragma mark ---searchControllerDelegate;

//取消搜索
-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [searchBar resignFirstResponder];
//    [self.navigationController.navigationBar setTintColor:blueC];
    searchBar.showsCancelButton = NO;
}

-(void)didPresentSearchController:(UISearchController *)searchController
{
    searchController.searchBar.showsCancelButton = YES;
    
    [searchController.searchBar becomeFirstResponder];
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    
    
}

-(void)didDismissSearchController:(UISearchController *)searchController
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark -----searchResultsUpdater
-(void)updateSearchResultsForSearchController:(UISearchController *)searchController
{
    //修改searchBar的取消字眼
    //    //修改"Cancle"退出字眼,这样修改,按钮一开始就直接出现,而不是搜索的时候再出现
    /**  利用遍历的方法调整cancel按钮*/
//    searchController.searchBar.showsCancelButton = YES;
    [searchController.searchBar setShowsCancelButton:YES animated:nil];
    /*
    for(id sousuo in [searchController.searchBar subviews])
    {
        for (id zz in [sousuo subviews])
        {
            if([zz isKindOfClass:[UIButton class]]){
                UIButton *btn = (UIButton *)zz;
                [btn setTitle:@"取消" forState:UIControlStateNormal];
            }
        }
    }
     */
    /** 利用kvc的方法调整cancel按钮*/
    
    
    UIButton *cancelButton = [self.searchCtrl.searchBar valueForKey:@"cancelButton"];
    if (cancelButton) {
        [cancelButton setTitle:@"取消" forState:UIControlStateNormal];
        [cancelButton setTitleColor:deepGrayColor forState:UIControlStateNormal];
    }
    
    NSString *str = searchController.searchBar.text;
    
    if (str.length == 0) {
        
        self.isSearch = NO;
    }else
    {
        self.isSearch = YES;
        
        NSString *keyword = [NSString stringWithFormat:@"%@",searchController.searchBar.text];
        
        self.mapVc.keyWords = keyword;
        self.mapVc.currentCity = self.currentCity;
        [self.mapVc loadSearchMapDataWith:keyword andCity:self.currentCity];
    }
    
}

#pragma mark -----UISearchControllerDelegate


#pragma mark -----scrollerViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self closeSearchBar];
}

-(void)closeSearchState
{
    [self closeSearchBar];
}

-(void)closeSearchBar
{
    [self.searchCtrl.searchBar resignFirstResponder];
}

#pragma mark -------layze

-(UITableView *)mapTable
{
    if (!_mapTable) {
        _mapTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        
        _mapTable.delegate = self;
        
        _mapTable.dataSource = self;
        
        _mapTable.tableHeaderView = self.headerVc;
        
    }
    return _mapTable;
}

//
//-(UISearchBar *)searchBar
//{
//    if (!_searchBar) {
//        _searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
//        
//        _searchBar.barTintColor = grayC;
//        
//        _searchBar.delegate = self;
//        
//        _searchBar.placeholder = @"搜索";
//        _searchBar.keyboardType = UIKeyboardTypePhonePad;
//        
//        
//    }
//    return _searchBar;
//}


-(AMapLocationManager *)locationManager
{
    if (!_locationManager) {
        _locationManager = [[AMapLocationManager alloc]init];
        
        //设置精准度；
        [_locationManager setDesiredAccuracy:kCLLocationAccuracyBest];//精准到十米之内；
        //设置请求位置的最大限度；
        _locationManager.locationTimeout = 2;//（定位）；
        
        _locationManager.reGeocodeTimeout = 2;//(反地理编码)
        
    }
    return _locationManager;
}


-(AMapSearchAPI *)mapSearch
{
    if (!_mapSearch) {
        _mapSearch = [[AMapSearchAPI alloc]init];
        _mapSearch.delegate = self;
    }
    return _mapSearch;
}


-(NSMutableArray *)mapArray
{
    if (!_mapArray) {
        _mapArray = [NSMutableArray array];
    }
    
    return _mapArray;
}

-(UIView *)headerVc
{
    if (!_headerVc) {
        _headerVc = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _headerVc.backgroundColor = whiteC;
        
        
    }
    return _headerVc;
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
