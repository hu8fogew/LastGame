//
//  TeamDetailTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/5/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TeamListTableViewCell.h"

@implementation TeamListTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(DeImageSize);
        }];
        
        self.nameLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).offset(leftToMargin);
            make.bottom.equalTo(self.imgView.mas_centerY);
        }];
        
        self.postLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.postLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab.mas_right).offset(topToMargin);
            make.centerY.equalTo(self.nameLab);
        }];
        
        self.departmentLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.departmentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.bottom.equalTo(self.imgView);
        }];
        
        self.arrowIcon = [UIImageView new];
        self.arrowIcon.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        [self addSubview:self.arrowIcon];
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
        
        self.addressLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowIcon.mas_left).offset(-3);
            make.centerY.equalTo(self.nameLab);
        }];
        
        self.dateLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.addressLab);
            make.centerY.equalTo(self.departmentLab);
        }];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(self);
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
