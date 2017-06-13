//
//  QPTBaseViewController.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/24.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTBaseViewController.h"
#import "QRCodeScanningVC.h"
#import "CCPActionSheetView.h"

@interface QPTBaseViewController ()<SDCycleScrollViewDelegate,BtnViewDidSelectDelegate,AwardViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic ,strong)CCPActionSheetView *ccpView;

@end

@implementation QPTBaseViewController



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    //当侧滑手势的时候，设置scrollView需要此手势才能生效即可。
    NSArray *gestureArray = self.navigationController.view.gestureRecognizers;
    
    for (UIGestureRecognizer *gesture in gestureArray) {
        
        if ([gesture isKindOfClass:[UIScreenEdgePanGestureRecognizer class]]) {
            
            for (UIView *subV in self.view.subviews) {
                if ([subV isKindOfClass:[UIScrollView class]]) {
                    
                    UIScrollView *sc = (UIScrollView *)subV;
                    
                    [sc.panGestureRecognizer requireGestureRecognizerToFail:gesture];
                }
            }
        }
    }
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = whiteC;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    //侧滑手势
    
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        
        
        self.navigationController.interactivePopGestureRecognizer.delegate = self;
    }
    
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark ---Action
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

//弹窗
-(void)alertViewMessage:(NSString *)message
{
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/6, SCREEN_HEIGHT/4, SCREEN_WIDTH*3/4, SCREEN_WIDTH*1/3-10)];
    vi.backgroundColor = whiteC;
    
    vi.layer.cornerRadius = 6;
    vi.layer.masksToBounds = YES;
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 30, SCREEN_WIDTH*3/4-30, 30) andTextColor:deepGrayColor andTextFont:mainTitleSize];
    lab.backgroundColor = clearC;
    lab.text = message;
    lab.font = [UIFont systemFontOfSize:MTitleSize+2 weight:1.0];
    [vi addSubview:lab];
    
    UIButton *cancelB = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelB.frame = CGRectMake(vi.width-120, vi.height-30, 45, 20);
    [cancelB setTitle:@"取消" forState:UIControlStateNormal];
    cancelB.backgroundColor = clearC;
    [cancelB setTitleColor:SecondTitleColor forState:UIControlStateNormal];
    [cancelB addTarget:self action:@selector(cancelDeleteClick) forControlEvents:UIControlEventTouchUpInside];
    [vi addSubview:cancelB];
    
    UIButton *okB = [UIButton buttonWithType:UIButtonTypeCustom];
    okB.frame = CGRectMake(cancelB.right+20, vi.height-30, 45, 20);
    [okB setTitle:@"确定" forState:UIControlStateNormal];
    okB.backgroundColor = clearC;
    [okB setTitleColor:blueC forState:UIControlStateNormal];
    [okB addTarget:self action:@selector(okDeleteClick) forControlEvents:UIControlEventTouchUpInside];
    [vi addSubview:okB];
    
    CCPActionSheetView *sheet =[[CCPActionSheetView alloc]initWithAlertView:vi];
    self.ccpView = sheet;
    
    sheet.viewAnimateStyle = ViewAnimateScale;
    //    }
}

-(void)hideCurrentView
{
    [self.ccpView removeFromSuperview];
    self.ccpView = nil;
}

//取消
-(void)cancelDeleteClick
{
    //0、147、221
    [self.ccpView removeFromSuperview];
    self.ccpView = nil;
    //    self.ccpView.isBGClose = YES;
}





//判断登录
-(BOOL)loginOrNot
{
    return [QPTUserInfoManager sharedUserInfoManager].isLogin;
}


//创建父试图
-(void)creatSelectViewWith:(CGRect)frame andselectArray:(NSMutableArray *)array andSuperView:(UIView *)superVc
{
    self.selectView = [[SelectBtnView alloc]initWithFrame:frame];
    
    self.selectView.selectButtonArray = array;
    
    self.selectView.delegate = self;
    
    [superVc addSubview:self.selectView];
    
    
}


//打赏
-(void)awardOtherPeopleCoinWithImageStr:(NSURL *)imgStr name:(NSString *)name
{
    
    AwardView *popView = [[AwardView alloc]initWithHeaderImage:imgStr andName:name delegate:self completion:nil];
    self.awardVc = popView;
    popView.animationType = SK_TYPE_LARGEN;
    popView.animationDirection = SK_SUBTYPE_FROMCENTER;
    popView.animationDuration = 0.5;
    popView.enableAnimation = YES;
    [popView show];
}

