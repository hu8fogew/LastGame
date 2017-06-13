//
//  TAddDetailTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/5/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TAddDetailTableViewCell.h"

@implementation TAddDetailTableViewCell

-(instancetype)initWithFrame:(CGRect)frame isSelect:(BOOL)isSelect{
    self = [super initWithFrame:frame];
    if (self) {
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(DeImageSize);
        }];
        
        self.titleLab = [UILabel labelWithTextColor:MainColor FontSize:mainTitleSize+1 Sview:self];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).offset(leftToMargin);
            make.top.equalTo(self.imgView).offset(2);
        }];
        
        
        self.addressIcon = [UIImageView new];
        self.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.imgView).offset(-2);
            make.left.equalTo(self.titleLab);
            make.size.mas_equalTo(CGSizeMake(mainTitleSize-1, mainTitleSize-1));
        }];
        self.addressLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).offset(1);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        
        self.dateIcon = [UIImageView new];
        self.dateIcon.image = [UIImage imageNamed:@"timeIcon"];
        [self addSubview:self.dateIcon];
        [self.dateIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLab.mas_right).offset(leftToMargin);
            make.centerY.equalTo(self.addressLab);
            make.size.equalTo(self.addressIcon);
        }];
        self.dateLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dateIcon.mas_right).offset(1);
            make.centerY.equalTo(self.dateIcon);
        }];
        
        
        UIImageView *arrowIcon = [UIImageView new];
        arrowIcon.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        [self addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(mainTitleSize, mainTitleSize));
        }];
        
        if (isSelect == YES) {
            arrowIcon.image = [UIImage imageNamed:@""];
            
            self.showLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize Sview:self];
            [self.showLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.right.mas_equalTo(-leftToMargin);
                make.centerY.equalTo(self.titleLab);
            }];
            
            
            ///
            self.nameLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
            [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerY.equalTo(self);
                make.left.equalTo(self.imgView.mas_right).offset(leftToMargin);
            }];
        }
        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
    }
    return self;
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
