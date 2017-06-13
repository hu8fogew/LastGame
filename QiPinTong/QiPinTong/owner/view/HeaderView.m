//
//  MemberHeaderView.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "HeaderView.h"

@implementation HeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backImgView = [[UIImageView alloc]initWithFrame:self.bounds];
        self.backImgView.userInteractionEnabled = YES;
        [self addSubview:self.backImgView];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SubImageSize.width/2;
        self.imgView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(setImageTap)];
        [self.imgView addGestureRecognizer:tap];
        
        [self.backImgView addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.centerY.equalTo(self.backImgView);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        //登录状态
        self.typeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.typeBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize+1];
        [self.typeBtn setTitleColor:orangeC forState:UIControlStateNormal];
        [self.typeBtn setTitle:@"请登陆，与企聘通零接触！" forState:UIControlStateNormal];
        [self.typeBtn addTarget:self action:@selector(typeClick) forControlEvents:UIControlEventTouchUpInside];
        [self.backImgView addSubview:self.typeBtn];
        [self.typeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(leftToMargin);
            make.bottom.equalTo(self.imgView.mas_centerY);
        }];
        
        //模式设置
        self.setupBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.setupBtn.titleLabel.font = [UIFont systemFontOfSize:subTitleSize+1];
        [self.setupBtn setTitleColor:whiteC forState:UIControlStateNormal];
        [self.setupBtn setTitle:@"模式状态" forState:UIControlStateNormal];
        [self.setupBtn addTarget:self action:@selector(setImageTap) forControlEvents:UIControlEventTouchUpInside];
        [self.backImgView addSubview:self.setupBtn];
        [self.setupBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeBtn);
            make.top.equalTo(self.imgView.mas_centerY);
        }];
    
        
        UIImageView *arrow = [UIImageView new];
        arrow.image = [UIImage imageNamed:@"rwhiteArrowIcon"];
        [self.backImgView addSubview:arrow];
        [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.equalTo(self.backImgView);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
        
        
        //编辑按钮
        self.editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [self.editBtn addTarget:self action:@selector(editClick) forControlEvents:UIControlEventTouchUpInside];
        self.editBtn.titleLabel.textColor = whiteC;
        self.editBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
        [self.backImgView addSubview:self.editBtn];
        [self.editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(arrow.mas_left).with.offset(-3);
            make.centerY.equalTo(self.imgView);
        }];
        
    }
    return self;
}

-(void)typeClick{
    if (_delegate && [_delegate respondsToSelector:@selector(typeBtnClick)]) {
        [_delegate typeBtnClick];
    }
}

-(void)editClick
{
    if (_delegate && [_delegate respondsToSelector:@selector(editOwnerInformation)]) {
        [_delegate editOwnerInformation];
    }
}

-(void)setImageTap
{
    if (_delegate && [_delegate respondsToSelector:@selector(setOwnerImage)]) {
        [_delegate setOwnerImage];
    }
}

@end
