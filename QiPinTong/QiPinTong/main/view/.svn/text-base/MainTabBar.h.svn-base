//
//  MainTabBar.h
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MainTabBar;

//实现UITabBar的代理协议
@protocol MainTabBarDelegate <UITabBarDelegate>

@optional

-(void)tabBarDidClickPlusButton:(MainTabBar *)tabBar;


@end

@interface MainTabBar : UITabBar
@property(nonatomic,assign)id <MainTabBarDelegate> delegate;
@end
