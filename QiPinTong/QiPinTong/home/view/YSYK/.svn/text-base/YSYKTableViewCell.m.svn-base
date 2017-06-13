//
//  YSYKFirstTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/2.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKTableViewCell.h"

@implementation YSYKTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46-5)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.imgView = [UIImageView new];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.top.equalTo(vi).with.offset(15);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.23, SCREEN_WIDTH*0.19));
        }];
        
        self.titleLabel = [self addLabelWithFont:18 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
            make.top.equalTo(self.imgView);
        }];
    
        self.addressLabel = [self addLabelWithFont:14 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.imgView);
            make.left.equalTo(self.titleLabel);
        }];
        
        self.typeLabel = [self addLabelWithFont:14 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.addressLabel);
            make.left.equalTo(self.addressLabel.mas_right).with.offset(10);
        }];

        
        self.parkIcon = [UIImageView new];
        [vi addSubview:self.parkIcon];
        [self.parkIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];

        self.wifiIcon = [UIImageView new];
        [vi addSubview:self.wifiIcon];
        [self.wifiIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.parkIcon.mas_left).with.offset(-6);
            make.centerY.equalTo(self.parkIcon);
            make.size.mas_equalTo(CGSizeMake(18, 18));
        }];

        self.priceLabel = [UILabel new];
        self.priceLabel.font = [UIFont systemFontOfSize:15];
//        self.rightTlabel.textColor = HWColor(252, 13, 27);
        [vi addSubview:self.priceLabel];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.parkIcon);
            make.centerY.equalTo(self.imgView);
        }];

        self.averageLabel = [UILabel new];
        self.averageLabel.font = [UIFont systemFontOfSize:15];
//        self.rightTLlabel.textColor = HWColor(102, 102, 102);
        [vi addSubview:self.averageLabel];
        [self.averageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.priceLabel.mas_left).with.offset(-3);
            make.centerY.equalTo(self.priceLabel);
        }];

        self.distanceLabel = [self addLabelWithFont:14 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [vi addSubview:self.distanceLabel];
        [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.priceLabel);
            make.centerY.equalTo(self.addressLabel);
        }];

        UIView *hv = [UIView new];
        hv.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.right.equalTo(vi);
            make.height.mas_equalTo(1);
            make.top.equalTo(self.addressLabel.mas_bottom).with.offset(vi.height/13);
        }];

        self.firstIcon = [UIImageView new];
        [vi addSubview:self.firstIcon];
        [self.firstIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLabel);
            make.top.equalTo(hv).with.offset(vi.height/16);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];

        self.firstLabel = [UILabel new];
        self.firstLabel.font = [UIFont systemFontOfSize:15];
        self.firstLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.firstLabel];
        [self.firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.firstIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.firstIcon);
        }];

        self.secondIcon = [UIImageView new];
        [vi addSubview:self.secondIcon];
        [self.secondIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.firstIcon);
            make.top.equalTo(self.firstIcon.mas_bottom).with.offset(vi.height/16);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        
        self.secondLabel = [UILabel new];
        self.secondLabel.font = [UIFont systemFontOfSize:15];
        self.secondLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:self.secondLabel];
        [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.secondIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.secondIcon);
        }];
    }
    return self;
}

-(UILabel *)addLabelWithFont:(CGFloat)font andTextColor:(UIColor *)textColor andSview:(UIView *)sView{
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    [sView addSubview:lab];
    return lab;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
