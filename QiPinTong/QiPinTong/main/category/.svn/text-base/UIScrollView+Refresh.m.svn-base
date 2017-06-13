//
//  UIScrollView+Refresh.m
//  BaseProject
//
//  Created by mac on 16/9/1.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "UIScrollView+Refresh.h"

@implementation UIScrollView (Refresh)


-(void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock
{
    //利用MJRefreshNormalHeader的构造方法吧参数传递给mj_header属性；
    self.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:refreshBlock];
    
}
//添加footerRefresh
-(void)addFooterRefresh:(MJRefreshComponentRefreshingBlock)refreshBlock
{
    self.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:refreshBlock];
    
}

//开始和结束头部刷新
-(void)beginHeaderRefresh
{
    [self.mj_header beginRefreshing];
    
}
-(void)endHeaderRefresh
{
    [self.mj_header endRefreshing];
}

-(void)beginFooterRefresh
{
    [self.mj_footer beginRefreshing];
    
}
-(void)endFooterRefresh
{
    
    [self.mj_footer endRefreshing];
    
}

@end
