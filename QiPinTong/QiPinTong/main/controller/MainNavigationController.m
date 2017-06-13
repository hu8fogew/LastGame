//
//  MainNavigationController.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "MainNavigationController.h"

@interface MainNavigationController ()

@end

@implementation MainNavigationController

+(void)initialize
{
    
    [self setupBarButtonItemTheme];
    [self setupNavigationBarTheme];
    
}


//设置UINavigationBarTheme主题
+ (void)setupNavigationBarTheme {
    
    UINavigationBar *appearance = [UINavigationBar appearance];
    
    //设置导航不透明
    [appearance setTranslucent:NO];
//    appearance.barTintColor = whiteC;
    //设置导航的颜色
    [appearance setBarTintColor:blueC];
    //设置导航文字的大小、颜色等属性
    [appearance setTitleTextAttributes:@{NSForegroundColorAttributeName : whiteC,NSFontAttributeName : [UIFont systemFontOfSize:17]}];
    
    //设置文字属性
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:17];
    //设置导航栏背景
//    if (!iOS7){
//        [appearance setBackgroundImage:[UIImage imageWithName:@"whiteView"] forBarMetrics:UIBarMetricsDefault];
//        textAttrs[NSShadowAttributeName] = [[NSShadow alloc] init];
//    }
    
    
    
}

//设置UIBarButtonItem的主题
+ (void)setupBarButtonItemTheme
{
    // 通过appearance对象能修改整个项目中所有UIBarButtonItem的样式
    UIBarButtonItem *appearance = [UIBarButtonItem appearance];
    
    /**设置文字属性**/
    // 设置普通状态的文字属性
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:HWColor(254, 129, 0), NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateNormal];
    
    
    // 设置高亮状态的文字属性
    //    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:SWCommonColor, NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateHighlighted];
    
    // 设置不可用状态(disable)的文字属性
    [appearance setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor lightGrayColor], NSForegroundColorAttributeName,[UIFont systemFontOfSize:15],NSFontAttributeName,nil] forState:UIControlStateDisabled];
    /**设置背景**/
    // 技巧: 为了让某个按钮的背景消失, 可以设置一张完全透明的背景图片
    [appearance setBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  重写的目的是：能够拦截所有push进来的控制器
 *
 *  @param viewController 即将push进来的控制器
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.viewControllers.count > 0) {
        //这时候push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        /*自动显示和隐藏tabbar*/
        viewController.hidesBottomBarWhenPushed = YES;
        UINavigationItem *vcBtnItem = [viewController navigationItem];
        /*设置导航栏上面的内容*/
        //设置左边的按钮
        if (self.viewControllers.count>0 && self.viewControllers.count<2) {
            vcBtnItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"left_nav_lef" highImage:@"left_nav_lef" andTitle:[[self.childViewControllers lastObject] title]];
        }else
        {
            vcBtnItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(back) image:@"left_nav_lef" highImage:@"left_nav_lef" andTitle:@"返回"];
        }
        
        
        
        
        //设置右边的按钮
//        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithTarget:self action:@selector(more) image:@"" highImage:@""];
    }
    
    [super pushViewController:viewController animated:animated];
    
}

-(void)back
{
    
    
    
    [self popViewControllerAnimated:YES];
    
}

//-(void)more
//{
//    [self popToRootViewControllerAnimated:YES];
//    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
