//
//  NearComTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/5/2.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "NearComTableViewCell.h"

@implementation NearComTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = NO;
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 10));
        }];
        
        //图像
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.with.offset(leftToMargin);
            make.centerY.equalTo(self.mas_centerY).with.offset(-5);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        //名称
        self.nameLab = [UILabel labelWithTextColor:MainColor FontSize:mainTitleSize Sview:self];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(leftToMargin);
            make.top.equalTo(self.imgView);
        }];
        
        //行业
        self.industryLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        self.industryLab.textAlignment = NSTextAlignmentRight;
        [self.industryLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.equalTo(self.nameLab);
            make.width.mas_equalTo(SCREEN_WIDTH*0.3);
        }];
    
        self.moreStr = @"等23个职位";
        //职位
        self.jobLab = [UILabel labelWithTextColor:blueC FontSize:mainTitleSize-1 Sview:self];
        self.jobLab.lineBreakMode = NSLineBreakByTruncatingMiddle;
        self.jobLab.text = [@"软件工程师" stringByAppendingString:self.moreStr];
        [self.jobLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.centerY.equalTo(self.imgView);
            make.width.mas_equalTo(SCREEN_WIDTH*0.7);
        }];
        
        NSRange range1 = [self.jobLab.text rangeOfString:@"等"];
        NSRange range2 = [self.jobLab.text rangeOfString:@"位"];
        NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:self.jobLab.text];
        [att addAttributes:@{NSForegroundColorAttributeName:SecondTitleColor} range:NSMakeRange(range1.location, range2.location-range1.location+1)];
        self.jobLab.attributedText = att;
        

        //地址
        self.addressIcon = [UIImageView new];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLab);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(mainTitleSize-1, mainTitleSize-1));
        }];
        self.addressLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(1);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        //浏览
        self.eyeLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:mainTitleSize-1 Sview:self];
        [self.eyeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.industryLab.mas_right);
            make.centerY.equalTo(self.addressLab);
        }];
        self.eyeIcon = [UIImageView new];
        [self addSubview:self.eyeIcon];
        [self.eyeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.eyeLab.mas_left).with.offset(-1);
            make.centerY.equalTo(self.eyeLab);
            make.size.mas_equalTo(self.addressIcon);
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
