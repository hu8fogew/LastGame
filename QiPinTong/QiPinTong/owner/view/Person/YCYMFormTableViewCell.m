//
//  YCYMFormTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/16.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "YCYMFormTableViewCell.h"

@implementation YCYMFormTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        
        //标题
        self.titleLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.centerY.equalTo(self);
            make.width.mas_equalTo(SCREEN_WIDTH*0.7);
        }];
        
        //箭头
        self.arrowIcon = [UIImageView new];
        self.arrowIcon.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        [self addSubview:self.arrowIcon];
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
        
        //选择、填写展示
        self.selectLabel = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        self.selectLabel.textAlignment = NSTextAlignmentRight;
        [self.selectLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowIcon.mas_left).offset(-5);
            make.centerY.equalTo(self.titleLabel);
            make.width.mas_equalTo(SCREEN_WIDTH/2);
        }];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
          
        //右选择按钮
        self.rightLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.rightLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowIcon.mas_left).offset(-5);
            make.centerY.equalTo(self);
        }];
    
        //至lab
        self.lab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.rightLab.mas_left).offset(-5);
            make.centerY.equalTo(self);
        }];
        
        //左选择按钮
        self.leftLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.leftLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.lab.mas_left).offset(-5);
            make.centerY.equalTo(self);

        }];
        
        
        //退出
        self.exitLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.exitLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        
        
        //////
        self.showLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.showLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        
        
        ////////
        self.cityLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.cityLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.mas_equalTo(-leftToMargin);
        }];
        
        
        
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-(10+DeImageSize.width), 10, DeImageSize.width, DeImageSize.height)];
        [self addSubview:self.imgView];
        
    }
    return self;

}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
