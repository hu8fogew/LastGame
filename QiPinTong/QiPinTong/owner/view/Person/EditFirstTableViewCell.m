//
//  EditFirstTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/2/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "EditFirstTableViewCell.h"

@implementation EditFirstTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        
        //图像
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SubImageSize.width/2;
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.left.equalTo(self).with.offset(leftToMargin);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        //姓名
        self.nameLabel = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.imgView);
            make.left.equalTo(self.imgView.mas_right).offset(leftToMargin);
        }];
        
        //性别
        self.sexImage = [UIImageView new];
        [self addSubview:self.sexImage];
        [self.sexImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).offset(5);
            make.centerY.equalTo(self.nameLabel);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
        
        //箭头
        self.arrowIcon = [UIImageView new];
        self.arrowIcon.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        [self addSubview:self.arrowIcon];
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).offset(-leftToMargin);
            make.centerY.equalTo(self.imgView);
            make.size.equalTo(self.sexImage);
        }];
        
        //更换头像lab
        self.changeLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:self];
        [self.changeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowIcon.mas_left).offset(-5);
            make.centerY.equalTo(self);
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
