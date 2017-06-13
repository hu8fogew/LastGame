//
//  HotZWTableViewCell.m
//  家长界
//
//  Created by mac on 2016/11/26.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "HotZWTableViewCell.h"

@implementation HotZWTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        //图像
        self.imgView = [UIImageView new];
        self.imgView.layer.borderWidth = 1.5;
        self.imgView.layer.borderColor = [grayC CGColor];
        self.imgView.layer.cornerRadius = 2;
        self.imgView.layer.masksToBounds = YES;
        [self.contentView addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY).offset(-5);
            make.left.mas_equalTo(leftToMargin);
            make.size.mas_equalTo(MainImageSize);
        }];
        
        //职位
        self.postLab = [self addLabelWithTextColor:MainColor andFont:mainTitleSize andsView:self.contentView];
        [self.postLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(leftToMargin);
            make.top.equalTo(self.imgView);
            make.width.mas_equalTo(SCREEN_WIDTH*0.4);
        }];
        
        //薪资
        self.salaryLab = [self addLabelWithTextColor:orangeC andFont:mainTitleSize andsView:self.contentView];
        [self.salaryLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-topToMargin);
            make.centerY.equalTo(self.postLab);
        }];
        
        //公司
        self.companyLab = [self addLabelWithTextColor:SecondTitleColor andFont:mainTitleSize-1 andsView:self.contentView];
        [self.companyLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.postLab);
            make.top.equalTo(self.postLab.mas_bottom).offset(SCREEN_WIDTH*0.2/10);
            make.width.mas_equalTo(SCREEN_WIDTH*0.3);
        }];
        
        //vip
        self.vipIcon = [UIImageView new];
        [self addSubview:self.vipIcon];
        [self.vipIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyLab.mas_right).with.offset(1);
            make.centerY.equalTo(self.companyLab);
            make.size.mas_equalTo(CGSizeMake(descTitleSize, descTitleSize));
        }];
        
        //行业类型
        self.typeLab = [self addLabelWithTextColor:SecondTitleColor andFont:mainTitleSize-1 andsView:self.contentView];
        self.typeLab.textAlignment = NSTextAlignmentRight;
        [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.salaryLab);
            make.centerY.equalTo(self.companyLab);
            make.width.mas_equalTo(SCREEN_WIDTH*0.3);
        }];
        
        //学历
        self.academicIcon = [UIImageView new];
        [self addSubview:self.academicIcon];
        [self.academicIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.companyLab);
            make.top.equalTo(self.companyLab.mas_bottom).with.offset(SCREEN_WIDTH*0.2/9);
            make.size.mas_equalTo(self.vipIcon);
        }];
        self.academicLab = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self.contentView];
        [self.academicLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.academicIcon);
        }];
        
        //时间
        self.timeIcon = [UIImageView new];
        [self addSubview:self.timeIcon];
        [self.timeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicLab.mas_right).with.offset(15);
            make.centerY.equalTo(self.academicLab);
            make.size.mas_equalTo(self.vipIcon);
        }];
        self.timeLab = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self.contentView];
        [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.timeIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.timeIcon);
        }];
        
       //地图
        self.addressIcon = [UIImageView new];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.academicIcon);
            make.top.equalTo(self.academicIcon.mas_bottom).with.offset(SCREEN_WIDTH*0.2/8);
            make.size.mas_equalTo(self.vipIcon);
        }];
        self.addressLab = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self.contentView];
        [self.addressLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
            make.width.mas_equalTo(SCREEN_WIDTH*0.4);

        }];
        
        //查看人数
        self.numLab = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self.contentView];
        [self.numLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.salaryLab);
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


-(void)setJobList:(Fjoblist *)jobList
{
    
    _jobList = jobList;
    
    //logo
//    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[QPTSevericeHeaderAPI stringByAppendingFormat:@"%@",jobList.company]] placeholderImage:[UIImage imageNamed:@"Qpt_icon"]];
    
//    HWLog(@"%@",(NSDictionary *)jobList.company);
    
    
    //职位
    self.postLab.text = jobList.name;
    //学历
    self.academicLab.text = jobList.eduDeg;
    //公司
//    self.companyLab.text = @"苏州企聘通";
    
    //行业
    self.typeLab.text = jobList.catTitle;
    //工作经验
    self.timeLab.text = jobList.epYears;
    //位置
    self.addressLab.text = jobList.workaddress;
    //查看人数
    self.numLab.text = [NSString stringWithFormat:@"%ld",(long)jobList.viewCount];
    //薪资
    self.salaryLab.text = jobList.salary;
    
    self.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
    
    self.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
    
    self.academicIcon.image = [UIImage imageNamed:@"academicIcon"];
    self.timeIcon.image = [UIImage imageNamed:@"timeIcon"];
    self.vipIcon.image = [UIImage imageNamed:@"vipIcon"];
    
}

-(void)setModelArr:(NSMutableArray *)modelArr
{
    
    
    _modelArr = modelArr;
    
    
    
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[QPTSevericeHeaderAPI stringByAppendingFormat:@"%@",[modelArr[self.indePath.row] objectForKey:@"logoImgUrl"]]] placeholderImage:[UIImage imageNamed:@"Qpt_icon"]];
    
    
    self.companyLab.text = [modelArr[self.indePath.row] objectForKey:@"brandname"];
    
    
    
    
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
