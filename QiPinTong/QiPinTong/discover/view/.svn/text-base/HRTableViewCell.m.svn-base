//
//  HRTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/7.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "HRTableViewCell.h"

@implementation HRTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.34)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.34-10)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.imgView = [UIImageView new];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.centerY.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.21, SCREEN_WIDTH*0.21));
        }];
        
        self.nameLabel = [UILabel new];
        self.nameLabel.font = [UIFont systemFontOfSize:15];
        self.nameLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.nameLabel];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(8);
            make.top.equalTo(self.imgView);
        }];
        
        self.nameIcon = [UIImageView new];
        [vi addSubview:self.nameIcon];
        [self.nameIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.nameLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
        
        self.numberLabel = [UILabel new];
        self.numberLabel.font = [UIFont systemFontOfSize:15];
        self.numberLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.numberLabel];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.centerY.equalTo(self.nameLabel);
        }];
        
        self.numberIcon = [UIImageView new];
        [vi addSubview:self.numberIcon];
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.nameLabel);
            make.size.mas_equalTo(CGSizeMake(16, 13));
        }];
        
        self.companyLabel = [UILabel new];
        self.companyLabel.font = [UIFont systemFontOfSize:13];
        self.companyLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.companyLabel];
        [self.companyLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.imgView).with.offset(SCREEN_WIDTH*0.21/4+5);
        }];
        
        self.eduBackIcon = [UIImageView new];
        [vi addSubview:self.eduBackIcon];
        [self.eduBackIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyLabel);
            make.top.equalTo(self.imgView).with.offset(SCREEN_WIDTH*0.21/2+5);
            make.size.mas_equalTo(CGSizeMake(13, 15));
        }];
        
        self.eduBackLabel = [UILabel new];
        self.eduBackLabel.font = [UIFont systemFontOfSize:13];
        self.eduBackLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.eduBackLabel];
        [self.eduBackLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.eduBackIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.eduBackIcon);
        }];
        
        self.ageIcon = [UIImageView new];
        [vi addSubview:self.ageIcon];
        [self.ageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.eduBackLabel.mas_right).with.offset(13);
            make.centerY.equalTo(self.eduBackLabel);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.ageLabel = [UILabel new];
        self.ageLabel.font = [UIFont systemFontOfSize:13];
        self.ageLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.ageLabel];
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.ageIcon);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageLabel.mas_right).with.offset(13);
            make.centerY.equalTo(self.ageLabel);
            make.size.mas_equalTo(CGSizeMake(12, 13));
        }];
        
        self.addressLabel = [UILabel new];
        self.addressLabel.font = [UIFont systemFontOfSize:13];
        self.addressLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.jobClassLabel = [UILabel new];
        self.jobClassLabel.font = [UIFont systemFontOfSize:13];
        self.jobClassLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.jobClassLabel];
        [self.jobClassLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.bottom.equalTo(self.imgView.mas_bottom);
        }];
        
        self.jobLabel = [UILabel new];
        self.jobLabel.font = [UIFont systemFontOfSize:13];
        self.jobLabel.textColor = HWColor(153, 153, 153);
        [vi addSubview:self.jobLabel];
        [self.jobLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.jobClassLabel.mas_right);
            make.centerY.equalTo(self.jobClassLabel);
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
