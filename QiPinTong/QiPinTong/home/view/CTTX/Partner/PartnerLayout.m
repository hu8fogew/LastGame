//
//  PartnerLayout.m
//  QiPinTong
//
//  Created by taylor on 2017/4/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PartnerLayout.h"

@implementation PartnerLayout

-(id)copyWithZone:(NSZone *)zone{
    PartnerLayout *one = [[PartnerLayout alloc]init];
    one.partnerCellH = self.partnerCellH;
    
    return one;
}

-(id)initWithPartnerCell{
    self = [super init];
    if (self) {
        //图像
        LWImageStorage *imgView = [[LWImageStorage alloc]init];
        imgView.frame = CGRectMake(leftToMargin, topToMargin, SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.18);
        imgView.contents = [UIImage imageNamed:@"MF"];
        imgView.cornerBorderWidth = 1;
        imgView.cornerBorderColor = grayC;
        [self addStorage:imgView];
        
        //名称
        LWTextStorage *name = [self createLabelWithFrame:CGRectMake(imgView.right+leftToMargin, imgView.top, SCREEN_WIDTH*0.5, CGFLOAT_MAX) andTextColor:MainColor andFont:mainTitleSize];
        name.text = @"似水年华";
        
        //年龄
        NSString *str = @"年龄:29";
        CGSize strSize = [str sizeWithFont:[UIFont systemFontOfSize: mainTitleSize-1] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *age = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH-leftToMargin-strSize.width, name.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:mainTitleSize-1];
        age.text = str;
        
        //行业
        LWTextStorage *industry = [self createLabelWithFrame:CGRectMake(name.left, name.bottom+imgView.height/8, SCREEN_WIDTH*0.2, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:mainTitleSize-1];
        industry.text = @"移动互联网";
        
        //加盟
        LWTextStorage *want = [self createLabelWithFrame:CGRectMake(industry.right+5, industry.top, SCREEN_WIDTH*0.2, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:mainTitleSize-1];
        want.text = @"战略联盟";
        
        //投资数量
        NSString *stra = @"50W";
        CGSize strSiz = [stra sizeWithFont:[UIFont systemFontOfSize: mainTitleSize-1] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *amount = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH-leftToMargin-strSiz.width, industry.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:orangeC andFont:mainTitleSize-1];
        amount.text = stra;
        
        LWTextStorage *invest = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH-leftToMargin-amount.width-60, industry.top, 60, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:mainTitleSize-1];
        invest.textAlignment = NSTextAlignmentRight;
        invest.text = @"投资额:";
        
        //地址
        LWImageStorage *addressIcon = [LWImageStorage new];
        addressIcon.frame = CGRectMake(name.left, industry.bottom+imgView.height/8, mainTitleSize-1, mainTitleSize-1);
        addressIcon.contents = [UIImage imageNamed:@"locationIcon"];
        [self addStorage:addressIcon];
        
        LWTextStorage *address = [self createLabelWithFrame:CGRectMake(addressIcon.right+3, addressIcon.top, SCREEN_WIDTH*0.5, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:mainTitleSize-1];
        address.text = @"西安";
        
        //浏览
        NSString *strl = @"24";
        CGSize strSi = [strl sizeWithFont:[UIFont systemFontOfSize: mainTitleSize-1] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *num = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH-leftToMargin-strSi.width, address.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:mainTitleSize-1];
        num.text = strl;
        
        LWImageStorage *eyeIcon = [LWImageStorage new];
        eyeIcon.frame = CGRectMake(SCREEN_WIDTH-leftToMargin-num.width-mainTitleSize-2, num.top, mainTitleSize-1, mainTitleSize-1);
        eyeIcon.contents = [UIImage imageNamed:@"eyeIcon"];
        [self addStorage:eyeIcon];
        
        LWImageStorage *le = [[LWImageStorage alloc]init];
        le.contents = [UIImage imageNamed:@"line_icon_image"];
        le.frame = CGRectMake(0, imgView.bottom+10, SCREEN_WIDTH, 1);
        [self addStorage:le];
        
        LWTextStorage *expert = [self createLabelWithFrame:CGRectMake(imgView.left, le.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:mainTitleSize-1];
        expert.text = @"合作期望：人的品质，事业型团队";
        
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, expert.bottom+10, SCREEN_WIDTH, 10);
        [self addStorage:line];
        
        self.partnerCellH = [self suggestHeightWithBottomMargin:0];
        
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
