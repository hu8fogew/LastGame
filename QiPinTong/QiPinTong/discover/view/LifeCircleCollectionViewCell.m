//
//  LifeCircleCollectionViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/4/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LifeCircleCollectionViewCell.h"

@implementation LifeCircleCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self.mas_centerY);
            make.size.mas_equalTo(CGSizeMake(25, 25));
        }];
        
        self.tLab = [UILabel new];
        self.tLab.font = [UIFont systemFontOfSize:mainTitleSize];
        self.tLab.textColor = MainColor;
        [self addSubview:self.tLab];
        [self.tLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.equalTo(self.mas_centerY).offset(10);
        }];
        
        
        self.delOrAddBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.delOrAddBtn setImage:[UIImage imageNamed:@"minus_gray"] forState:UIControlStateNormal];
        [self.delOrAddBtn setImage:[UIImage imageNamed:@"add_gray"] forState:UIControlStateSelected];
        self.delOrAddBtn.hidden = YES;
        [self addSubview:self.delOrAddBtn];
        [self.delOrAddBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.and.right.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
        
    }
    return self;
}

@end
