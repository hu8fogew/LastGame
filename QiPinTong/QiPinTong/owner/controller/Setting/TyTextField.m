//
//  TyTextField.m
//  QiPinTong
//
//  Created by taylor on 2017/6/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TyTextField.h"

@implementation TyTextField

//禁止粘贴复制全选等
-(BOOL)canPerformAction:(SEL)action withSender:(id)sender{
    UIMenuController *menuController = [UIMenuController sharedMenuController];
    if (menuController) {
        [UIMenuController sharedMenuController].menuVisible = NO;
    }
    
    return NO;
}

@end
