//
//  QPTHomeCollectionViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "QPTHomeCollectionViewCell.h"

@implementation QPTHomeCollectionViewCell



-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
    
        self.backgroundColor = grayC;
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.41, SCREEN_WIDTH*0.41)];
        
        [self cutImage:self.imgView.image];
        [self addSubview:self.imgView];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = [HWColor(88, 88, 88)colorWithAlphaComponent:0.6];
        [self.imgView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self.imgView);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.height.mas_equalTo(self.imgView.height/6);
        }];
        
        self.titleLabel = [self addLabelWithTextColor:[UIColor whiteColor] andFont:mainTitleSize andsView:self.imgView];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView).with.offset(5);
            make.bottom.equalTo(self.imgView.mas_bottom).with.offset(-5);
        }];
        
        
        
        
        self.vIcon = [UIImageView new];
        [self.imgView addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(2);
            make.bottom.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
        
        self.NoLabel = [self addLabelWithTextColor:[UIColor whiteColor] andFont:mainTitleSize andsView:self.imgView];
        [self.NoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imgView).with.offset(-6);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.eIcon = [UIImageView new];
        [self.imgView addSubview:self.eIcon];
        [self.eIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.NoLabel.mas_left);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
     
        self.addressIcon = [UIImageView new];
        [self addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(3);
            make.top.equalTo(self.imgView.mas_bottom).with.offset(self.imgView.height/18);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
      
        self.addressLabel = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.addressIcon);
        }];
        
        self.ageIcon = [UIImageView new];
        [self addSubview:self.ageIcon];
        [self.ageIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(SCREEN_WIDTH*0.4/2-15);
            make.centerY.equalTo(self.addressIcon);
            make.size.mas_equalTo(CGSizeMake(11, 11));
        }];
        
        
        self.ageLabel = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ageIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.ageIcon);
        }];
        
    
        self.educationLabel = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.educationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).with.offset(-5);
            make.centerY.equalTo(self.ageIcon);
        }];
        
        self.educationIcon = [UIImageView new];
        [self addSubview:self.educationIcon];
        [self.educationIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.educationLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.educationLabel);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];

        self.contentLabel = [self addLabelWithTextColor:HWColor(65, 188, 228) andFont:descTitleSize andsView:self];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(7);
            make.top.equalTo(self.addressIcon.mas_bottom).with.offset(self.imgView.height/20);
            make.width.mas_equalTo(self.width/2);
        }];

        self.contsLabel = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.contsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentLabel.mas_right);
            make.centerY.equalTo(self.contentLabel);
        }];
        
        /*有才有貌薪资*/
        self.priceLabel = [self addLabelWithTextColor:HWColor(253, 148, 18) andFont:descTitleSize andsView:self];
        [self.priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(7);
            make.top.equalTo(self.addressIcon.mas_bottom).with.offset(self.imgView.height/20);
        }];
        
        /*有才有貌不同信息*/
        self.postLabel = [self addLabelWithTextColor:[UIColor whiteColor] andFont:mainTitleSize andsView:self.imgView];
        [self.postLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imgView).with.offset(-5);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.numberLabel = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.numberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.educationLabel);
            make.centerY.equalTo(self.priceLabel);
        }];
        
        self.numberIcon = [UIImageView new];
        [self addSubview:self.numberIcon];
        [self.numberIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.numberLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.numberLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
        
        /*创投不同信息*/
        self.subTitle = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.subTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(3);
            make.top.equalTo(self.imgView.mas_bottom).with.offset(self.imgView.height/18);
        }];
        
        self.locaIcon = [UIImageView new];
        [self addSubview:self.locaIcon];
        [self.locaIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.subTitle);
            make.top.equalTo(self.subTitle.mas_bottom).with.offset(self.imgView.height/20);
            make.size.mas_equalTo(CGSizeMake(13, 13));
        }];
        
        self.locaLabel = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.locaLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.locaIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.locaIcon);
        }];
//
        self.eyeIcon = [UIImageView new];
        [self addSubview:self.eyeIcon];
        [self.eyeIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(SCREEN_WIDTH*0.4/2-15);
            make.centerY.equalTo(self.locaIcon);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
//
        self.numLabel = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.numLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.eyeIcon.mas_right).with.offset(2);
            make.centerY.equalTo(self.eyeIcon);
        }];
//
        self.praiseLabel = [self addLabelWithTextColor:SecondTitleColor andFont:descTitleSize andsView:self];
        [self.praiseLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).with.offset(-5);
            make.centerY.equalTo(self.locaIcon);
        }];
