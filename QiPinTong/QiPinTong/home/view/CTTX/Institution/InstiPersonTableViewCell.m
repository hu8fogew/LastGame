//
//  InstiPersonTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InstiPersonTableViewCell.h"

@implementation InstiPersonTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.mas_equalTo(10);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        self.nameLabel = [self createLabelWithFont:mainTitleSize andTextColor:MainColor andSview:self];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
            make.top.equalTo(self.imgView);
        }];
        
        self.vIcon = [UIImageView new];
        [self addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.nameLabel);
            make.size.mas_equalTo(CGSizeMake(mainTitleSize-1, mainTitleSize-1));
        }];
        
        self.fieldLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:SecondTitleColor andSview:self];
        [self.fieldLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.centerY.equalTo(self.imgView);
        }];
        
        self.stageLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:SecondTitleColor andSview:self];
        [self.stageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.bottom.equalTo(self.imgView.mas_bottom);
        }];
        
        self.titleLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:SecondTitleColor andSview:self];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.equalTo(self.nameLabel);
        }];
        
        self.fundLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:SecondTitleColor andSview:self];
        [self.fundLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.titleLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.titleLabel);
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

-(UILabel *)createLabelWithFont:(CGFloat)font andTextColor:(UIColor *)textColor andSview:(UIView *)sView{
    
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    [sView addSubview:lab];
    
    return lab;
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
