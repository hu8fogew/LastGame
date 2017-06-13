//
//  MyProfitTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WalletTableViewCell.h"

@implementation WalletTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.icon = [UIImageView new];
        [self addSubview:self.icon];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin*2);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
        
        self.title = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize-1 Sview:self];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.icon.mas_right).with.offset(leftToMargin);
            make.centerY.equalTo(self);
        }];
        
        self.arrowIcon = [UIImageView new];
        self.arrowIcon.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        [self addSubview:self.arrowIcon];
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.mas_equalTo(-topToMargin);
            make.size.mas_equalTo(CGSizeMake(MTitleSize-1, MTitleSize-1));
        }];
        
        self.showLab = [UILabel labelWithTextColor:orangeC FontSize:MTitleSize-1 Sview:self];
        [self.showLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowIcon.mas_left).with.offset(-2);
            make.centerY.equalTo(self);
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

@end
