//
//  UIWindow+MainWindow.h
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIWindow (MainWindow)


/**
 设置跟视图控制器，同时判断是否是新版本，是否要展示新特性页面；
 */
-(void)switchRootViewController;

/**
 切换跟视图控制器
 */
-(void)backMainRootViewController;
@end
