//
//  ComOnlineCollectionViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/6.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ComOnlineCollectionViewCell.h"

@implementation ComOnlineCollectionViewCell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = grayC;
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH*0.46, SCREEN_WIDTH*0.46)];
        [self addSubview:self.imgView];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = [HWColor(88, 88, 88)colorWithAlphaComponent:0.6];
        [self.imgView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.right.equalTo(self.imgView);
            make.bottom.equalTo(self.imgView.mas_bottom);
            make.height.mas_equalTo(self.imgView.height/6);
        }];
        
        self.titleLabel = [UILabel new];
        self.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.imgView addSubview:self.titleLabel];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView).with.offset(5);
            make.bottom.equalTo(self.imgView.mas_bottom).with.offset(-5);
        }];
        
        self.vIcon = [UIImageView new];
        self.vIcon.image = [UIImage imageNamed:@"vipIcon"];
        [self.imgView addSubview:self.vIcon];
        [self.vIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLabel.mas_right).with.offset(2);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(14, 14));
        }];
        
        self.NoLabel = [UILabel new];
        self.NoLabel.font = [UIFont systemFontOfSize:mainTitleSize];
        self.NoLabel.textColor = [UIColor whiteColor];
        [self.imgView addSubview:self.NoLabel];
        [self.NoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.imgView).with.offset(-6);
            make.centerY.equalTo(self.titleLabel);
        }];
        
        self.eIcon = [UIImageView new];
        self.eIcon.image = [UIImage imageNamed:@"weyeIcon"];
        [self.imgView addSubview:self.eIcon];
        [self.eIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.NoLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.titleLabel);
            make.size.mas_equalTo(CGSizeMake(15, 15));
        }];
        
        self.proLabel = [UILabel new];
        self.proLabel.textColor = SecondTitleColor;
        self.proLabel.font = [UIFont systemFontOfSize:descTitleSize];
        [self addSubview:self.proLabel];
        [self.proLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self).with.offset(6);
            make.top.equalTo(self.imgView.mas_bottom).with.offset(SCREEN_WIDTH*0.14/5);
        }];
        
        UIView *fv = [UIView new];
        fv.backgroundColor = SecondTitleColor;
        [self addSubview:fv];
        [fv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.proLabel.mas_right).with.offset(3);
            make.centerY.equalTo(self.proLabel);
            make.size.mas_equalTo(CGSizeMake(1, 14));
        }];
        
        self.typeLabel = [UILabel new];
        self.typeLabel.font = [UIFont systemFontOfSize:descTitleSize];
        self.typeLabel.textColor = SecondTitleColor;
        [self addSubview:self.typeLabel];
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(fv).with.offset(4);
            make.centerY.equalTo(self.proLabel);
        }];
        
        self.addressLabel = [UILabel new];
        self.addressLabel.font = [UIFont systemFontOfSize:descTitleSize];
        self.addressLabel.textColor = SecondTitleColor;
        [self addSubview:self.addressLabel];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self).with.offset(-5);
            make.centerY.equalTo(self.proLabel);
        }];
        
        self.locaIcon = [UIImageView new];
        self.locaIcon.image = [UIImage imageNamed:@"locationIcon"];
        [self addSubview:self.locaIcon];
        [self.locaIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.addressLabel.mas_left).with.offset(-2);
            make.centerY.equalTo(self.proLabel);
            make.size.mas_equalTo(CGSizeMake(12, 12));
        }];
        
        self.contentLabel = [UILabel new];
        self.contentLabel.font = [UIFont systemFontOfSize:descTitleSize];
        self.contentLabel.textColor = HWColor(65, 188, 228);
        [self addSubview:self.contentLabel];
        [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.proLabel);
            make.top.equalTo(self.proLabel.mas_bottom).with.offset(6);
            make.width.mas_equalTo(self.width/2);
        }];
        
        self.contsLabel = [UILabel new];
        self.contsLabel.font = [UIFont systemFontOfSize:descTitleSize]
        ;
        self.contsLabel.textColor = SecondTitleColor;
        [self addSubview:self.contsLabel];
        [self.contsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.contentLabel.mas_right);
            make.centerY.equalTo(self.contentLabel);
        }];
        
    }
    
    return self;
}


-(void)setComModel:(Comlist *)comModel
{
    _comModel = comModel;
    
    
    //名称
    self.titleLabel.text = comModel.brandname;
    
    
    
    //图片
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[QPTSevericeHeaderAPI stringByAppendingFormat:@"%@",comModel.imgUrl]] placeholderImage:[UIImage imageNamed:@"Qpt_icon"]];
    
    
    
    //查看数；
    self.NoLabel.text = [NSString stringWithFormat:@"%ld",(long)comModel.viewCount];
    
    
    
    //剩余职位数
    NSString *str = [NSString stringWithFormat:@"等%ld",(long)comModel.jobCount];
    
    self.contsLabel.text = [str stringByAppendingFormat:@"%@",@"个职位"];
    
    self.locaIcon.image = [UIImage imageNamed:@"locationIcon"];
    
    self.vIcon.image = [UIImage imageNamed:@"vipIcon"];
    self.eIcon.image = [UIImage imageNamed:@"weyeIcon"];
    
    self.proLabel.text = comModel.industry;
    self.typeLabel.text = comModel.finacStage;
    
    
    
}

-(void)setJobArr:(NSMutableArray *)jobArr
{
    
    
    _jobArr = jobArr;
    //地点
    self.addressLabel.text = [jobArr[self.indexPath.row] objectForKey:@"city"];

    //职位
    self.contentLabel.text = [jobArr[self.indexPath.row] objectForKey:@"title"];
    
    
    
    
}









@end
