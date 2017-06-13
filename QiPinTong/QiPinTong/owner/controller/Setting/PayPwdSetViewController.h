//
//  PayPwdSetViewController.h
//  QiPinTong
//
//  Created by taylor on 2017/6/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

//密码位数
static NSInteger const  dotCount = 6;
//密码黑点宽高相同
static CGFloat const dotWidth_Height = 10;
//输入框宽高
static CGFloat const fieldWidth_Height = 50;

#import <UIKit/UIKit.h>
#import "TyTextField.h"
@interface PayPwdSetViewController : UIViewController

@property (strong,nonatomic) TyTextField *textField;
@property (strong,nonatomic) NSMutableArray *dotAry;
@property (strong,nonatomic) UILabel *titleLab;

-(void)clearUpPassword;

@end
