//
//  YSYKFirstTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/2.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKTableViewCell.h"

@interface YSYKTableViewCell()


@property (nonatomic ,strong) LWAsyncDisplayView *asycView;

@end


@implementation YSYKTableViewCell
/*
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = whiteC;
        
        self.imgView = [UIImageView new];
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.top.equalTo(self).with.offset(topToMargin);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.21, SCREEN_WIDTH*0.17));
        }];
        
        self.titleLabel = [self addLabelWithFont:mainTitleSize andTextColor:MainColor andSview:self];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(leftToMargin);
            make.top.equalTo(self.imgView);
        }];
        
        NSMutableArray *arrStar = [NSMutableArray array];
        for (int i = 0; i<5; i++) {
            UIImageView *starImage = [UIImageView new];
            starImage.image = [UIImage imageNamed:@"star_yellow"];
            starImage.frame = CGRectMake(SCREEN_WIDTH*0.21+20+i*18, 15+SCREEN_WIDTH*0.17/2-8, 16, 16);
            if (i>3) {
                starImage.image = [UIImage imageNamed:@"star_gray"];
            }
            [arrStar addObject:starImage];
            
            [self addSubview:starImage];
        }
    
        self.addressLabel = [self addLabelWithFont:descTitleSize andTextColor:SecondTitleColor andSview:self];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.imgView);
            make.left.equalTo(self.titleLabel);
        }];
        
        self.typeLabel = [self addLabelWithFont:descTitleSize andTextColor:SecondTitleColor andSview:self];
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.addressLabel);
            make.left.equalTo(self.addressLabel.mas_right).with.offset(10);
        }];

        
        self.parkIcon = [UIImageView new];
        [self addSubview:self.parkIcon];
        [self.parkIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-10);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(mainTitleSize, mainTitleSize));
        }];

        self.wifiIcon = [UIImageView new];
        [self addSubview:self.wifiIcon];
        [self.wifiIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.parkIcon.mas_left).with.offset(-2);
            make.centerY.equalTo(self.parkIcon);
            make.size.mas_equalTo(self.parkIcon);
        }];

        self.priceLabel = [UILabel new];
        self.priceLabel.font = [UIFont systemFontOfSize:descTitleSize];
//        self.rightTlabel.textColor = HWColor(252, 13, 27);
        [self addSubview:self.priceLabel];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.parkIcon);
            make.centerY.equalTo(self.imgView);
        }];

        self.averageLabel = [UILabel new];
        self.averageLabel.font = [UIFont systemFontOfSize:descTitleSize];
//        self.rightTLlabel.textColor = HWColor(102, 102, 102);
        [self addSubview:self.averageLabel];
        [self.averageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.priceLabel.mas_left).with.offset(-3);
            make.centerY.equalTo(self.priceLabel);
        }];

        self.distanceLabel = [self addLabelWithFont:descTitleSize andTextColor:SecondTitleColor andSview:self];
        [self addSubview:self.distanceLabel];
        [self.distanceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.priceLabel);
            make.centerY.equalTo(self.addressLabel);
        }];

        UIView *hv = [UIView new];
        hv.backgroundColor = grayC;
        [self addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel);
            make.right.equalTo(self);
            make.height.mas_equalTo(1);
            make.top.equalTo(self.addressLabel.mas_bottom).with.offset(SubImageSize.width/6);
        }];

        self.firstIcon = [UIImageView new];
        [self addSubview:self.firstIcon];
        [self.firstIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressLabel);
            make.top.equalTo(hv).with.offset(SubImageSize.width/7);
            make.size.mas_equalTo(self.parkIcon);
        }];

        self.firstLabel = [UILabel new];
        self.firstLabel.font = [UIFont systemFontOfSize:descTitleSize];
        self.firstLabel.textColor = MainColor;
        [self addSubview:self.firstLabel];
        [self.firstLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.firstIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.firstIcon);
        }];

        self.secondIcon = [UIImageView new];
        [self addSubview:self.secondIcon];
        [self.secondIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.firstIcon);
            make.top.equalTo(self.firstIcon.mas_bottom).with.offset(SubImageSize.width/7);
            make.size.mas_equalTo(self.parkIcon);
        }];
        
        self.secondLabel = [UILabel new];
        self.secondLabel.font = [UIFont systemFontOfSize:descTitleSize];
        self.secondLabel.textColor = MainColor;
        [self addSubview:self.secondLabel];
        [self.secondLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.secondIcon.mas_right).with.offset(5);
            make.centerY.equalTo(self.secondIcon);
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

-(UILabel *)addLabelWithFont:(CGFloat)font andTextColor:(UIColor *)textColor andSview:(UIView *)sView{
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    [sView addSubview:lab];
    return lab;
}
*/


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = whiteC;
        
        [self.contentView addSubview:self.asycView];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.businessLayout.businessCellHeight);
    
}


-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
    }
    return _asycView;
}


-(YSYKLayout *)businessLayout
{
    if (!_businessLayout) {
        _businessLayout = [[YSYKLayout alloc]initYsykListCell];
        self.asycView.layout = self.businessLayout;
        
    }
    return _businessLayout;
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
