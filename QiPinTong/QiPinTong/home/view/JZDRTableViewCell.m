//
//  RMJZTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "JZDRTableViewCell.h"

@implementation JZDRTableViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectionStyle = NO;
        
        //图像
        self.imgView = [UIImageView new];
        self.imgView.layer.borderWidth = 1.5;
        self.imgView.layer.borderColor = [HWColor(241, 241, 241) CGColor];
        self.imgView.layer.cornerRadius = 2;
        self.imgView.layer.masksToBounds = YES;
        [self addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY).offset(-5);
            make.left.mas_equalTo(leftToMargin);
            make.size.mas_equalTo(MainImageSize);
        }];
        
        
        //职位类型
        self.postLab = [self addLabelWithTextColor:MainColor andFont:mainTitleSize andsView:self];
        [self.postLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(leftToMargin);
            make.top.equalTo(self.imgView);
            make.width.mas_equalTo(SCREEN_WIDTH*0.3);
        }];
        
        //日结
        self.payOfWayLab = [self addLabelWithTextColor:blueC andFont:mainTitleSize-1 andsView:self];
        self.payOfWayLab.textAlignment = NSTextAlignmentCenter;
        self.payOfWayLab.layer.borderColor = blueC.CGColor;
        self.payOfWayLab.layer.borderWidth = 1;
        self.payOfWayLab.layer.cornerRadius = 3;
        self.payOfWayLab.layer.masksToBounds = YES;
        [self.payOfWayLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-leftToMargin);
            make.centerY.equalTo(self.postLab);
            make.size.mas_equalTo(CGSizeMake(40, 18));
        }];
        
        //薪资
        self.salaryLab = [self addLabelWithTextColor:orangeC andFont:mainTitleSize-1 andsView:self];
        [self.salaryLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.payOfWayLab.mas_left).with.offset(-5);
            make.centerY.equalTo(self.postLab);
        }];
        
        //公司
        self.companyLab = [self addLabelWithTextColor:SecondTitleColor andFont:mainTitleSize-1 andsView:self];
        [self.companyLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.postLab);
            make.top.equalTo(self.postLab.mas_bottom).with.offset(SCREEN_WIDTH*0.2/10);
            make.width.mas_equalTo(SCREEN_WIDTH*0.3);
        }];
        
        //vip
        self.vipIcon = [UIImageView new];
        [self addSubview:self.vipIcon];
        [self.vipIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyLab.mas_right).offset(1);
            make.centerY.equalTo(self.companyLab);
            make.size.mas_equalTo(CGSizeMake(descTitleSize, descTitleSize));
        }];
        
        //行业类型
        self.typeLab = [self addLabelWithTextColor:SecondTitleColor andFont:mainTitleSize-1 andsView:self];
        self.typeLab.textAlignment = NSTextAlignmentRight;
        [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.payOfWayLab);
            make.centerY.equalTo(self.companyLab);
            make.width.mas_equalTo(SCREEN_WIDTH*0.3);
        }];
        
        //招聘
        self.employIcon = [UIImageView new];
        [self addSubview:self.employIcon];
        [self.employIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyLab);
            make.top.equalTo(self.companyLab.mas_bottom).with.offset(SCREEN_WIDTH*0.2/9);
            make.size.mas_equalTo(self.vipIcon);
        }];
        self.employLab = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.employLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.employIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.employIcon);
        }];
        
        //地图
        self.addressIcon = [UIImageView new];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.employIcon);
            make.top.equalTo(self.employIcon.mas_bottom).with.offset(SCREEN_WIDTH*0.2/8);
            make.size.mas_equalTo(self.vipIcon);
        }];
        self.addressLab = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
            make.width.mas_equalTo(SCREEN_WIDTH*0.4);
        }];
        
        //查看
        self.numLab = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.payOfWayLab);
            make.centerY.equalTo(self.addressIcon);
        }];
        self.eyeIcon = [UIImageView new];
        [self addSubview:self.eyeIcon];
        [self.eyeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numLab.mas_left).with.offset(-2);
            make.centerY.equalTo(self.numLab);
            make.size.mas_equalTo(self.vipIcon);
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


-(UILabel *)addLabelWithTextColor:(UIColor *)color andFont:(CGFloat)font andsView:(UIView *)sview
{
    UILabel *lab = [UILabel new];
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:font];
    [sview addSubview:lab];
    
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
