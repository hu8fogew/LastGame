//
//  FooterTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/7.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "FooterTableViewCell.h"

@implementation FooterTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        
        self.titleLabel = [self addLabelWithFont:mainTitleSize andTextColor:whiteC andSview:self];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.top.mas_equalTo(topToMargin);
        }];
        
        self.subLabel = [self addLabelWithFont:mainTitleSize andTextColor:MainColor andSview:self];
        [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(10);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.detailLabel = [self addLabelWithFont:descTitleSize andTextColor:SecondTitleColor andSview:self];
        self.detailLabel.numberOfLines = 2;
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(10);
            make.left.equalTo(self.titleLabel);
            make.right.and.bottom.mas_equalTo(-10);
            
        }];
        
        self.bottomBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.bottomBtn.layer.masksToBounds = YES;
        self.bottomBtn.layer.cornerRadius = 4;
        [self addSubview:self.bottomBtn];
        [self.bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.bottom.equalTo(self).offset(-20);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-40, SCREEN_WIDTH*0.11));
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


-(UILabel *)addLabelWithFont:(CGFloat)font andTextColor:(UIColor *)textColor andSview:(UIView *)sView{
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
