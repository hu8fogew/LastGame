//
//  InvestorTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InvestorTableViewCell.h"

@implementation InvestorTableViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        self.nameLabel = [self createLabelWithFont:mainTitleSize andTextColor:MainColor andSview:self];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.mas_equalTo(10);
        }];
        
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.16/6);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.16, SCREEN_WIDTH*0.16));
        }];
        
        self.titleLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:MainColor andSview:self];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(8);
            make.top.equalTo(self.imgView);
        }];
        
        self.vIcon = [UIImageView new];
        [self addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(descTitleSize, descTitleSize));
        }];
        
        self.fieldLabel = [self createLabelWithFont:descTitleSize andTextColor:SecondTitleColor andSview:self];
        [self.fieldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.centerY.equalTo(self.imgView);
        }];
        
        self.numberLabel = [self createLabelWithFont:descTitleSize andTextColor:SecondTitleColor andSview:self];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.left.equalTo(self.fieldLabel);
        }];
        
        self.arrowIcon = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:self.arrowIcon];
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.fieldLabel);
            make.right.equalTo(self).with.offset(-10);
            make.size.mas_equalTo(self.vIcon);
        }];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 10));
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


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
