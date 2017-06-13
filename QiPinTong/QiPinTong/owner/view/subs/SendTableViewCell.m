//
//  SendTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/11.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SendTableViewCell.h"

@interface SendTableViewCell()<LWAsyncDisplayViewDelegate>

@property (strong,nonatomic) LWAsyncDisplayView *asynView;

@end

@implementation SendTableViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        //图像
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(topToMargin);
            make.centerY.equalTo(self);
            make.size.mas_equalTo(DeImageSize);
        }];
        
        //职位
        self.postLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:self];
        [self.postLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).offset(leftToMargin);
            make.bottom.equalTo(self.imgView.mas_centerY).offset(-5);
            make.width.mas_equalTo(SCREEN_WIDTH*0.5);
        }];
        
        //公司
        self.comLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.comLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.postLab);
            make.top.equalTo(self.imgView.mas_centerY).offset(5);
            make.width.mas_equalTo(SCREEN_WIDTH*0.6);
        }];
        
        //日期
        self.timeLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:subTitleSize Sview:self];
        [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-topToMargin);
            make.centerY.equalTo(self.postLab);
        }];
        
        //薪资
        self.salaryLab = [UILabel labelWithTextColor:orangeC FontSize:subTitleSize Sview:self];
        [self.salaryLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.timeLab);
            make.centerY.equalTo(self.comLab);
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