//
        self.praiseIcon = [UIImageView new];
        [self addSubview:self.praiseIcon];
        [self.praiseIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.praiseLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.praiseLabel);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
    }
    return self;
}


-(void)setComModel:(Comlist *)comModel
{
    _comModel = comModel;
    //名称
    self.titleLabel.text = comModel.name;
    
    
    
    //图片
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[QPTSevericeHeaderAPI stringByAppendingFormat:@"%@",comModel.imgUrl]] placeholderImage:[UIImage imageNamed:@"Qpt_icon"]];
    

    
    //查看数；
    self.NoLabel.text = [NSString stringWithFormat:@"%ld",(long)comModel.viewCount];
    

    
    //剩余职位数
    NSString *str = [NSString stringWithFormat:@"等%ld",(long)comModel.jobCount];
    
    self.contsLabel.text = [str stringByAppendingFormat:@"%@",@"个职位"];
    
    self.educationIcon.image = [UIImage imageNamed:@"academicIcon"];
    
    self.ageIcon.image = [UIImage imageNamed:@"timeIcon"];
    
    self.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
    
    self.vIcon.image = [UIImage imageNamed:@"vipIcon"];
    self.eIcon.image = [UIImage imageNamed:@"weyeIcon"];
    
}


-(void)setJobArr:(NSMutableArray *)jobArr
{
    _jobArr = jobArr;
    //地点
    self.addressLabel.text = [jobArr[self.indexPath.row] objectForKey:@"city"];
    //工龄
    self.ageLabel.text = [jobArr[self.indexPath.row] objectForKey:@"epYears"];
    
    //学历
    self.educationLabel.text = [jobArr[self.indexPath.row] objectForKey:@"eduDeg"];
    //职位
    self.contentLabel.text = [jobArr[self.indexPath.row] objectForKey:@"title"];
    
}








-(void)setMemberModel:(Memlist *)memberModel
{
    _memberModel = memberModel;
    
    //名称
    self.titleLabel.text = memberModel.snsname;
    self.vIcon.image = [UIImage imageNamed:@"yvipIcon"];

    
    //图片
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[QPTSevericeHeaderAPI stringByAppendingFormat:@"%@",memberModel.headImgUrl]] placeholderImage:[UIImage imageNamed:@"Qpt_icon"]];
    
    //工龄
    self.ageLabel.text = memberModel.epYears;
    self.ageIcon.image = [UIImage imageNamed:@"timeIcon"];
    //学历
    self.educationLabel.text = memberModel.eduDeg;
    self.educationIcon.image = [UIImage imageNamed:@"academicIcon"];

    self.numberIcon.image = [UIImage imageNamed:@"eyeIcon"];

    self.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
    
}

-(void)setCmJobArr:(NSMutableArray *)cmJobArr
{
    _cmJobArr = cmJobArr;
    
    //职位
    self.postLabel.text = [cmJobArr[self.indexPath.row] objectForKey:@"title"];
    
    //薪资
    self.priceLabel.text = [cmJobArr[self.indexPath.row] objectForKey:@"salarystring"];
    
    //查看数；
    self.numberLabel.text = [NSString stringWithFormat:@"%@",[cmJobArr[self.indexPath.row] objectForKey:@"viewCount"]];
    //地点
    self.addressLabel.text = [cmJobArr[self.indexPath.row] objectForKey:@"workaddress"];
    
}



















//裁剪图片
- (UIImage *)cutImage:(UIImage*)image
{
    //压缩图片
    CGSize newSize;
    CGImageRef imageRef = nil;
    
    if ((image.size.width / image.size.height) < (self.imgView.width / self.imgView.height)) {
        newSize.width = image.size.width;
        newSize.height = image.size.width * self.imgView.height / self.imgView.width;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(0, fabs(image.size.height - newSize.height) / 2, newSize.width, newSize.height));
        
    } else {
        newSize.height = image.size.height;
        newSize.width = image.size.height * self.imgView.width / self.imgView.height;
        
        imageRef = CGImageCreateWithImageInRect([image CGImage], CGRectMake(fabs(image.size.width - newSize.width) / 2, 0, newSize.width, newSize.height));
        
    }
    
    return [UIImage imageWithCGImage:imageRef];
}


-(UILabel *)addLabelWithTextColor:(UIColor *)color andFont:(CGFloat)font andsView:(UIView *)sview
{
    UILabel *lab = [UILabel new];
    lab.textColor = color;
    lab.font = [UIFont systemFontOfSize:font];
    [sview addSubview:lab];
    
    return lab;
}

@end
