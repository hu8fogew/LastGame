//
//  UILabel+Extension.m
//  QiPinTong
//
//  Created by taylor on 2017/5/2.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "UILabel+Extension.h"

@implementation UILabel (Extension)

+(instancetype)labelWithTextColor:(UIColor *)color FontSize:(CGFloat)size Sview:(UIView *)sView{
    UILabel *label = [UILabel new];
    label.textColor = color;
    label.font = [UIFont systemFontOfSize:size];
    [sView addSubview:label];
    
    return label;
}

@end
