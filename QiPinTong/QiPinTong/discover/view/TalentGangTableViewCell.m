//
//  TalentGangTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/5/31.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TalentGangTableViewCell.h"

@implementation TalentGangTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.mas_equalTo(leftToMargin);
            make.size.mas_equalTo(DeImageSize);
        }];
        
        
        self.nameLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView).offset(5);
            make.left.equalTo(self.imgView.mas_right).offset(leftToMargin);
        }];
        
        self.sexIcon = [UIImageView new];
        [self addSubview:self.sexIcon];
        [self.sexIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab.mas_right).offset(3);
            make.centerY.equalTo(self.nameLab);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
        
        self.addressIcon = [UIImageView new];
        self.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.bottom.equalTo(self.imgView).offset(-5);
            make.size.mas_equalTo(CGSizeMake(subTitleSize, subTitleSize));
        }];
        
        self.addressLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.addressIcon);
            make.left.equalTo(self.addressIcon.mas_right).offset(3);
        }];
        
        self.shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.shareBtn.layer.masksToBounds = YES;
        self.shareBtn.layer.cornerRadius = 2;
        self.shareBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
        [self addSubview:self.shareBtn];
        [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(60, 30));
        }];
        
        self.numIcon = [UIImageView new];
        [self addSubview:self.numIcon];
        [self.numIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLab.mas_right).offset(20);
            make.centerY.equalTo(self.addressLab);
            make.size.equalTo(self.addressIcon);
        }];
        
        self.numLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numIcon.mas_right).offset(3);
            make.centerY.equalTo(self.addressLab);
        }];
        
        
        /////
        self.didShareLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.didShareLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.right.equalTo(self.shareBtn);
        }];
        self.shareNoLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.shareNoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.addressLab);
            make.centerX.equalTo(self.didShareLab);
        }];
        
        
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
