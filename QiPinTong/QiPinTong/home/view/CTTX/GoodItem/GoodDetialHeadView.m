//
//  GoodDetialHeadView.m
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "GoodDetialHeadView.h"

@implementation GoodDetialHeadView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.56)];
        view.backgroundColor = grayC;
        [self addSubview:view];
        
        self.backImageView = [UIImageView new];
        [view addSubview:self.backImageView];
        [self.backImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.and.top.equalTo(view);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, SCREEN_WIDTH*0.43));
        }];
        
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SubImageSize.width/2;
        [view addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(view).with.offset(SubImageSize.width/6);
            make.centerX.equalTo(view);
            make.size.mas_equalTo(SubImageSize);
        }];
        
        self.nameLabel = [self createLabelWithFont:mainTitleSize andTextColor:whiteC andSview:view];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.imgView.mas_bottom).with.offset(SubImageSize.width/7);
            make.centerX.equalTo(self.imgView);
        }];
        
        self.titleLabel = [self createLabelWithFont:mainTitleSize-1 andTextColor:whiteC andSview:view];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.imgView);
            make.top.equalTo(self.nameLabel.mas_bottom).with.offset(SubImageSize.width/8);
        }];
        
        UIView *hv = [UIView new];
        hv.backgroundColor = [UIColor whiteColor];
        [view addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.imgView);
            make.top.equalTo(self.titleLabel.mas_bottom).with.offset(SubImageSize.width/8);
            make.size.mas_equalTo(CGSizeMake(1, 13));
        }];
        
        self.typeLabel = [self createLabelWithFont:descTitleSize andTextColor:whiteC andSview:view];
        [self.typeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(hv.mas_left).with.offset(-4);
            make.centerY.equalTo(hv);
        }];
        
        self.addressIcon = [UIImageView new];
        [view addSubview:self.addressIcon];
        [self.addressIcon mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(hv.mas_right).with.offset(4);
            make.centerY.equalTo(hv);
            make.size.mas_equalTo(CGSizeMake(descTitleSize, descTitleSize));
        }];
        
        self.addressLabel = [self createLabelWithFont:descTitleSize andTextColor:whiteC andSview:view];
        [self.addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.addressIcon.mas_right).with.offset(2);
            make.centerY.equalTo(hv);
        }];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.43+10, SCREEN_WIDTH, SCREEN_WIDTH*0.56-SCREEN_WIDTH*0.43-10-1)];
        vi.backgroundColor = HWColor(241, 241, 241);
        [view addSubview:vi];
        
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, SCREEN_WIDTH*0.56-SCREEN_WIDTH*0.43-10-1)];
        vi1.backgroundColor = [UIColor whiteColor];
        [vi addSubview:vi1];
        
        UIView *vi2 = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+1, 0, SCREEN_WIDTH/2-1, SCREEN_WIDTH*0.56-SCREEN_WIDTH*0.43-10-1)];
        vi2.backgroundColor = [UIColor whiteColor];
        [vi addSubview:vi2];
        
        self.financingLabel = [self createLabelWithFont:mainTitleSize andTextColor:MainColor andSview:vi1];
        [self.financingLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(vi1);
        
        }];
        
        self.financeNoLabel = [self createLabelWithFont:mainTitleSize andTextColor:MainColor andSview:vi2];
        [self.financeNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(vi2);
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

@end
