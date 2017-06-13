//
//  VentureProjectCellLayout.m
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "VtProjectCellLayout.h"

@implementation VtProjectCellLayout

-(id)copyWithZone:(NSZone *)zone{
    VtProjectCellLayout *one = [[VtProjectCellLayout alloc]init];
    one.vtProjectCellHeight = self.vtProjectCellHeight;
    one.vEditBtn = self.vEditBtn;
    one.vDeleteBtn = self.vDeleteBtn;
    
    return one;
}

-(id)initWithVtProjectCell{
    self = [super init];
    if (self) {
        LWTextStorage *title = [self createLabelWithFrame:CGRectMake(10, 20, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:mainTitleSize];
        title.text = @"主题:";
        LWTextStorage *titleDe = [self createLabelWithFrame:CGRectMake(title.right+3, title.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        titleDe.text = @"儿童动漫秀";
        
        LWTextStorage *field = [self createLabelWithFrame:CGRectMake(title.left, title.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        field.text = @"领域:";
        LWTextStorage *fieldDe = [self createLabelWithFrame:CGRectMake(field.right+3, field.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        fieldDe.text = @"金融类";
        
        LWTextStorage *round = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH/3, field.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        round.text = @"轮次";
        LWTextStorage *roundDe = [self createLabelWithFrame:CGRectMake(round.right+3, round.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        roundDe.text = @"天使轮";
        
        LWTextStorage *limit = [self createLabelWithFrame:CGRectMake(SCREEN_WIDTH*2/3, field.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        limit.text = @"额度:";
        LWTextStorage *limitDe = [self createLabelWithFrame:CGRectMake(limit.right+3, limit.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:orangeC andFont:MTitleSize];
        limitDe.text = @"150w";
        
        LWTextStorage *type = [self createLabelWithFrame:CGRectMake(field.left, field.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        type.text = @"运营状态";
        
        LWTextStorage *typeDe = [self createLabelWithFrame:CGRectMake(type.right+3, type.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        typeDe.text = @"已运营";
        
        LWTextStorage *zone = [self createLabelWithFrame:CGRectMake(round.left, type.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        zone.text = @"区域:";
        LWTextStorage *zoneDe = [self createLabelWithFrame:CGRectMake(zone.right+3, zone.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        zoneDe.text = @"西安";
        
        LWTextStorage *label = [self createLabelWithFrame:CGRectMake(type.left, type.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        label.text = @"标签:";
        LWTextStorage *labelDe = [self createLabelWithFrame:CGRectMake(label.right+3, label.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:HWColor(31, 193, 199) andFont:MTitleSize];
        labelDe.text = @"企业服务 vr 资源整合";
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, label.bottom+10, SCREEN_WIDTH, 1);
        [self addStorage:line];
        
        CGRect delete = CGRectMake(SCREEN_WIDTH-90, line.bottom+10, 70, 30);
        self.vDeleteBtn = delete;
        
        CGRect edit = CGRectMake(SCREEN_WIDTH-90-10-70, line.bottom+10, 70, 30);
        self.vEditBtn = edit;
        
        
        LWImageStorage *le = [[LWImageStorage alloc]init];
        le.contents = [UIImage imageNamed:@"line_icon_image"];
        le.frame = CGRectMake(0, line.bottom+30+10+10, SCREEN_WIDTH, 8);
        [self addStorage:le];
        
        
        self.vtProjectCellHeight = [self suggestHeightWithBottomMargin:0];
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
