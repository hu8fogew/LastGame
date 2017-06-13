//
//  PartnerTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PartnerTableViewCell.h"

@implementation PartnerTableViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.4)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.4*0.58)];
        vi1.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi1];
        
        UIView *vi2 = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.4*0.58+1, SCREEN_WIDTH, SCREEN_WIDTH*0.4*0.35)];
        vi2.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi2];
        
        self.imgView = [UIImageView new];
        [vi1 addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi1).with.offset(10);
            make.top.equalTo(vi1).with.offset(23);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.14, SCREEN_WIDTH*0.14));
        }];
        
        self.nameLabel = [self createLabelWithFont:15 andTextColor:HWColor(51, 51, 51) andSview:vi1];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(8);
            make.top.equalTo(vi1).with.offset(20);
        }];
        
        self.vIcon = [UIImageView new];
        [vi1 addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.nameLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
        
        self.ageLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi1];
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi1.mas_right).with.offset(-10);
            make.centerY.equalTo(self.nameLabel);
        }];
        
        self.industryLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi1];
        [self.industryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.imgView).with.offset(SCREEN_WIDTH*0.14*0.36);
            
        }];
        
        UIView *vw = [UIView new];
        vw.backgroundColor = HWColor(153, 153, 153);
        [vi1 addSubview:vw];
        [vw mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.industryLabel.mas_right).with.offset(3);
            make.centerY.equalTo(self.industryLabel);
            make.size.mas_equalTo(CGSizeMake(1, 15));
        }];
        
        self.professionLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi1];
        [self.professionLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vw).with.offset(4);
            make.centerY.equalTo(self.industryLabel);
        }];
        
        self.wantLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi1];
        [self.wantLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.industryLabel);
            make.left.equalTo(self.professionLabel.mas_right).with.offset(10);
        }];
        
        self.venNoLabel = [self createLabelWithFont:13 andTextColor:HWColor(253, 134, 0) andSview:vi1];
        [self.venNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.ageLabel);
            make.centerY.equalTo(self.industryLabel);
        }];
        
        self.ventureLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi1];
        [self.ventureLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.venNoLabel);
            make.right.equalTo(self.venNoLabel.mas_left);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi1 addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.addressLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi1];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(3);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.numberLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi1];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.venNoLabel);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.numberIcon = [UIImageView new];
        [vi1 addSubview:self.numberIcon];
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.numberLabel);
            make.right.equalTo(self.numberLabel.mas_left);
            make.size.mas_equalTo(CGSizeMake(14, 12));
            
        }];
        
        self.detailLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi2];
        self.detailLabel.numberOfLines = 0;
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView);
            make.right.equalTo(vi2).with.offset(-10);
            make.centerY.equalTo(vi2);
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
