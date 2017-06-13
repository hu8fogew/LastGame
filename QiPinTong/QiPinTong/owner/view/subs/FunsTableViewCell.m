//
//  FunsTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/3/30.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "FunsTableViewCell.h"

@implementation FunsTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        //图像
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(DeImageSize);
        }];
        
        //姓名
        self.nameLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).offset(leftToMargin);
            make.bottom.equalTo(self.mas_centerY).offset(-5);
            make.width.mas_equalTo(SCREEN_WIDTH*0.5);
        }];
        
        //地址
        self.addressLab = [UILabel labelWithTextColor:MainColor FontSize:subTitleSize Sview:self];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.top.equalTo(self.mas_centerY).offset(5);
            make.width.mas_equalTo(self.nameLab);
        }];
        
        //加好友按钮
        self.addBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.addBtn setImage:[UIImage imageNamed:@"加好友"] forState:UIControlStateNormal];
        [self.addBtn setImage:[UIImage imageNamed:@"已添加"] forState:UIControlStateSelected];
        self.addBtn.adjustsImageWhenHighlighted = NO;
        [self addSubview:self.addBtn];
        [self.addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-20);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.18));
        }];
        
        UIView *vw = [UIView new];
        vw.backgroundColor = grayC;
        [self addSubview:vw];
        [vw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.addBtn.mas_left).offset(-20);
            make.top.and.bottom.equalTo(self);
            make.width.mas_equalTo(1);
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
