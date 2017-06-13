//
//  SendProSecondTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "AddTableViewCell.h"

@implementation AddTableViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        self.backgroundColor = whiteC;
        
        self.addLabel = [UILabel labelWithTextColor:blueC FontSize:MTitleSize Sview:self];
        [self.addLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        
        self.addImage = [UIImageView new];
        [self addSubview:self.addImage];
        [self.addImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.addLabel);
            make.right.equalTo(self.addLabel.mas_left).offset(-3);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
//        
        
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
