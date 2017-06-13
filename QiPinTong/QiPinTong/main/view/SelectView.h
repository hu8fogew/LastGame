//
//  SelectView.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/18.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectView : UIView

/**
 选择按钮试图封装
 1、 传入frame：
 2、文字
 3、图片
 */

-(id)initWithFrame:(CGRect)frame title:(NSString *)title imageStr:(NSString *)imageStr;
@end
