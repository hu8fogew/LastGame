//
//  VentureTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/12.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "VentureTableViewCell.h"

@implementation VentureTableViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.36)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.36-8)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.imgView = [UIImageView new];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.top.equalTo(vi).with.offset(18);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.24, SCREEN_WIDTH*0.17));
        }];
        
        self.titleLabel = [self createLabelWithFont:15 andTextColor:HWColor(51, 51, 51) andSview:vi];
        self.titleLabel.numberOfLines = 0;
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(8);
            make.right.equalTo(vi.mas_right).with.offset(-10);
            make.top.equalTo(self.imgView);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.imgView).with.offset(SCREEN_WIDTH*0.17*0.68);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
        
        self.addressLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(3);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.dateIcon = [UIImageView new];
        [vi addSubview:self.dateIcon];
        [self.dateIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLabel.mas_right).with.offset(10);
            make.centerY.equalTo(self.addressLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
    
        self.dateLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.dateLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dateIcon.mas_right).with.offset(3);
            make.centerY.equalTo(self.dateIcon);
        }];
        
        self.numberLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153)  andSview:vi];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.dateLabel.mas_right).with.offset(10);
            make.centerY.equalTo(self.dateLabel);
        }];
        
        UIView *hv = [UIView new];
        hv.backgroundColor = HWColor(241, 241, 241);
        [vi addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(vi);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.24);
            make.height.mas_equalTo(1);
        }];
        
        self.detailLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.275);
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
