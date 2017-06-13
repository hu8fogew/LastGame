//
//  InvestmentLayout.m
//  QiPinTong
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "InvestmentLayout.h"

@implementation InvestmentLayout

-(id)copyWithZone:(NSZone *)zone
{
    InvestmentLayout *one = [[InvestmentLayout alloc]init];
    one.investmentViewHeight = self.investmentViewHeight;
    return one;
}


-(id)initInvestmentDescView
{
    self = [super init];
    if (self) {
        
        //项目详情
        LWTextStorage *textDe = [self createTextWithFrame:CGRectMake(10, 15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        textDe.text = @"机构介绍";
        
        //项目详情描述
        
        NSString *str1 = @"我们渴望拥有一个好的team，拥有一个好的企业文化，拥有一个好的工作环境，拥有一个好的发展方向，拥有一个好的发展方向。";
        NSString *str2 =@"我们渴望拥有这样的一支团队，我们也希望拥有这样的团队。我们渴望拥有这样的一支团队，我们也希望拥有这样的团队。";
        
        str1 = [str1 stringByAppendingFormat:@"\n%@",str2];
        
        LWTextStorage *projectDesc = [self createTextWithFrame:CGRectMake(textDe.left, textDe.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        projectDesc.text = str1;
        
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        lineF.frame = CGRectMake(0, projectDesc.bottom+10, SCREEN_WIDTH, 8);
        
        //融资历史
        LWTextStorage *historyText = [self createTextWithFrame:CGRectMake(textDe.left, lineF.bottom+15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        historyText.text = @"投资阶段";
        
        LWTextStorage *historyDesc = [self createTextWithFrame:CGRectMake(textDe.left, historyText.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        historyDesc.text = @"2015年11月     种子轮     2000万人民币     银江资本";
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        lineS.frame = CGRectMake(0, historyDesc.bottom+10, SCREEN_WIDTH, 8);
        
        
        LWTextStorage *areaText = [self createTextWithFrame:CGRectMake(textDe.left, lineS.bottom+15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        areaText.text = @"投资领域";
        
        LWTextStorage *areaDesc = [self createTextWithFrame:CGRectMake(textDe.left, areaText.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        areaDesc.text = @"移动互联网／媒体资讯／移动互联网／媒体资讯";
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        lineT.frame = CGRectMake(0, areaDesc.bottom+10, SCREEN_WIDTH, 8);
        
        
        [self addStorage:lineF];
        [self addStorage:lineS];
        [self addStorage:lineT];
        
        self.investmentViewHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}

//投资人的详情
-(id)initInvestmentPersonDescView
{
    self = [super init];
    if (self) {
        
        //项目详情
        LWTextStorage *textDe = [self createTextWithFrame:CGRectMake(10, 15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        textDe.text = @"个人简介";
        
        //项目详情描述
        
        NSString *str1 = @"我们渴望拥有一个好的team，拥有一个好的企业文化，拥有一个好的工作环境，拥有一个好的发展方向，拥有一个好的发展方向。";
        NSString *str2 =@"我们渴望拥有这样的一支团队，我们也希望拥有这样的团队。我们渴望拥有这样的一支团队，我们也希望拥有这样的团队。";
        
        str1 = [str1 stringByAppendingFormat:@"\n%@",str2];
        
        LWTextStorage *projectDesc = [self createTextWithFrame:CGRectMake(textDe.left, textDe.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        projectDesc.text = str1;
        
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        lineF.frame = CGRectMake(0, projectDesc.bottom+10, SCREEN_WIDTH, 8);
        
        //融资历史
        LWTextStorage *historyText = [self createTextWithFrame:CGRectMake(textDe.left, lineF.bottom+15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        historyText.text = @"我的优势";
        
        LWTextStorage *historyDesc = [self createTextWithFrame:CGRectMake(textDe.left, historyText.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        historyDesc.text = @"我是一个非常优秀的程序员，有着出色的技术、友善的人品。超强的组织能力和协同能力。一定为团队创造巨大的财富，不负众望。";
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        lineS.frame = CGRectMake(0, historyDesc.bottom+10, SCREEN_WIDTH, 8);
        
        LWTextStorage *areaText = [self createTextWithFrame:CGRectMake(textDe.left, lineS.bottom+15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        areaText.text = @"投资偏好";
        
        LWTextStorage *areaDesc = [self createTextWithFrame:CGRectMake(textDe.left, areaText.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        areaDesc.text = @"关注领域";
        
        LWTextStorage *enjoyDesc = [self createTextWithFrame:CGRectMake(textDe.left, areaDesc.bottom+8, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:descTitleSize];
        enjoyDesc.text = @"社交网络／文娱体育／汽车交通／社交网络／文娱体育";
        //投资阶段
        LWTextStorage *stage = [self createTextWithFrame:CGRectMake(textDe.left, enjoyDesc.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        stage.text = @"投资阶段";
        
        LWTextStorage *stageDesc = [self createTextWithFrame:CGRectMake(textDe.left, stage.bottom+8, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:descTitleSize];
        stageDesc.text = @"社交网络／文娱体育／汽车交通";
        
        //单笔投资
        LWTextStorage *investment = [self createTextWithFrame:CGRectMake(textDe.left, stageDesc.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        investment.text = @"单笔金额";
        
        LWTextStorage *investmentDesc = [self createTextWithFrame:CGRectMake(textDe.left, investment.bottom+8, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:descTitleSize];
        investmentDesc.text = @"200w-3000w";
        
        LWTextStorage *likeArea = [self createTextWithFrame:CGRectMake(textDe.left, investmentDesc.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        likeArea.text = @"关注地区";
        
        LWTextStorage *likeAreaDesc = [self createTextWithFrame:CGRectMake(textDe.left, likeArea.bottom+8, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:descTitleSize];
        likeAreaDesc.text = @"上海／北京／杭州／天津";
        
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        lineT.frame = CGRectMake(0, likeAreaDesc.bottom+10, SCREEN_WIDTH, 8);
        
        
        [self addStorage:lineF];
        [self addStorage:lineS];
        [self addStorage:lineT];
        
        self.investorViewHeight = [self suggestHeightWithBottomMargin:0];
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
