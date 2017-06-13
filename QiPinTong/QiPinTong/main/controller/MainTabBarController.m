//
//  MainTabBarController.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "MainTabBarController.h"

@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    //初始化子控制器并添加到tabbar上面
    QPTViewController *homeVc = [[QPTViewController alloc]init];
    [self addChildVc:homeVc title:@"首页" image:@"homeN" selectedImage:@"homeS"];
    
    MessageViewController *messageVc = [[MessageViewController alloc]init];
    [self addChildVc:messageVc title:@"消息" image:@"messageN" selectedImage:@"messageS"];
    
    DiscoverViewController *discoverVc = [[DiscoverViewController alloc]init];
    
    [self addChildVc:discoverVc title:@"发现" image:@"discoveryN" selectedImage:@"discoveryS"];
    
    
    PerOrComViewController *ownerViewCtrl = [[PerOrComViewController alloc]init];
    
//    BOOL isLogin = [[QPTUserDefaults objectForKey:@"loginOrNot"] isEqualToString:@"login"];
    
    
    
//    OwnerViewController *ownerVc = [[OwnerViewController alloc]init];
    
    
    [self addChildVc: ownerViewCtrl title:@"我" image:@"mineN" selectedImage:@"mineS"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  添加一个子控制器
 
 @param childVc  子控制器
 @param title  标题
 @param image 图片
 @param selectedImage 选中的图片
 
 */

-(void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    //设置tab为不透明
    
    [[UITabBar appearance] setTranslucent:NO];
    
    //设置背景色
    [UITabBar appearance].barTintColor = whiteC;
    
    
    //设置子控制器的文字
    childVc.title = title;
    
    //设置子控制器的图片
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//防止渲染
    
    //设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = HWColor(53, 53, 53);
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
    NSMutableDictionary *selectedTextAttrs = [NSMutableDictionary dictionary];
    selectedTextAttrs[NSForegroundColorAttributeName] = HWColor(29, 150, 211);
    
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectedTextAttrs forState:UIControlStateSelected];
    
    //先给外边传进来的小控制器包装一个导航控制器
    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:nav];
    
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    if ([viewController.title isEqualToString:@"消息"]) {
        [self loginAction];
        if([QPTUserInfoManager sharedUserInfoManager].isLogin)
        {
            return YES;
        }else
        {
            return NO;
        }  
    }else
    {
        return YES;
    }
//    return NO;
    
}


//登录判断并执行
-(void)loginAction
{
    if (![QPTUserInfoManager sharedUserInfoManager].isLogin) {
        __weak typeof(self) weakSelf = self;
        UIAlertController *alertCtrl = [self creatControllerWith:orangeC andSubTitleColor:SecondTitleColor andTitle:@"信息提示" andsubText:@"亲，您还没有登录呢！"];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"登录" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            OwnerViewController *ownerVc = [OwnerViewController new];
            
            MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:ownerVc];
            
            [weakSelf presentViewController:nav animated:YES completion:nil];
        }];
        
        [action setValue:deepGrayColor forKey:@"titleTextColor"];
        
        UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"狠心放弃" style:UIAlertActionStyleCancel handler:nil];
        [actionCancel setValue:SecondTitleColor forKey:@"titleTextColor"];
        [alertCtrl addAction:action];
        [alertCtrl addAction:actionCancel];
        
        [self presentViewController:alertCtrl animated:YES completion:nil];
        
    }
    
}

-(UIAlertController *)creatControllerWith:(UIColor *)titleColor andSubTitleColor:(UIColor *)subColor andTitle:(NSString *)title andsubText:(NSString *)text
{
    
    UIAlertController *alertCtrl = [UIAlertController alertControllerWithTitle:title message:text preferredStyle:UIAlertControllerStyleAlert];
    NSMutableAttributedString *titleStr = [[NSMutableAttributedString alloc]initWithString:title attributes:@{NSForegroundColorAttributeName : titleColor,NSFontAttributeName : [UIFont systemFontOfSize:MTitleSize+2]}];
    NSMutableAttributedString *textStr = [[NSMutableAttributedString alloc]initWithString:text attributes:@{NSForegroundColorAttributeName : subColor,NSFontAttributeName : [UIFont systemFontOfSize:subTitleSize]}];
    
    [alertCtrl setValue:titleStr forKey:@"attributedTitle"];
    
    [alertCtrl setValue:textStr forKey:@"attributedMessage"];
    return alertCtrl;
    
}


@end
