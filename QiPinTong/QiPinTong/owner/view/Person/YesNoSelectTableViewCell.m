//
//  YesNoSelectTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/3/21.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "YesNoSelectTableViewCell.h"

@implementation YesNoSelectTableViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        self.titleLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        self.titleLab.text = @"是否统招";
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.centerY.equalTo(self);
        }];
        
//        是
        self.yesBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.yesBtn.tag = 100;
        self.yesBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
        [self.yesBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
        [self.yesBtn setTitleColor:MainColor forState:UIControlStateSelected];
        [self.yesBtn setTitle:@"是" forState:UIControlStateNormal];
        self.yesBtn.selected = YES;
        [self addSubview:self.yesBtn];
        [self.yesBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self);
        }];
        
        //否
        self.noBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.noBtn.tag = 101;
        self.noBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
        [self.noBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
        [self.noBtn setTitleColor:MainColor forState:UIControlStateSelected];
        [self.noBtn setTitle:@"否" forState:UIControlStateNormal];
        [self addSubview:self.noBtn];
        [self.noBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.yesBtn.mas_left).offset(-leftToMargin);
            make.centerY.equalTo(self);
        }];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self);
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
