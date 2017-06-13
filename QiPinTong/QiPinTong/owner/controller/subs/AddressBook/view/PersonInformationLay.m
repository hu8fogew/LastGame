//
//  PersonInformationLay.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PersonInformationLay.h"

@implementation PersonInformationLay

-(id)copyWithZone:(NSZone *)zone
{
    PersonInformationLay *one = [[PersonInformationLay alloc]init];
    
    
    one.HeaderCellHeight = self.HeaderCellHeight;
    
    
    return one;
    
}


-(id)initPersonInformation
{
    self  = [super init];
    if (self) {
        
        //头像
        LWImageStorage *headerImage = [[LWImageStorage alloc]init];
        
        headerImage.contents = nil;
        
        headerImage.placeholder = [UIImage imageNamed:@"Qpt_icon"];
        
        headerImage.cornerRadius = 4.0f;
        
        headerImage.tag = 1001;
        
        headerImage.frame = CGRectMake(leftToMargin, topToMargin, 75, 75);
        
        [self addStorage:headerImage];
        
        //name
        LWTextStorage *nameStor = [self createTextWithFrame:CGRectMake(headerImage.right+10, headerImage.top+8, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:MTitleSize];
        nameStor.text = @"企聘通粉丝";
        
        //性别图片
        LWImageStorage *sexImg = [[LWImageStorage alloc]init];
        
        sexImg.contents = [UIImage imageNamed:@"maleIcon"];
        
        sexImg.frame = CGRectMake(nameStor.right+2, nameStor.top+1, nameStor.height-1, nameStor.height-1);
        
        [self addStorage:sexImg];
        
        //昵称
        
        NSString *strName = @"昵称： 会飞的青蛙";
        CGSize size = [strName sizeWithFont:[UIFont systemFontOfSize:subTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        
        LWTextStorage *subName = [self createTextWithFrame:CGRectMake(nameStor.left, headerImage.bottom-size.height, size.width, size.height) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        subName.text = strName;
        
        self.HeaderCellHeight = [self suggestHeightWithBottomMargin:topToMargin];
        
    }
    return self;
}






-(LWTextStorage *)createTextWithFrame:(CGRect)frame andTextColor:(UIColor *)color andTextFont:(CGFloat)size
{
    LWTextStorage *text = [[LWTextStorage alloc]init];
    text.frame = frame;
    text.textColor = color;
    text.backgroundColor = [UIColor whiteColor];
    text.textAlignment = NSTextAlignmentLeft;
    text.font = [UIFont systemFontOfSize:size];
    text.linespacing = 7.0f;
    [self addStorage:text];
    return text;
}


@end
