//
//  WorkGuideLayout.m
//  QiPinTong
//
//  Created by taylor on 2017/2/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WorkGuideLayout.h"

@implementation WorkGuideLayout

-(id)copyWithZone:(NSZone *)zone{
    WorkGuideLayout *one = [[WorkGuideLayout alloc]init];
    one.guideCellHeight = self.guideCellHeight;

    return one;
}

-(id)initWithWorkGuideCell{
    self = [super init];
    if (self) {
        LWTextStorage *title = [self createLabelWithFrame:CGRectMake(leftToMargin, topToMargin, SCREEN_WIDTH*0.65, CGFLOAT_MAX) andTextColor:MainColor andFont:mainTitleSize];
        title.text = @"减肥的减肥的链接发到了空间方面的路口见父母都快来";
        
        LWImageStorage *imgView = [[LWImageStorage alloc]init];
        imgView.contents = [UIImage imageNamed:@"image365"];
        imgView.frame = CGRectMake(title.right+15, title.top, SCREEN_WIDTH-35-title.width, SCREEN_WIDTH*0.18);
        [self addStorage:imgView];
        
        LWTextStorage *class = [self createLabelWithFrame:CGRectMake(title.left, imgView.bottom-descTitleSize, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:HWColor(61, 158, 226) andFont:descTitleSize];
        class.text = @"专题";
        
        LWTextStorage *comment = [self createLabelWithFrame:CGRectMake(class.right+15, class.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:descTitleSize];
        comment.text = @"186好评";
        
        LWTextStorage *from = [self createLabelWithFrame:CGRectMake(comment.right+15, comment.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:descTitleSize];
        from.text = @"来自精彩微课";
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.frame = CGRectMake(0, imgView.bottom+topToMargin, SCREEN_WIDTH, 8);
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        [self addStorage:line];
        
        
        self.guideCellHeight = [self suggestHeightWithBottomMargin:0];
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
