//
//  SexSelectTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/3/29.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SexSelectTableViewCell.h"

@implementation SexSelectTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        
        self.titleLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.centerY.equalTo(self);
        }];
        
        self.switchBtn = [[LQXSwitch alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-60, 13, 45, 23) onColor:blueC offColor:HWColor(255, 98, 155) font:[UIFont systemFontOfSize:15] ballSize:23];
        [self.switchBtn setOn:YES animated:YES];
        self.switchBtn.onText = @"男";
        self.switchBtn.offText = @"女";
        [self addSubview:self.switchBtn];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.mas_bottom);
            make.left.equalTo(self);
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
