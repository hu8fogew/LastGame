//
//  CMDSTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "CMDSTableViewCell.h"

@implementation CMDSTableViewCell


-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //个人详情视图
        self.backgroundColor = grayC;
        UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.3)];
        topView.backgroundColor = whiteC;
        [self addSubview:topView];
        
        //图像
        self.imgView = [UIImageView new];
        [topView addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(topView);
            make.left.equalTo(topView).with.offset(10);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.23, SCREEN_WIDTH*0.23));
        }];
        
        //人名
        self.nameLabel = [self addLabelWithTextColor:HWColor(51, 51, 51) andFont:15 andsView:topView];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
            make.top.equalTo(self.imgView);
        }];
        
        //vip
        self.vipIcon = [UIImageView new];
        [topView addSubview:self.vipIcon];
        [self.vipIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.nameLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];

        //薪资
        self.salaryLabel = [self addLabelWithTextColor:HWColor(255, 152, 23) andFont:15 andsView:topView];
        [self.salaryLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(topView).with.offset(-15);
            make.centerY.equalTo(self.nameLabel);
        }];

        //工作职位名称
        self.jobLabel = [self addLabelWithTextColor:HWColor(61, 158, 226) andFont:14 andsView:topView];
        [self.jobLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.2/10);
        }];

        //学历照片
        self.academicIcon = [UIImageView new];
        [topView addSubview:self.academicIcon];
        [self.academicIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.jobLabel);
            make.top.equalTo(self.jobLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.2/9);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];

        //学历
        self.academicLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.academicLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.academicIcon);
        }];

        //时间图片
        self.ageIcon = [UIImageView new];
        [topView addSubview:self.ageIcon];
        [self.ageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicLabel.mas_right).with.offset(15);
            make.centerY.equalTo(self.academicLabel);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];

        //工作年限
        self.ageLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.ageIcon);
        }];

        //地图图标
        self.addressIcon = [UIImageView new];
        [topView addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicIcon);
            make.top.equalTo(self.academicIcon.mas_bottom).with.offset(SCREEN_WIDTH*0.2/8);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        //地理位置
        self.addressLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];

        //查看人数
        self.numLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:topView];
        [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.salaryLabel);
            make.centerY.equalTo(self.addressLabel);
        }];
        
        //查看人图标
        self.eyeIcon = [UIImageView new];
        [topView addSubview:self.eyeIcon];
        [self.eyeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.numLabel);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
       
        //底部视图（公司的实力种类）
       UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, topView.y+topView.height+1, SCREEN_WIDTH, SCREEN_WIDTH*0.15-10)];
        bottomView.backgroundColor = [UIColor whiteColor];
        [self addSubview:bottomView];
        
        self.detailLabel = [self addLabelWithTextColor:HWColor(153, 153, 153) andFont:13 andsView:bottomView];
        self.detailLabel.numberOfLines = 0;
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView);
            make.right.equalTo(bottomView).with.offset(-10);
            make.centerY.equalTo(bottomView);
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
