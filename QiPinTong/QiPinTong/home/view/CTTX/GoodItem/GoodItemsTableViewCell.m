//
//  GoodItemsTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "GoodItemsTableViewCell.h"

@implementation GoodItemsTableViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = NO;
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.centerY.equalTo(self.mas_centerY).offset(-5);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        self.titleLabel = [self createLabelWithFont:mainTitleSize+1 andTextColor:MainColor andSview:self];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(leftToMargin);
            make.top.equalTo(self.imgView);
        }];
        
        self.label = [self createLabelWithFont:descTitleSize andTextColor:blueC andSview:self];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.layer.borderColor = [blueC CGColor];
        [self addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel);
            make.left.equalTo(self.titleLabel.mas_right).offset(2);
            make.size.mas_equalTo(CGSizeMake(50, 18));
        }];
        
//        self.amountLabel = [self createLabelWithFont:15 andTextColor:HWColor(253, 134, 0) andSview:vi];
        self.amountLabel = [UILabel new];
        self.amountLabel.font = [UIFont systemFontOfSize:mainTitleSize];
        [self addSubview:self.amountLabel];
        [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.subLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:MainColor andSview:self];
        [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.centerY.equalTo(self.imgView);
        }];
        
        self.addressIcon = [UIImageView new];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(descTitleSize, descTitleSize));
        }];
        
        self.addressLabel = [self createLabelWithFont:descTitleSize andTextColor:SecondTitleColor andSview:self];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.praiseLabel = [self createLabelWithFont:descTitleSize andTextColor:SecondTitleColor andSview:self];
        [self.praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.amountLabel);
            make.centerY.equalTo(self.addressIcon);
            
        }];
        
        self.praiseIcon = [UIImageView new];
        [self addSubview:self.praiseIcon];
        [self.praiseIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.praiseLabel.mas_left).with.offset(-1);
            make.centerY.equalTo(self.praiseLabel);
            make.size.mas_equalTo(self.addressIcon);
        }];
        
        self.numberLabel = [self createLabelWithFont:descTitleSize andTextColor:SecondTitleColor andSview:self];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.praiseIcon.mas_left).with.offset(-6);
            make.centerY.equalTo(self.praiseLabel);
        }];
        
        self.numberIcon = [UIImageView new];
        [self addSubview:self.numberIcon];
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).with.offset(-1);
            make.centerY.equalTo(self.numberLabel);
            make.size.mas_equalTo(self.addressIcon);
        }];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = grayC;
        [self addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.bottom.equalTo(self);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 10));
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
