//
//  AppDelegate.m
//  家长界
//
//  Created by mac on 2016/11/9.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "AppDelegate.h"
#import <UserNotifications/UserNotifications.h>
#import "QPTUserInfo.h"
#import "WXApiManger.h"

@interface AppDelegate ()<WXApiDelegate>

@property(nonatomic,strong)QPTUserInfo *userInfo;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    /**
     设置根视图控制器
     */
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    //switchRootViewController此方法是自定义的延展方法（为了判断是否为当前的版本，是否显示新功能的轮播图）
    [self.window switchRootViewController];
    
    [self.window makeKeyAndVisible];
    
    
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
    /**
     设置用户的身份（个人 or 企业）
     */
    
    [QPTFileCacheManger saveUserData:@NO forKey:QPTHasLoginFlag];
    
    
    [QPTFileCacheManger saveUserData:@"个人" forKey:QPTComOrPerOrBusinessIdentifier];
    
    
    
    /*
    UIImageView * launchView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_imageF.jpg"]];
    
    launchView.frame=self.window.bounds;
    launchView.contentMode=UIViewContentModeScaleAspectFill;
    [self.window addSubview:launchView];
    //动画效果(你也可以这只其他，这种timeOut效果不错，用过MBProgressHUD人都知道)
    //在两秒内将alpha设置为0，之后在移除
    [UIView animateWithDuration:2.0f delay:0.0f options:UIViewAnimationOptionBeginFromCurrentState
                     animations:^{
                         launchView.alpha=0.0f;
                         launchView.layer.transform=CATransform3DScale(CATransform3DIdentity,1.2,1.2,1);
                     }
                     completion:^(BOOL finished) {
                         [launchView removeFromSuperview];
                     }];
    
    */
    
    
    
    
    /*融云*/
    
    [[RCIM sharedRCIM]initWithAppKey:QPTRongCouldAppKey];
    
    _userInfo = [QPTUserInfo new];
    
    [[RCIM sharedRCIM] setUserInfoDataSource:_userInfo];
    
    
    
    /**
     *  版本推送
     */
 /*
    if (iOS10) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        center.delegate = self;
        [center requestAuthorizationWithOptions:(UNAuthorizationOptionBadge | UNAuthorizationOptionSound | UNAuthorizationOptionAlert) completionHandler:^(BOOL granted, NSError * _Nullable error) {
            
            if (granted) {
                //点击允许
                NSLog(@"注册通知成功");
                [center getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings * _Nonnull settings) {
                    NSLog(@"%@", settings);
                }];
            } else {
                //点击不允许
                NSLog(@"注册通知失败");
            }
        }];
        //注册推送（同iOS8）
        [[UIApplication sharedApplication] registerForRemoteNotifications];
        
    }
    
    */
    
    
    
    
    /**
     第三方SDK高德地图
     注册appKey
     */
    [AMapServices sharedServices].apiKey = QPTMapAPPKey;
    
    
    
    
    /**
     
     第三方登录（WeChat——微信）
     注册：appkey
     */
    
    [WXApi registerApp:QPTWeChatAppKey];
    
    //向微信注册支持的文件类型
    UInt64 typeFlag = MMAPP_SUPPORT_TEXT | MMAPP_SUPPORT_PICTURE | MMAPP_SUPPORT_LOCATION | MMAPP_SUPPORT_VIDEO |MMAPP_SUPPORT_AUDIO | MMAPP_SUPPORT_WEBPAGE | MMAPP_SUPPORT_DOC | MMAPP_SUPPORT_DOCX | MMAPP_SUPPORT_PPT | MMAPP_SUPPORT_PPTX | MMAPP_SUPPORT_XLS | MMAPP_SUPPORT_XLSX | MMAPP_SUPPORT_PDF;
    
    [WXApi registerAppSupportContentFlag:typeFlag];
    
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)application:(UIApplication *)app openURL:(NSURL *)url options:(NSDictionary<UIApplicationOpenURLOptionsKey,id> *)options
{
    return [WXApi handleOpenURL:url delegate:[WXApiManger sharedManager]];
}



@end
