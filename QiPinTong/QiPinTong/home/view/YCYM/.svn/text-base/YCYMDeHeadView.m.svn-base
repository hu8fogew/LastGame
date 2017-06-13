//
//  YCYMDeHeadView.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCYMDeHeadView.h"

@implementation YCYMDeHeadView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46-10)];
        [self addSubview:self.backImageView];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SCREEN_WIDTH*0.17/2;
        [self.backImageView addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.backImageView).with.offset(SCREEN_WIDTH*0.17/5);
            make.centerX.equalTo(self.backImageView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.17, SCREEN_WIDTH*0.17));
        }];
        
        self.nameLabel = [self createLabelWithFont:15 andTextColor:[UIColor whiteColor] andSview:self];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).with.offset(SCREEN_WIDTH*0.17/6);
            make.centerX.equalTo(self.imgView);
        }];
        
        UIView *hv = [UIView new];
        hv.backgroundColor = [UIColor whiteColor];
        [self.backImageView addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.backImageView);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.17/7);
            make.size.mas_equalTo(CGSizeMake(1, 14));
        }];
        
        self.attentionLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:self.backImageView];
        [self.attentionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(hv).with.offset(-8);
            make.centerY.equalTo(hv);
        }];
        
        self.fansLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:self.backImageView];
        [self.fansLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(hv);
            make.left.equalTo(hv).with.offset(8);
        }];
        
        self.infoLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:self.backImageView];
        [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.attentionLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.17/8);
            make.right.equalTo(hv).with.offset(-3);
        }];
        
        self.statusLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:self.backImageView];
        [self.statusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hv).with.offset(3);
            make.centerY.equalTo(self.infoLabel);
        }];
        
        self.addressLabel = [self createLabelWithFont:13 andTextColor:[UIColor whiteColor] andSview:self.backImageView];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.statusLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self.statusLabel);
        }];
        
        self.backImageView.userInteractionEnabled = YES;
        self.loveIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.loveIcon setImage:[UIImage imageNamed:@"love"] forState:UIControlStateNormal];
        [self.backImageView addSubview:self.loveIcon];
        [self.loveIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.backImageView).with.offset(-15);
            make.top.equalTo(self.imgView);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        
        self.sendIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.sendIcon setImage:[UIImage imageNamed:@"send"] forState:UIControlStateNormal];
        [self.backImageView addSubview:self.sendIcon];
        [self.sendIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.loveIcon.mas_left).with.offset(-5);
            make.centerY.equalTo(self.loveIcon);
            make.size.mas_equalTo(CGSizeMake(16, 14));
        }];
    }
    return self;
}


-(UILabel *)createLabelWithFont:(CGFloat)font andTextColor:(UIColor *)textColor andSview:(UIView *)sView{
    
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    [sView addSubview:lab];
    
    return lab;
}


@end
