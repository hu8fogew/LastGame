//
//  PayView.h
//  QiPinTong
//
//  Created by taylor on 2017/6/3.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TyTextField.h"

@protocol PasswordFieldDidChange <NSObject>

-(void)passwordFieldDidChange:(TyTextField *)textField;

@end

@interface PayView : UIView

@property (strong,nonatomic) UIImageView *imgView;
@property (strong,nonatomic) UILabel *titleLab;
@property (strong,nonatomic) UILabel *amountLab;
@property (strong,nonatomic) TyTextField *passwordField;

@property (assign,nonatomic) id<PasswordFieldDidChange> delegate;

@end
