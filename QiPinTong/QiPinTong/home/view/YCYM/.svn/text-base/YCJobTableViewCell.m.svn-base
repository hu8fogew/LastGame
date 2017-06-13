//
//  YCJobTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCJobTableViewCell.h"

@implementation YCJobTableViewCell
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.18)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.postLabel = [self addLabelWithFont:15 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.postLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.top.equalTo(vi).with.offset(vi.height/5);
        }];
        
        self.salaryLabel = [self addLabelWithFont:15 andTextColor:HWColor(253, 137, 0) andSview:vi];
        [self.salaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.centerY.equalTo(self.postLabel);
        }];
        
        self.eduIcon = [UIImageView new];
        [vi addSubview:self.eduIcon];
        [self.eduIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.postLabel);
            make.top.equalTo(self.postLabel.mas_bottom).with.offset(vi.height/8);
            make.size.mas_equalTo(CGSizeMake(15, 17));
        }];
        
        self.eduLabel = [self addLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.eduLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.eduIcon.mas_right).with.offset(1);
            make.centerY.equalTo(self.eduIcon);
        }];
        
        self.ageIcon = [UIImageView new];
        [vi addSubview:self.ageIcon];
        [self.ageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.eduLabel.mas_right).with.offset(10);
            make.centerY.equalTo(self.eduLabel);
            make.size.mas_equalTo(CGSizeMake(11, 11));
        }];
        
        self.ageLabel = [self addLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageIcon.mas_right).with.offset(1);
            make.centerY.equalTo(self.ageIcon);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageLabel.mas_right).with.offset(10);
            make.centerY.equalTo(self.ageIcon);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.addressLabel = [self addLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(1);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.numberLabel = [self addLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.salaryLabel);
            make.centerY.equalTo(self.addressLabel);
        }];
        
        self.numberIcon = [UIImageView new];
        [vi addSubview:self.numberIcon];
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.numberLabel);
            make.size.mas_equalTo(CGSizeMake(14, 12));
        }];
    }
    
    return self;
}

-(UILabel *)addLabelWithFont:(CGFloat)font andTextColor:(UIColor *)color andSview:(UIView *)sView{
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = color;
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
