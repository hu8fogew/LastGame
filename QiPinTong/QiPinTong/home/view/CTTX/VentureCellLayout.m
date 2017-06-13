//
//  VentureCellLayout.m
//  QiPinTong
//
//  Created by taylor on 2017/2/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "VentureCellLayout.h"

@implementation VentureCellLayout

-(id)copyWithZone:(NSZone *)zone{
    VentureCellLayout *one = [[VentureCellLayout alloc]init];
    one.ventureCellHeight = self.ventureCellHeight;
    
    return one;
}

-(id)initWithVentureCell{
    self = [super init];
    if (self) {
        LWImageStorage *imgView = [[LWImageStorage alloc]init];
        imgView.frame = CGRectMake(10, 10, SCREEN_WIDTH*0.24, SCREEN_WIDTH*0.17);
        imgView.contents = [UIImage imageNamed:@"zwListImage.jpg"];
        imgView.cornerBorderWidth = 1;
        imgView.cornerBorderColor = grayC;
        [self addStorage:imgView];
        
        LWTextStorage *title = [self createLabelWithFrame:CGRectMake(imgView.right+10, imgView.top, SCREEN_WIDTH-30-imgView.width, CGFLOAT_MAX) andTextColor:MainColor andFont:mainTitleSize];
        title.text = @"奋斗大讲堂之中信出版卢俊义：匠人精神月商业社会";
        
        LWImageStorage *addressImage = [[LWImageStorage alloc]init];
        addressImage.frame = CGRectMake(title.left, imgView.bottom-mainTitleSize, descTitleSize, descTitleSize);
        addressImage.contents = [UIImage imageNamed:@"locationIcon"];
        [self addStorage:addressImage];
        LWTextStorage *address = [self createLabelWithFrame:CGRectMake(addressImage.right+3, addressImage.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:descTitleSize];
        address.text = @"西安";
        
        LWImageStorage *timeImage = [[LWImageStorage alloc]init];
        timeImage.frame = CGRectMake(address.right+15, address.top, descTitleSize, descTitleSize);
        timeImage.contents = [UIImage imageNamed:@"timeIcon"];
        [self addStorage:timeImage];
        LWTextStorage *time = [self createLabelWithFrame:CGRectMake(timeImage.right+3, timeImage.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:descTitleSize];
        time.text = @"11月10日";
        
        LWTextStorage *num = [self createLabelWithFrame:CGRectMake(time.right+15, time.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:descTitleSize];
        num.text = @"已报名30项目";
        
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, imgView.bottom+15, SCREEN_WIDTH, 1);
        [self addStorage:line];
        
        LWTextStorage *detail = [self createLabelWithFrame:CGRectMake(imgView.left, line.bottom+15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:descTitleSize];
        detail.text = @"主办方:互联网金融孵化器、Opark创业中国";
        
        
        LWImageStorage *le = [[LWImageStorage alloc]init];
        le.contents = [UIImage imageNamed:@"line_icon_image"];
        le.frame = CGRectMake(0, detail.bottom+10, SCREEN_WIDTH, 8);
        [self addStorage:le];
        
        self.ventureCellHeight = [self suggestHeightWithBottomMargin:0];
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
