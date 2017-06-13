//
//  VtTCLYCellLayout.m
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "VtTCLYCellLayout.h"

@implementation VtTCLYCellLayout

-(id)copyWithZone:(NSZone *)zone{
    VtTCLYCellLayout *one = [[VtTCLYCellLayout alloc]init];
    one.vtShowCellHeight = self.vtShowCellHeight;
    one.sEditBtn = self.sEditBtn;
    one.sDeleteBtn = self.sDeleteBtn;
    
    return one;
}

-(id)initWithVtShowCell{
    self = [super init];
    if (self) {
        LWTextStorage *title = [self createLabelWithFrame:CGRectMake(10, 20, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        title.text = @"主题:";
        LWTextStorage *titleDe = [self createLabelWithFrame:CGRectMake(title.right+3, title.top, SCREEN_WIDTH-23-title.width, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        titleDe.text = @"三尚传媒募资2亿 上市公司联络互动拟包揽对其控股";
        
        LWTextStorage *city = [self createLabelWithFrame:CGRectMake(title.left, titleDe.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        city.text = @"城市:";
        LWTextStorage *cityDe = [self createLabelWithFrame:CGRectMake(city.right+3, city.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        cityDe.text = @"西安";
        
        LWTextStorage *start = [self createLabelWithFrame:CGRectMake(city.left, city.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        start.text = @"开始时间:";
        LWTextStorage *startDe = [self createLabelWithFrame:CGRectMake(start.right+3, start.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        startDe.text = @"2017-01-20";
        
        LWTextStorage *end = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH/2, start.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        end.text = @"结束时间:";
        LWTextStorage *endDe = [self createLabelWithFrame:CGRectMake(end.right+3, end.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        endDe.text = @"2017-02-22";
        
        LWTextStorage *sponsor = [self createLabelWithFrame:CGRectMake(start.left, start.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        sponsor.text = @"主办方:";
        LWTextStorage *sponsorDe = [self createLabelWithFrame:CGRectMake(sponsor.right+3, sponsor.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        sponsorDe.text = @"陕西世纪家联教育科技有限公司";
        
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, sponsor.bottom+10, SCREEN_WIDTH, 1);
        [self addStorage:line];
        
        CGRect delete = CGRectMake(SCREEN_WIDTH-90, line.bottom+10, 70, 30);
        self.sDeleteBtn = delete;
        
        CGRect edit = CGRectMake(SCREEN_WIDTH-90-10-70, line.bottom+10, 70, 30);
        self.sEditBtn = edit;
        
        LWImageStorage *le = [[LWImageStorage alloc]init];
        le.contents = [UIImage imageNamed:@"line_icon_image"];
        le.frame = CGRectMake(0, line.bottom+30+10+10, SCREEN_WIDTH, 8);
        [self addStorage:le];
        
        self.vtShowCellHeight = [self suggestHeightWithBottomMargin:0];
        
    }
    return self;
}

-(LWTextStorage *)createLabelWithFrame:(CGRect)frame andTextColor:(UIColor *)textColor andFont:(CGFloat)font{
    LWTextStorage *text = [[LWTextStorage alloc]init];
    text.frame = frame;
    text.textColor = textColor;
    text.backgroundColor = [UIColor whiteColor];
    text.textAlignment = NSTextAlignmentLeft;
    text.linespacing = 7.0f;
    text.font = [UIFont systemFontOfSize:font];
    
    [self addStorage:text];
    
    return text;
}

@end
