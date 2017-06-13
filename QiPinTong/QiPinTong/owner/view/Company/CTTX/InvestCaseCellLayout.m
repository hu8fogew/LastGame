//
//  InvestCaseCellLayout.m
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "InvestCaseCellLayout.h"

@implementation InvestCaseCellLayout

-(id)copyWithZone:(NSZone *)zone{

    InvestCaseCellLayout *one = [[InvestCaseCellLayout alloc]init];
    one.investCaseCellHeight = self.investCaseCellHeight;
    one.CaseEditBtn = self.CaseEditBtn;
    one.CaseDeleteBtn = self.CaseDeleteBtn;

    return one;
}

-(id)initWithInvestCaseCell{
    self = [super init];
    if (self) {
        LWTextStorage *title = [self createLabelWithFrame:CGRectMake(leftToMargin,topToMargin ,CGFLOAT_MAX , CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        title.text = @"东家:";
        LWTextStorage *titleDe = [self createLabelWithFrame:CGRectMake(title.right+3, title.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        titleDe.text = @"儿童动漫秀";
        
        LWTextStorage *date = [self createLabelWithFrame:CGRectMake(title.left, title.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        date.text = @"日期:";
        LWTextStorage *dateDe = [self createLabelWithFrame:CGRectMake(date.right+3, date.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        dateDe.text = @"2016-11-11";
        
        LWTextStorage *round = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH*0.4, date.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        round.text = @"轮次:";
        LWTextStorage *roundDe = [self createLabelWithFrame:CGRectMake(round.right+3, round.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        roundDe.text = @"天使轮";
        
        LWTextStorage *limit = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH*0.7, round.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        limit.text = @"额度";
        LWTextStorage *limitDe = [self createLabelWithFrame:CGRectMake(limit.right+3, limit.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:orangeC andFont:MTitleSize];
        limitDe.text = @"150w";
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, date.bottom+10, SCREEN_WIDTH, 1);
        [self addStorage:line];
        
        CGRect delete = CGRectMake(SCREEN_WIDTH-90, line.bottom+10, 70, 30);
        self.CaseDeleteBtn = delete;
        CGRect edit = CGRectMake(SCREEN_WIDTH-90-(10+70), line.bottom+10, 70, 30);
        self.CaseEditBtn = edit;
        
        LWImageStorage *le = [[LWImageStorage alloc]init];
        le.contents = [UIImage imageNamed:@"line_icon_image"];
        le.frame = CGRectMake(0,line.bottom+30+10+10, SCREEN_WIDTH, 8);
        [self addStorage:le];
        
        
        self.investCaseCellHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}

-(LWTextStorage *)createLabelWithFrame:(CGRect)frame andTextColor:(UIColor *)textColor andFont:(CGFloat)font{
    LWTextStorage *text = [[LWTextStorage alloc]init];
    text.frame = frame;
    text.textColor = textColor;
    text.backgroundColor = whiteC;
    text.textAlignment = NSTextAlignmentLeft;
    text.linespacing = 7.0f;
    text.font = [UIFont systemFontOfSize:font];
    
    [self addStorage:text];
    
    return text;
}


@end
