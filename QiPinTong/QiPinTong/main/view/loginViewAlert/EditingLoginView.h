//
//  EditingLoginView.h
//  测试001
//
//  Created by mac on 2017/1/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EditingLoginView;

@protocol EditingLoginViewDelegate <NSObject>
//登录
-(void)EditingLoginViewOnlogin;
//注册
-(void)EditingLoginViewOnsign;
//找回密码
-(void)EditingLoginViewOnfindSecretNum;
@end


@interface EditingLoginView : UIView


@property(nonatomic,assign)id <EditingLoginViewDelegate> delegate;

//展示视图
-(void)alertViewShow;

@end
