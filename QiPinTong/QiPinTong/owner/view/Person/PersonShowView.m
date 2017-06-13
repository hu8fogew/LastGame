//
//  MemberShowView.m
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PersonShowView.h"

@interface PersonShowView()

@property(nonatomic,strong)NSMutableArray *arr;

@end

@implementation PersonShowView


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        

    }
    return self;
}

-(void)setTitleArr:(NSArray *)titleArr
{
    _titleArr = titleArr;
    
    
    [self setUpViewWith:titleArr];
    
}


-(void)setUpViewWith:(NSArray *)arr
{
    for (int i = 0; i<arr.count; i++) {
        
        UIView *firstView = [[UIView alloc]initWithFrame:CGRectMake(0+i*SCREEN_WIDTH/4, 0, SCREEN_WIDTH/4,SCREEN_WIDTH*0.18)];
        firstView.tag = 100+i;
        [self addSubview:firstView];
        firstView.userInteractionEnabled = YES;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
        [firstView addGestureRecognizer:tap];
        //关注度个数
        UILabel *focusNoLabel = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:firstView];
        focusNoLabel.text = arr[i][@"number"];
        [focusNoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(firstView.mas_centerY).offset(-3);
            make.centerX.equalTo(firstView);
        }];
        //标题（关注、邀请、投递记录、收到简历）
        UILabel *focusLabel = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:firstView];
        focusLabel.text = arr[i][@"title"];
        [focusLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(firstView.mas_centerY).with.offset(3);
            make.centerX.equalTo(firstView);
        }];
        [self.arr addObject:firstView];
    }
}

-(void)tap:(UITapGestureRecognizer *)gesture
{
    NSInteger tag = gesture.view.tag;
    
    if (_delegate && [_delegate respondsToSelector:@selector(didSelectButton:)]) {
        [_delegate didSelectButton:tag];
    }
}


@end