//添加提示UI
-(void)crectPromptViewForUserWith:(BOOL)isShow andView:(UIView *)vc image:(NSString *)imageStr
{
    if (isShow) {
        
        self.promptImage.image = [UIImage imageNamed:imageStr];
        [self.view insertSubview:self.promptImage aboveSubview:vc];
        [self.promptImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self.view);
            make.right.equalTo(self.view).with.offset(-80);
            make.left.equalTo(self.view).with.offset(80);
            make.height.mas_equalTo(240);
        }];
    }else
    {
        [self.promptImage removeFromSuperview];
        self.promptImage = nil;
        
    }
    
}

/**
 扫一扫
 扫描二维码，添加好友
 */
-(void)scanOtherPeoplesCode
{
    //获取摄像机设备
    AVCaptureDevice *device = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    
    if (device) {
        
        AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
        if (status == AVAuthorizationStatusNotDetermined) {
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                
                if (granted) {
                    
                    dispatch_async(dispatch_get_main_queue(), ^{
                        
                        QRCodeScanningVC *vc = [[QRCodeScanningVC alloc]init];
                        
                        [self.navigationController pushViewController:vc animated:YES];
                        
                    });
                    
                    HWLog(@"用户第一次同意了访问相机权限");
                    
                }else
                {
                    HWLog(@"用户拒绝了访问相机权限");
                }
                
            }];
            
        }else if (status == AVAuthorizationStatusAuthorized)//用户允许当前应用访问相机
        {
            QRCodeScanningVC *vc = [[QRCodeScanningVC alloc]init];
            
            [self.navigationController pushViewController:vc animated:YES];
            
        }else if (status == AVAuthorizationStatusDenied)//用户拒绝了当前的应用访问相机
        {
            UIAlertController *alertCtl = [self creatControllerWith:MainColor andSubTitleColor:SecondTitleColor andTitle:@"⚠️警告" andsubText:@"请去->[设置 - 隐私 - 相机 -企聘通] 打开访问开关"];
            
            
            UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                
            }];
            [alertAction setValue:deepGrayColor forKey:@"titleTextColor"];
            [alertCtl addAction:alertAction];
            
            [self presentViewController:alertCtl animated:YES completion:nil];
        }else if (status == AVAuthorizationStatusRestricted)
        {
            [LWAlertView shoWithMessage:@"因为系统问题，无法访问相册"];
//            HWLog(@"因为系统问题，无法访问相册");
        }
        
    }else
    {
        UIAlertController *alertCtrl = [self creatControllerWith:orangeC andSubTitleColor:SecondTitleColor andTitle:@"温馨提示" andsubText:@"未监测到您的摄像头"];
        
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alertAction setValue:deepGrayColor forKey:@"titleTextColor"];
        [alertCtrl addAction:alertAction];
        
        [self presentViewController:alertCtrl animated:YES completion:nil];
        
    }
}




#pragma mark lazy____懒加载
//轮播数组
-(NSMutableArray *)lunboArray
{
    if (!_lunboArray) {
        _lunboArray = [NSMutableArray array];
    }
    return _lunboArray;
}

//轮播图
-(SDCycleScrollView *)cycleView
{
    if (!_cycleView) {
        
        _cycleView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight) delegate:self placeholderImage:[UIImage imageNamed:@"scroll1.jpg"]];
        _cycleView.currentPageDotColor = blueC;
        _cycleView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        if (self.lunboArray.count == 0) {
            NSArray *imagesURLStrings = @[
                                          @"http://mob.qipintong.com/assets/js/kindeditor/attached/image/20161114/20161114150030_0003.png",
                                          @"http://mob.qipintong.com/assets/js/kindeditor/attached/image/20161114/20161114145642_5831.png",
                                          @"http://mob.qipintong.com/assets/js/kindeditor/attached/image/20161114/20161114145705_0472.png"
                                          ];
            [self.lunboArray addObjectsFromArray:imagesURLStrings];
        }
        _cycleView.imageURLStringsGroup = self.lunboArray;
        
    }
    return _cycleView;
}







@end
