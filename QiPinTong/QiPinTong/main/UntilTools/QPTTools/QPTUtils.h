//
//  QPTUtils.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class AMapLocationReGeocode;
typedef void(^XRRefreshAndLoadMoreHanle)(void);
@interface QPTUtils : NSObject

/**
 开始下拉刷新
 */
+(void)beginPullRefreshForScrollView:(UIScrollView *)scrollView;

/**
 开始上拉加载
 */
+(void)beginAddMoreDataForScrollView:(UIScrollView *)scrollView;

/**
 判断头部是否在刷新
 */
+(BOOL)headerIsRefreshForScrollView:(UIScrollView *)scrollView;

/**
 判断是否尾部在刷新
 */
+(BOOL)footerIsRefreshForScrollView:(UIScrollView *)scrollView;

/**
 提示没有更多数据了
 */
+(void)noticeNoMoreDataForScrollView:(UIScrollView *)scrollView;

/**
 重制footer
 */
+(void)resetNoMoreDataForScrollView:(UIScrollView *)scrollView;

/**
 停止下拉刷新
 */
+(void)endRefreshForScrollView:(UIScrollView *)scrollView;

/**
 停止上拉加载
 */
+(void)endLoadMoreDataForScrollView:(UIScrollView *)scrollView;

/**
 隐藏footer
 
 */
+(void)hiddenFooterForScrollView:(UIScrollView *)scrollView;

/**
 隐藏header
 */
+(void)hiddenHeaderForScrollView:(UIScrollView *)scrollView;

/**
 上拉刷新
 */
+(void)addLoadMoreForScrollView:(UIScrollView *)scrollView loadMoreCallBack:(XRRefreshAndLoadMoreHanle)loadMoreCallBackBloack;

/**
 下拉加载
 */

+(void)addPullRefreshForScrollView:(UIScrollView *)scrollView pullRefreshCallBack:(XRRefreshAndLoadMoreHanle)pullRefreshCallBackBlock;


/**
 转化时间   时间戳转时间
 */

+(NSString *)datestrFromDate:(NSDate *)date withDateFormat:(NSString *)format;

/**
 转化时间
 几天前，几分钟前
 */

+(NSString *)updateTimeInterval:(NSInteger)timeInterval;



+(void)requestLocationWithReGeocode:(BOOL)withReGeocode completionBlock:(void(^)(CLLocation *location,AMapLocationReGeocode *regeocode,NSError *error))completeBlock;


/**
 
 判断是否是当前用户
 */
+(BOOL)isCurrentUserWithUserId:(NSInteger)userId;

/**
 color 生成image
 */
+(UIImage *)imageWithColor:(UIColor *)color;

/**
 UIView 生成image
 */
+(UIImage *)imageWithView:(UIView *)view;


@end
