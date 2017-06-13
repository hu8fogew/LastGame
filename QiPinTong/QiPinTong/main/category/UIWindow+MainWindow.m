//
//  UIWindow+MainWindow.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "UIWindow+MainWindow.h"

@implementation UIWindow (MainWindow)

-(void)switchRootViewController
{
    NSString *key = @"CFBundleVersion";
    //上一次的使用版本（存储在沙盒中的版本号）
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults] objectForKey:key];
    
    //当前软件的版本号（从info.plist中获取）
    NSString *currentVersion = [NSBundle mainBundle].infoDictionary[key];
    if ([currentVersion isEqualToString:lastVersion]) {
        //如果是同一个版本，没有新功能的推出
        self.rootViewController = [[MainTabBarController alloc]init];
        
        
    }else
    {
        //如果打开的不是原来的版本就会推出新功能的轮播图
        self.rootViewController = [[NewfeatureViewController alloc]init];
        
        //此时再将已经跟新的版本号存入到沙盒中去
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:key];
        //立即同步存储
        [[NSUserDefaults standardUserDefaults] synchronize];
        
    }
    
}

-(void)backMainRootViewController
{
    self.rootViewController = [[MainTabBarController alloc]init];
}


@end
