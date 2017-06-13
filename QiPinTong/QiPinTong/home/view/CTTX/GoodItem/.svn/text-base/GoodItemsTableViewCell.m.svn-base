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
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.27)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.27-10)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        self.imgView = [UIImageView new];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.centerY.equalTo(view);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.15, SCREEN_WIDTH*0.15));
        }];
        
        self.titleLabel = [self createLabelWithFont:15 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
            make.top.equalTo(self.imgView);
        }];
        
        self.vIcon = [UIImageView new];
        [vi addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
        
        self.label = [self createLabelWithFont:13 andTextColor:HWColor(50, 198, 191) andSview:vi];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.layer.borderColor = [HWColor(50, 198, 191)CGColor];
//        self.label.layer.borderWidth = 1;
//        self.label.layer.cornerRadius = 2;
//        //self.label.text = @"天使轮";
        [vi addSubview:self.label];
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.titleLabel);
            make.left.equalTo(self.vIcon.mas_right).with.offset(8);
            make.size.mas_equalTo(CGSizeMake(50, 18));
        }];
        
//        self.amountLabel = [self createLabelWithFont:15 andTextColor:HWColor(253, 134, 0) andSview:vi];
        self.amountLabel = [UILabel new];
        self.amountLabel.font = [UIFont systemFontOfSize:14];
        [vi addSubview:self.amountLabel];
        [self.amountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-15);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.subLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.subLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(5);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.addressLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(3);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.praiseLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.amountLabel.mas_right);
            make.centerY.equalTo(self.addressIcon);
            
        }];
        
        self.praiseIcon = [UIImageView new];
        [vi addSubview:self.praiseIcon];
        [self.praiseIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.praiseLabel.mas_left).with.offset(-1);
            make.centerY.equalTo(self.praiseLabel);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        self.numberLabel = [self createLabelWithFont:12 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.praiseIcon.mas_left).with.offset(-6);
            make.centerY.equalTo(self.praiseLabel);
        }];
        
        self.numberIcon = [UIImageView new];
        [vi addSubview:self.numberIcon];
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).with.offset(-1);
            make.centerY.equalTo(self.numberLabel);
            make.size.mas_equalTo(CGSizeMake(14, 12));
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
