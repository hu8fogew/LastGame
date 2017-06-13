//
//  EditingLoginView.m
//  测试001
//
//  Created by mac on 2017/1/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "EditingLoginView.h"
#import "EditingAlertController.h"
#define AlertViewContactHeight 180
#define AlertViewAddressHeight 280

@interface EditingLoginView()<EditingAlertControllerDelegate>
@property(nonatomic,strong)EditingAlertController *alertViewCtl;
@property(nonatomic,strong)UIView *blackView;
@property(nonatomic,strong)UIView *bgView;

@end




@implementation EditingLoginView


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        self.blackView= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
        
        self.blackView.backgroundColor = [UIColor blackColor];
        self.blackView.alpha = 0.3;
        [self addSubview:self.blackView];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
    }
    return self;
}

-(void)alertViewShow
{
    if (self.bgView) return;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.bgView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT, SCREEN_WIDTH, 266)];
    self.bgView.backgroundColor = [UIColor clearColor];
    self.bgView.userInteractionEnabled = YES;
    //添加视图
    [self.bgView addSubview:self.alertViewCtl.view];
    [self addSubview:self.bgView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
    self.blackView.userInteractionEnabled = YES;
    [self.blackView addGestureRecognizer:tap];
    
    [UIView animateWithDuration:0.5 animations:^{
        self.bgView.y = SCREEN_HEIGHT - 266;
    }];
    [window addSubview:self];
}

#pragma mark -------tap手势移除当前的视图
-(void)tap:(UITapGestureRecognizer *)tap
{
    [self alertViewClose];
}

-(void)alertViewClose
{
    [UIView animateWithDuration:0.5 animations:^{
        self.bgView.y = SCREEN_HEIGHT;
        self.blackView.alpha = 0;
    } completion:^(BOOL finished) {
        [self.bgView removeFromSuperview];
        self.bgView = nil;
        [self removeFromSuperview];
    }];
}

//代理
-(void)ownerSign{
    
    if (_delegate && [_delegate respondsToSelector:@selector(EditingLoginViewOnsign)]) {
        [_delegate EditingLoginViewOnsign];
    }
    
}
-(void)ownerFindSecretNum
{
    
    if (_delegate && [_delegate respondsToSelector:@selector(EditingLoginViewOnfindSecretNum)]) {
        [_delegate EditingLoginViewOnfindSecretNum];
    }
}
-(void)ownerLogin
{
    
    if (_delegate && [_delegate respondsToSelector:@selector(EditingLoginViewOnlogin)]) {
        [_delegate EditingLoginViewOnlogin];
    }
}



#pragma mark --------监听收键盘的动作
-(void)keyboardWillChange:(NSNotification *)notification
{
    //1、获取键盘的Y值；
    NSDictionary *dic = notification.userInfo;
    //键盘的frame
    CGRect keyboardFrame = [dic [UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    //获取动画执行的时间
    CGFloat duration = [dic [UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    NSLog(@"%f",duration);
    //2、计算需要移动的距离
    CGFloat selfY = keyboardY - self.height;
    
    [UIView animateWithDuration:duration delay:0.0 options:7<<16 animations:^{
        //需要执行的动画代码
        self.y = selfY;
    } completion:^(BOOL finished) {
        if (_bgView == nil) {
            
            [self removeFromSuperview];
        }
    }];
}


-(EditingAlertController *)alertViewCtl
{
    if (!_alertViewCtl) {
        _alertViewCtl = [[EditingAlertController alloc]init];
        _alertViewCtl.view.frame = CGRectMake(0, 0, SCREEN_WIDTH, 266);
        _alertViewCtl.delegate = self;
    }
    return _alertViewCtl;
}




@end
