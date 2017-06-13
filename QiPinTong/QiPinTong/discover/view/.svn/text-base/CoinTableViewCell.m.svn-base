//
//  CoinTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "CoinTableViewCell.h"

@implementation CoinTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.3-10)];
        vi.backgroundColor = [UIColor whiteColor];
        [self addSubview:vi];
        
        self.imgView = [UIImageView new];
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.centerY.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.18));
        }];
        
        self.titleLabel = [self createLabelWithFont:15 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
            make.top.equalTo(self.imgView);
        }];
        
        self.typeLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        self.typeLabel.layer.borderColor = [HWColor(153, 153, 153)CGColor];
        self.typeLabel.layer.borderWidth = 1;
        self.typeLabel.layer.masksToBounds = YES;
        self.typeLabel.layer.cornerRadius = 3;
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.centerY.equalTo(self.imgView);
        }];
        
        self.kindLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        self.kindLabel.layer.borderColor = [HWColor(153, 153, 153)CGColor];
        self.kindLabel.layer.borderWidth = 1;
        self.kindLabel.layer.masksToBounds = YES;
        self.kindLabel.layer.cornerRadius = 3;
        [self.kindLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.typeLabel.mas_right).with.offset(5);
            make.centerY.equalTo(self.typeLabel);
        }];
        
        self.addressIcon = [UIImageView new];
        [vi addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        self.addressLabel = [self createLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andSview:vi];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.coinView = [UIView new];
        [vi addSubview:self.coinView];
        [self.coinView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.centerY.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.18));
        }];
        
        self.coinImgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.13)];
        [self.coinView addSubview:self.coinImgView];
        
        self.numLabel = [self createLabelWithFont:13 andTextColor:HWColor(238, 0, 0) andSview:self.coinView];
        [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.centerX.equalTo(self.coinView);
        }];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clickCview)];
        [self.coinView addGestureRecognizer:tap];
    
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

-(void)clickCview{
    HWLog(@"00");
    self.numLabel.textColor = HWColor(153, 153, 153);
    self.numLabel.text = @"已抢取";
    self.coinImgView.image = [UIImage imageNamed:@"coin"];
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
