//
//  InvestorCellLayout.m
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "InvestorBackCellLayout.h"

@implementation InvestorBackCellLayout

-(id)copyWithZone:(NSZone *)zone{
    InvestorBackCellLayout *one = [[InvestorBackCellLayout alloc]init];
    one.investorCellHeight = self.investorCellHeight;
    one.iEditBtn = self.iEditBtn;
    one.iDeleteBtn = self.iDeleteBtn;
    
    return one;
}

-(id)initWithInvestorBackCell{
    self = [super init];
    if (self) {
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.cornerBorderColor = grayC;
        image.cornerBorderWidth = 1.0f;
        image.cornerBackgroundColor = whiteC;
        image.frame = CGRectMake(leftToMargin, topToMargin, SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.18);
        image.contents = [UIImage imageNamed:@"comImage.jpg"];
        [self addStorage:image];
        
        LWTextStorage *name = [self createLabelWithFrame:CGRectMake(image.right+10 , image.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        name.text = @"任星星";
        
        NSString *str = @"投资经理";
        CGSize strSize = [str sizeWithFont:[UIFont systemFontOfSize:MTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        
        LWTextStorage *zw = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH-10-strSize.width, name.top, strSize.width, strSize.height) andTextColor:MainColor andFont:MTitleSize];
        zw.textAlignment = NSTextAlignmentRight;
        zw.text = str;
        
        LWTextStorage *company = [self createLabelWithFrame:CGRectMake(name.left, image.center.y-strSize.height/2, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        company.text = @"中国银江投资集团";
        
        LWTextStorage *field = [self createLabelWithFrame:CGRectMake(company.left, image.bottom-strSize.height, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        field.text = @"领域: 健康管理*医疗集团";
        
        LWImageStorage *le = [[LWImageStorage alloc]init];
        le.contents = [UIImage imageNamed:@"line_icon_image"];
        le.frame = CGRectMake(0,image.bottom+10, SCREEN_WIDTH, 1);
        [self addStorage:le];
        
        LWTextStorage *detail = [self createLabelWithFrame:CGRectMake(leftToMargin, le.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        detail.text = @"我的优势: 8年的销售经验，沟通能力强，口齿伶俐，思维敏捷，管理组织能力强";
        
        LWImageStorage *li = [[LWImageStorage alloc]init];
        li.contents = [UIImage imageNamed:@"line_icon_image"];
        li.frame = CGRectMake(0,detail.bottom+10, SCREEN_WIDTH, 1);
        [self addStorage:li];
        
        CGRect delete = CGRectMake(SCREEN_WIDTH-90, li.bottom+10, 70, 30);
        self.iDeleteBtn = delete;
        CGRect edit = CGRectMake(SCREEN_WIDTH-90-(10+70), li.bottom+10, 70, 30);
        self.iEditBtn = edit;
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0,li.bottom+30+10+10, SCREEN_WIDTH, 8);
        [self addStorage:line];
        
        self.investorCellHeight = [self suggestHeightWithBottomMargin:0];
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
