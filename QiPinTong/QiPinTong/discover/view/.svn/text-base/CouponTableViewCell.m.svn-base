//
//  CouponTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "CouponTableViewCell.h"

@implementation CouponTableViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.3-10)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.imgView = [UIImageView new];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.centerY.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.18));
        }];
        
        self.titleLabel = [self createLabelWithFont:15 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
            make.top.equalTo(self.imgView);
        }];
        
        self.typeLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        self.typeLabel.layer.borderColor = [HWColor(153, 153, 153)CGColor];
        self.typeLabel.layer.borderWidth = 1;
        self.typeLabel.layer.masksToBounds = YES;
        self.typeLabel.layer.cornerRadius = 3;
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.centerY.equalTo(self.imgView);
        }];
        
        self.kindLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        self.kindLabel.layer.borderColor = [HWColor(153, 153, 153)CGColor];
        self.kindLabel.layer.borderWidth = 1;
        self.kindLabel.layer.masksToBounds = YES;
        self.kindLabel.layer.cornerRadius = 3;
        [self.kindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self.typeLabel);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        self.addressLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.couponView = [UIView new];
        [vi addSubview:self.couponView];
        [self.couponView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.centerY.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.34, SCREEN_WIDTH*0.23));
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCview)];
        [self.couponView addGestureRecognizer:tap];
        
        self.priceLabel = [self createLabelWithFont:20 andTextColor:[UIColor whiteColor] andSview:self.couponView];
        self.priceLabel.font = [UIFont systemFontOfSize:25 weight:UIFontWeightBold];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.couponView);
            make.top.equalTo(self.couponView).with.offset(SCREEN_WIDTH*0.23/8);
        }];
        
        self.RMB = [self createLabelWithFont:15 andTextColor:[UIColor whiteColor] andSview:self.couponView];
        [self.RMB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.priceLabel.mas_left).with.offset(-3);
            make.bottom.equalTo(self.priceLabel.mas_bottom);
        }];
        
        self.yuan = [self createLabelWithFont:15 andTextColor:[UIColor whiteColor] andSview:self.couponView];
        [self.yuan mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.priceLabel.mas_right);
            make.bottom.equalTo(self.priceLabel.mas_bottom);
        }];
        
        self.useBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.useBtn setTitle:@"立即领取" forState:UIControlStateNormal];
        [self.useBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.useBtn.layer.borderColor = [[UIColor whiteColor]CGColor];
        self.useBtn.layer.borderWidth = 1;
        self.useBtn.layer.masksToBounds = YES;
        self.useBtn.layer.cornerRadius = 3;
        self.useBtn.userInteractionEnabled = NO;
        self.useBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [vi addSubview:self.useBtn];
        [self.useBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.priceLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.23/10);
            make.centerX.equalTo(self.couponView);
            make.size.mas_equalTo(CGSizeMake(70, 25));
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

-(void)clickCview{
    HWLog(@"1111");
    [self.useBtn setTitle:@"立即使用" forState:UIControlStateNormal];
    [self.useBtn setTitleColor:HWColor(51, 51, 51) forState:UIControlStateNormal];
    self.useBtn.layer.borderColor = [HWColor(51, 51, 51)CGColor];
    self.useBtn.layer.borderWidth = 1;
    self.couponView.userInteractionEnabled = NO;
    self.useBtn.userInteractionEnabled = YES;
}

-(void)useBtnClick{
    HWLog(@"888888");
}

@end
