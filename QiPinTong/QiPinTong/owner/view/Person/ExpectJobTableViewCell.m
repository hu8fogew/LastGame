//
//  ExpectJobTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/2/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ExpectJobTableViewCell.h"

@implementation ExpectJobTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        //地址
        self.addressLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.bottom.equalTo(self.mas_centerY).offset(-5);
        }];
        
        //职位
        self.postLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.postLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLabel.mas_right).offset(leftToMargin);
            make.centerY.equalTo(self.addressLabel);
        }];
        
        //箭头
        UIImageView *arrowIcon = [UIImageView new];
        arrowIcon.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        [self addSubview:arrowIcon];
        [arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
        
        //薪资
        self.salaryLabel = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.salaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLabel);
            make.top.equalTo(self.mas_centerY).offset(5);
        }];
        
        //行业
        self.industryLabel = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.industryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.salaryLabel.mas_right).offset(leftToMargin);
            make.centerY.equalTo(self.salaryLabel);
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
