//
//  YSYKDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKDetailViewController.h"
#import "PayRecodeController.h"
#import "BusinessActionCell.h"
#import "BusinessActionController.h"
@interface YSYKDetailViewController ()<UITableViewDelegate,UITableViewDataSource,YSYKListViewDelegate>

/*tableView*/
@property (nonatomic,strong) UITableView *tableView;

/*tableView的headerView*/
@property (nonatomic,strong) UIView *headerView;

/*分享收藏按钮视图*/
@property (nonatomic,strong) UIView *clearView;

/*列表视图*/
@property (strong,nonatomic) YSYKListView *listView;

/**/

//@property (strong,nonatomic) UIView *TlistView;

@end

@implementation YSYKDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"有商有客";

    [self.view addSubview:self.tableView];
        
    [self.headerView addSubview:self.listView];
    
}


#pragma mark *****懒加载*****
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        
    }
    return _headerView;
}

#pragma mark /-----列表视图-----/
-(YSYKListView *)listView{
    if (!_listView) {
        YSYKLayout *lay = [[YSYKLayout alloc]initListViewDetialView];
        _listView = [[YSYKListView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lay.listViewHeight)];
        _listView.delegate = self;
    }
    return _listView;
}


#pragma mark -------导航

-(void)naviBtnAction{
    
    AMapRouteConfig *routeConfig = [[AMapRouteConfig alloc]init];
    routeConfig.appScheme = @"01702a5b3410721a17eff45c65056bef";
    routeConfig.appName = @"iosamap";

    CLLocationCoordinate2D coordinate = {30.655593,104.073803};
    
    
    CLLocationCoordinate2D coordinatebegin = {30.612339,104.071503};
    
    routeConfig.startCoordinate = AMapCoordinateConvert(coordinatebegin, AMapCoordinateTypeBaidu);//其实位置
    routeConfig.destinationCoordinate = AMapCoordinateConvert(coordinate, AMapCoordinateTypeBaidu);//终点坐标
    
    routeConfig.routeType = AMapRouteSearchTypeWalking;
    
    if ([AMapURLSearch openAMapRouteSearch:routeConfig]) {
        //调高德地图成功
        HWLog(@"跳转高德");
    }else{
        //调高德地图失败，跳转至app store下载应用
        [AMapURLSearch getLatestAMapApp];
        
    }
    /*
    // 1.获取应用程序App-B的URL Scheme
    NSURL *appBUrl = [NSURL URLWithString:@"iosamap://"];
    
    // 2.判断手机中是否安装了对应程序
    if ([[UIApplication sharedApplication] canOpenURL:appBUrl]) {
        // 3. 打开应用程序App-B
        [[UIApplication sharedApplication] openURL:appBUrl options:nil completionHandler:^(BOOL success) {
            if (success) {
                HWLog(@"success");
            }else{
                HWLog(@"false");
            }
        }];
    }
    */
    
    

}

#pragma mark ------购买
-(void)buyAction
{
    [self loginAction];
    if (self.loginOrNot) {
        PayRecodeController *vc = [PayRecodeController new];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    HWLog(@"立即购买");
}

#pragma mark ---领取优惠券
-(void)getBoon:(UIButton *)sender
{
    [self loginAction];
    if (self.loginOrNot) {
        [LWAlertView shoWithMessage:@"已领取"];
        sender.selected = YES;
    }
}

#pragma mark /-----tableView及方法-----/

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.listView.botoom;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        PhotoViewLayout *lay = [[PhotoViewLayout alloc]initPhotoCellLayout];
        
        return lay.photoCellHeight;
    }else
    {
        YSYKLayout *lay = [[YSYKLayout alloc]initBusinessAcion];
        return lay.businessActionCellHeight;
    }
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    if (indexPath.row == 0) {
        PhotoViewCell *cell = [[PhotoViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        [self configDetailCell:cell atInRowIndexPath:indexPath];
        return cell;
    }else{
        
        BusinessActionCell *cell = [[BusinessActionCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
        return cell;
        
        
    }
}


-(void)configDetailCell:(PhotoViewCell *)cell atInRowIndexPath:(NSIndexPath *)indexPath
{
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    __weak typeof(self) weakSelf = self;
    cell.clickedImageCallback = ^(PhotoViewCell *cell, NSInteger imageIndex) {
      __strong typeof(weakSelf) sself = weakSelf;
        [sself tableViewCell:cell showImageBrowserWithImageIndex:imageIndex];
    };
    
}

- (void)tableViewCell:(PhotoViewCell *)cell showImageBrowserWithImageIndex:(NSInteger)imageIndex {
    NSMutableArray* tmps = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < cell.photoLayout.photoPosition.count; i ++) {
        LWImageBrowserModel* model = [[LWImageBrowserModel alloc]
                                      initWithplaceholder:nil
                                      thumbnailURL:[NSURL URLWithString:[cell.photoLayout.imageArr objectAtIndex:i]]
                                      HDURL:[NSURL URLWithString:[cell.photoLayout.imageArr objectAtIndex:i]]
                                      containerView:cell.contentView
                                      positionInContainer:CGRectFromString(cell.photoLayout.photoPosition[i])
                                      index:i];
        [tmps addObject:model];
    }
    LWImageBrowser* browser = [[LWImageBrowser alloc] initWithImageBrowserModels:tmps
                                                                    currentIndex:imageIndex];
    [browser show];
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row != 0) {
        
        [LWAlertView shoWithMessage:@"商家活动"];
        
        BusinessActionController *vc = [BusinessActionController new];
        
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
