//
//  JoinInView.h
//  QiPinTong
//
//  Created by taylor on 2017/3/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JoinInView : UIView

@property(nonatomic,strong)UIImageView *imageVc;
@property(nonatomic,strong)UILabel *lab;
@property(nonatomic,strong)UIButton *selBtn;


-(void)setPropertyWithLabText:(NSString *)strLab andLabC:(UIColor *)color andBtnTitle:(NSString *)btnText andBtnTextC:(UIColor *)btnColor andImage:(UIImage *)img andTarget:(id)target andAction:(SEL)action;

-(id)initWithFrame:(CGRect)frame;


@end
