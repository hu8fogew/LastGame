//
//  JoinInView.m
//  QiPinTong
//
//  Created by taylor on 2017/3/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "JoinInView.h"

@implementation JoinInView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self creatVc];
        
    }
    return self;
}


-(void)creatVc
{
    UIImageView *imgView = [UIImageView new];
    self.imageVc = imgView;
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).with.offset(leftToMargin);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(26, 26));
    }];
    
    UILabel *lab = [UILabel new];
    self.lab = lab;
    lab.font = [UIFont systemFontOfSize:mainTitleSize];
    [self addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).with.offset(5);
        make.centerY.equalTo(imgView);
        make.width.mas_equalTo(SCREEN_WIDTH*0.6);

    }];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.selBtn = button;
    button.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize-1];
    button.layer.borderWidth = 1;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = self.selBtn.layer.borderColor;
    button.layer.cornerRadius = 13;
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self).with.offset(-leftToMargin);
        make.centerY.equalTo(imgView);
        make.size.mas_equalTo(CGSizeMake(80, 26));
    }];
}

-(void)setPropertyWithLabText:(NSString *)strLab andLabC:(UIColor *)color andBtnTitle:(NSString *)btnText andBtnTextC:(UIColor *)btnColor andImage:(UIImage *)img andTarget:(id)target andAction:(SEL)action{
    //图片
    self.imageVc.image = img;
    
    //lab
    self.lab.text = strLab;
    self.lab.textColor = color;
    
    //按钮
    [self.selBtn setTitle:btnText forState:UIControlStateNormal];
    [self.selBtn setTitleColor:btnColor forState:UIControlStateNormal];
    self.selBtn.layer.borderColor = btnColor.CGColor;
    [self.selBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
}

@end
