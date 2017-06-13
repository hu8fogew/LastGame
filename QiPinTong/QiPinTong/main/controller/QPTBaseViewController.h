//
//  QPTBaseViewController.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/24.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SDCycleScrollView,SelectBtnView,AwardView;

typedef void(^QPTRefreshAndLoadMoreData)(void);

@interface QPTBaseViewController : UIViewController

/**
 是否登录
 */
@property (nonatomic,assign) BOOL loginOrNot;

/**
 轮播图
 */
@property (nonatomic,strong) SDCycleScrollView *cycleView;

/**
 提示图片（当页面没有列表数组时候提醒）
 */
@property (nonatomic ,strong) UIImageView *promptImage;
/**
 添加提示UI
 1、是否显示
 2、添加在vc之上（insert：above：vc）
 */
-(void) crectPromptViewForUserWith:(BOOL)isShow andView:(UIView *)vc image:(NSString *)imageStr;

/**
 轮播数组
 */
@property (nonatomic ,strong) NSMutableArray *lunboArray;
/**
 判断是否登录，若登不则不执行任何操作，若未登录，则执行登录操作
 */
-(void) loginAction;

/**
 选择按钮
 */
@property (nonatomic ,strong) SelectBtnView *selectView;

/**
 打赏
 */
@property (nonatomic,strong) AwardView *awardVc;
/**
 创建选择按钮试图
 1、传入frame
 2、传入对应数组（表示不同的内容）
 3、传入对应的父试图
 */
-(void)creatSelectViewWith:(CGRect)frame andselectArray:(NSMutableArray *)array andSuperView:(UIView *)superVc;



/**
 打赏
 传入：打赏对象的头像url
    ：打赏对象的名字name
 */

-(void)awardOtherPeopleCoinWithImageStr:(NSURL *)imgStr name:(NSString *)name;

/**
 扫一扫
 扫描二维码，添加好友
 */
-(void)scanOtherPeoplesCode;

/**  
 弹窗、、、、
 */
-(void)alertViewMessage:(NSString *)message;
/**隐藏*/
-(void)hideCurrentView;//
/**删除*/
-(void)okDeleteClick;
@end
