//
//  ProfitDeTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ProfitDeTableViewCell.h"

@implementation ProfitDeTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        //标题
        self.titleLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.bottom.equalTo(self.mas_centerY).offset(-5);
        }];
        
        //时间
        self.timeLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab);
            make.top.equalTo(self.mas_centerY).offset(5);
        }];
        
        //金额
        self.amountLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self.titleLab);
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
