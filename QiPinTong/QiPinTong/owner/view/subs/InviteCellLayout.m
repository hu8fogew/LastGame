//
//  InviteCellLayout.m
//  QiPinTong
//
//  Created by taylor on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "InviteCellLayout.h"

@implementation InviteCellLayout

-(id)copyWithZone:(NSZone *)zone{
    InviteCellLayout *one = [[InviteCellLayout alloc]init];
    one.inviteCellHeight = self.inviteCellHeight;
    
    return one;
}

-(id)initInviteCell{
    self = [super init];
    if (self) {
        LWImageStorage *imgView = [[LWImageStorage alloc]init];
        imgView.contents = [UIImage imageNamed:@"perImage.jpg"];
        imgView.frame = CGRectMake(10, 20, SCREEN_WIDTH*0.1, SCREEN_WIDTH*0.1);
        imgView.cornerBorderWidth = 1;
        imgView.cornerBorderColor = grayC;
        [self addStorage:imgView];
        
        LWTextStorage *title = [self createLabelWithFrame:CGRectMake(imgView.right+10, imgView.top, SCREEN_WIDTH-30-imgView.width, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        title.text = @"张苗仔";
        
        LWTextStorage *date = [self createLabelWithFrame:CGRectMake(title.left, title.bottom+5, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:subTitleSize];
        date.text = @"2016-10-17 17:40";
        
        LWTextStorage *invite = [self createLabelWithFrame:CGRectMake(20, imgView.bottom+20, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:blueC andFont:subTitleSize];
        invite.text = @"面试邀请 : ";
        
        LWTextStorage *time = [self createLabelWithFrame:CGRectMake(invite.right+3, invite.top, SCREEN_WIDTH-invite.width-30, CGFLOAT_MAX) andTextColor:MainColor andFont:subTitleSize];
        time.text = @"时间 : 2016-10-18 上午 10:30";
        
        LWTextStorage *address = [self createLabelWithFrame:CGRectMake(time.left, time.bottom+10, SCREEN_WIDTH-invite.width-30, CGFLOAT_MAX) andTextColor:MainColor andFont:subTitleSize];
        address.text = @"地点 : 西安长乐中路西北国际茶城2单元2802室";
        
        LWTextStorage *phoneNo = [self createLabelWithFrame:CGRectMake(address.left, address.bottom+10, SCREEN_WIDTH-invite.width-30, CGFLOAT_MAX) andTextColor:MainColor andFont:subTitleSize];
        phoneNo.text = @"电话 : 13773932230 张经理";
        
        LWTextStorage *remarks = [self createLabelWithFrame:CGRectMake(phoneNo.left, phoneNo.bottom+10, SCREEN_WIDTH-invite.width-30, CGFLOAT_MAX) andTextColor:MainColor andFont:subTitleSize];
        remarks.text = @"备注 : 请携带纸质简历以及最近个人作品";
        
        CGRect bv = CGRectMake(10, imgView.bottom+10, SCREEN_WIDTH-20, remarks.bottom - imgView.bottom);
        self.backView = bv;
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, bv.origin.y+bv.size.height+15, SCREEN_WIDTH, 10);
        [self addStorage:line];
        self.inviteCellHeight = [self suggestHeightWithBottomMargin:0];
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
