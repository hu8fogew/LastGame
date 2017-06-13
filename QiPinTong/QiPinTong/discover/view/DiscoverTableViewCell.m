//
//  DiscoverTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/4.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "DiscoverTableViewCell.h"

@implementation DiscoverTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.icon = [UIImageView new];
        self.icon.contentMode = UIViewContentModeScaleAspectFill;
        [self addSubview:self.icon];
        [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(topToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(24, 24));
        }];
        
        self.title = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+1 Sview:self];
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.icon.mas_right).with.offset(topToMargin);
            make.centerY.equalTo(self);
        }];
        
        self.arrowIcon = [UIImageView new];
        self.arrowIcon.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        [self addSubview:self.arrowIcon];
        [self.arrowIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self);
            make.right.mas_equalTo(-topToMargin);
            make.size.mas_equalTo(CGSizeMake(16, 16));
        }];
        
        self.showLab = [UILabel new];
        self.showLab.font = [UIFont systemFontOfSize:MTitleSize];
        [self addSubview:self.showLab];
        [self.showLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.arrowIcon.mas_left).with.offset(-5);
            make.centerY.equalTo(self);
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
