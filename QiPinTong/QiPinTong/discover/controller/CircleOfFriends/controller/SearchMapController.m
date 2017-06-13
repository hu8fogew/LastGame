//
//  SearchMapController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SearchMapController.h"
#import "POIMapViewController.h"
#import "SendFriendsLifeController.h"
@interface SearchMapController ()<AMapSearchDelegate>
@property (nonatomic ,strong) AMapSearchAPI *mapSearch;

@property (nonatomic ,assign) NSInteger pages;

@end

@implementation SearchMapController

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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout=UIRectEdgeNone;
    self.pages = 1;
    
    [QPTUtils addLoadMoreForScrollView:self.tableView loadMoreCallBack:^{
        [self loadSearchMapDataWith:self.keyWords andCity:self.currentCity];
        
    }];
    
//    [QPTUtils addPullRefreshForScrollView:self.tableView pullRefreshCallBack:^{
//       
//        [self loadSearchMapDataWith:self.keyWords andCity:self.currentCity];
//    }];
    
}

-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.tableView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (_delegate && [_delegate respondsToSelector:@selector(closeSearchState)]) {
        
        [_delegate closeSearchState];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/** 加载关键字搜索地图数据 */
-(void)loadSearchMapDataWith:(NSString *)keyWord andCity:(NSString *)city
{
    //创建关键字搜索对象
    AMapPOIKeywordsSearchRequest *request = [[AMapPOIKeywordsSearchRequest alloc]init];
    
    request.keywords = keyWord;
    
    request.city = city;
    
    request.page = self.pages;
    request.requireExtension = YES;//显示扩展信息
    
    request.cityLimit = YES;
    
    request.requireSubPOIs = YES;
    
    //开始搜索
    [self.mapSearch AMapPOIKeywordsSearch:request];
    
    self.pages++;
    
//    [QPTUtils beginAddMoreDataForScrollView:self.tableView];
//    [QPTUtils beginPullRefreshForScrollView:self.tableView];
    
}

#pragma mark ---searchDelegate
-(void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if (response.pois.count == 0) {
        [QPTUtils endLoadMoreDataForScrollView:self.tableView];
//        [QPTUtils endRefreshForScrollView:self.tableView];
        [MBProgressHUD showError:@"搜索失败" toView:self.tableView];
        
        return;
    }
    
    [MBProgressHUD hideHUDForView:self.tableView animated:YES];
    
    
    if (self.mapArray.count != 0) {
        [self.mapArray removeAllObjects];
    }
    [self.mapArray addObjectsFromArray:response.pois];
    [self.tableView reloadData];
    [QPTUtils endLoadMoreDataForScrollView:self.tableView];
//    [QPTUtils endRefreshForScrollView:self.tableView];
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return (self.mapArray.count == 0)?10:self.mapArray.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
        cell.textLabel.textColor = MainColor;
        cell.detailTextLabel.textColor = SecondTitleColor;
        
    }
    
    [self configCellWith:cell andIndexPath:indexPath];
    
    return cell;
}


-(void)configCellWith:(UITableViewCell *)cell andIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.mapArray.count == 0) {
        return;
    }
    
    AMapPOI *mapObject = self.mapArray[indexPath.row];
    
    cell.textLabel.text = mapObject.name;
    
    NSString *mapStr = [mapObject.province stringByAppendingFormat:@"%@%@%@",mapObject.city,mapObject.district,mapObject.address];
    
    cell.detailTextLabel.text = mapStr;
    if ([mapStr isEqualToString:@""]) {
        if (indexPath.row == 0) {
            cell.textLabel.text = @"请上滑页面，重新加载数据！";
        }
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    AMapPOI *objectPoi = nil;
    NSString *str = nil;
    if (self.mapArray == nil) {
        str = @"";
    }
    
    objectPoi = self.mapArray[indexPath.row];
    
    str = [objectPoi.city stringByAppendingFormat:@"・%@",objectPoi.name];
    
    
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectRowIndexPath:andAreaText:)]) {
        
        [_delegate didSelectRowIndexPath:indexPath andAreaText:self.mapArray == nil ? @"":str];
    }
    //模态的模态跳转回到present的第一层
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}




@end
