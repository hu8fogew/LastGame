//
//  QPTUtils.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTUtils.h"
#import "QPTRefreshFooter.h"
@implementation QPTUtils
+(NSInteger)totalDataCountForScrollView:(UIScrollView *)scrollView
{
    NSInteger totalCount = 0;
    
    if ([scrollView isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView *)scrollView;
        for (NSInteger section = 0; section<tableView.numberOfSections; section++) {
            totalCount += [tableView numberOfRowsInSection:section];
        }
        
    }else if([scrollView isKindOfClass:[UICollectionView class]])
    {
        UICollectionView *collectionView = (UICollectionView *)scrollView;
        
        for (NSInteger section = 0; section<collectionView.numberOfSections; section++) {
            totalCount += [collectionView numberOfItemsInSection:section];
        }
    }
    
    return totalCount;
    
}

//    开始下拉刷新
+(void)beginPullRefreshForScrollView:(UIScrollView *)scrollView
{
    [scrollView.mj_header beginRefreshing];
    
}

// 开始上拉加载
+(void)beginAddMoreDataForScrollView:(UIScrollView *)scrollView
{
    [scrollView.mj_footer beginRefreshing];
}

//判断头部是否在刷新
+(BOOL)headerIsRefreshForScrollView:(UIScrollView *)scrollView
{
    BOOL flag = scrollView.mj_header.isRefreshing;
    return flag;
}

//判断是否尾部在刷新
+(BOOL)footerIsRefreshForScrollView:(UIScrollView *)scrollView
{
    BOOL flag = scrollView.mj_footer.isRefreshing;
    return flag;
    
}
//提示没有更多数据了
+(void)noticeNoMoreDataForScrollView:(UIScrollView *)scrollView
{
    [scrollView.mj_footer endRefreshingWithNoMoreData];
}

//重制footer
+(void)resetNoMoreDataForScrollView:(UIScrollView *)scrollView
{
    [scrollView.mj_footer resetNoMoreData];
}

//停止下拉刷新
+(void)endRefreshForScrollView:(UIScrollView *)scrollView
{
    [scrollView.mj_header endRefreshing];
}
//停止上啦加载
+(void)endLoadMoreDataForScrollView:(UIScrollView *)scrollView
{
    [scrollView.mj_footer endRefreshing];
    
}


//隐藏footer
+(void)hiddenFooterForScrollView:(UIScrollView *)scrollView
{
    scrollView.mj_footer.hidden = YES;
}

//隐藏header
+(void)hiddenHeaderForScrollView:(UIScrollView *)scrollView
{
    scrollView.mj_header.hidden = YES;
    
}


//下拉
+(void)addPullRefreshForScrollView:(UIScrollView *)scrollView pullRefreshCallBack:(XRRefreshAndLoadMoreHanle)pullRefreshCallBackBlock
{
    __weak typeof (UIScrollView *)weakScrollView = scrollView;
    if (scrollView == nil || pullRefreshCallBackBlock == nil) {
        return;
    }
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (pullRefreshCallBackBlock) {
            pullRefreshCallBackBlock();
        }
        if (weakScrollView.mj_footer.hidden == NO) {
            [weakScrollView.mj_footer resetNoMoreData];
        }
    }];
    
    [header setTitle:@"释放更新" forState:MJRefreshStatePulling];
    [header setTitle:@"正在更新" forState:MJRefreshStateRefreshing];
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    header.stateLabel.font = [UIFont systemFontOfSize:13];
    header.stateLabel.textColor = HWColor(0.17f, 0.23f, 0.28f);
    header.lastUpdatedTimeLabel.hidden = YES;
    
    scrollView.mj_header = header;
    
}

//上拉
+(void)addLoadMoreForScrollView:(UIScrollView *)scrollView loadMoreCallBack:(XRRefreshAndLoadMoreHanle)loadMoreCallBackBloack
{
    if (scrollView == nil || loadMoreCallBackBloack == nil) {
        return;
    }
    
    QPTRefreshFooter *footer = [QPTRefreshFooter footerWithRefreshingBlock:^{
       if(loadMoreCallBackBloack)
        {
            loadMoreCallBackBloack();
        }
    }];
    
    [footer setTitle:@"" forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在为您加载更多数据" forState:MJRefreshStateRefreshing];
    
    [footer setTitle:@"没有更多了亲～～～" forState:MJRefreshStateNoMoreData];
    
    footer.stateLabel.textColor = SecondTitleColor;
    footer.automaticallyHidden = YES;
    footer.stateLabel.font = [UIFont systemFontOfSize:subTitleSize];
    scrollView.mj_footer = footer;
    footer.backgroundColor = clearC;
    
    
}



//时间戳转时间
+(NSString *)datestrFromDate:(NSDate *)date withDateFormat:(NSString *)format
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:format];
    
    return [dateFormat stringFromDate:date];
}

//几天前、几分钟前
+(NSString *)updateTimeInterval:(NSInteger)timeInterval
{
    //获取当前时间时间戳 1466386762.345715 十位整数 6位小数
    NSTimeInterval currentTime = [[NSDate date] timeIntervalSince1970];
    
    //创建歌曲时间戳（后台返回的时间 一般是13位数字）
    NSTimeInterval createTime = timeInterval;
    
    NSTimeInterval time = currentTime - createTime;
    
    if (time < 60) {
        return @"刚刚";
    }
    NSInteger minutes = time / 60;
    if (minutes < 60) {
        return [NSString stringWithFormat:@"%ld分钟前",minutes];
    }
    NSInteger hours = time / 3600;
    if (hours < 24) {
        return [NSString stringWithFormat:@"%ld小时前",hours];
        
    }
    NSInteger days = time / 3600 / 24;
    if (days < 30) {
        return [NSString stringWithFormat:@"%ld天前",days];
    }
    NSInteger months = time / 3600 / 24 / 30;
    if (months < 12) {
        return [NSString stringWithFormat:@"%ld月前",months];
    }
    
    NSInteger years = time / 3600 / 24 / 30 / 12;
    return [NSString stringWithFormat:@"%ld年前",years];
    
}


//定位
+(void)requestLocationWithReGeocode:(BOOL)withReGeocode completionBlock:(void (^)(CLLocation *, AMapLocationReGeocode *, NSError *))completeBlock
{
    AMapLocationManager *manager = [[AMapLocationManager alloc]init];
    
    [manager setDesiredAccuracy:kCLLocationAccuracyBest];//十米之内
    manager.locationTimeout = 2;
    manager.reGeocodeTimeout = 2;
    
    [manager requestLocationWithReGeocode:withReGeocode completionBlock:completeBlock];
    
}



#warning mark -----未添加响应的判断
+(BOOL)isCurrentUserWithUserId:(NSInteger)userId
{
    return YES;
}

//颜色生成图片
+(UIImage *)imageWithColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
    
}

//view生成image
+(UIImage *)imageWithView:(UIView *)view
{
    CGSize size = view.bounds.size;
    
    //下面的方法中，第一个参数：区域大小；第二个参数：是否透明，如果需要显示半透明，需要传入NO，否则传入YES；第三个参数：屏幕分辨率，关键的参数
    UIGraphicsBeginImageContextWithOptions(size, NO, [UIScreen mainScreen].scale);
    
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
    
}


@end
