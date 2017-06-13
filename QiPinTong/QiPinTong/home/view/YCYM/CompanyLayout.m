//
//  CompanyLayout.m
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "CompanyLayout.h"

@implementation CompanyLayout


-(id)copyWithZone:(NSZone *)zone
{
    CompanyLayout *one = [[CompanyLayout alloc]init];
    one.descCompanyHeight = self.descCompanyHeight;
    one.enjoyPoint = self.enjoyPoint;
    one.comentCellHeight = self.comentCellHeight;
    return one;
}



//公司介绍
-(id)initDescCompanyView
{
    self = [super init];
    if (self) {
        
        //介绍
        LWTextStorage *desc = [self createTextWithFrame:CGRectMake(10, 15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        desc.text = @"公司介绍";
        //公司介绍
        LWTextStorage *companyDesc = [self createTextWithFrame:CGRectMake(desc.left, desc.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        companyDesc.text = @"放大看老夫就没得说开了房间的门口了附近的开了房间的疯狂到了就发到手机放到了考察名单来看车门口加大了空间分离度空间发的临时开放迈出了单来看车门口加大了空间分离度空间发的临时开放迈出了单来看车门口加大了空间分离度空间发的临时开放迈出了间分离度空间发的临时开放迈出了单来看车门口加大了空间分离度空间发的临时开放迈出了";
        //线
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        lineF.frame = CGRectMake(0, companyDesc.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:lineF];
        //地址
        LWTextStorage *eareDesc = [self createTextWithFrame:CGRectMake(desc.left, lineF.bottom+15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        eareDesc.text = @"公司地址";
        
        //公司地址
        LWTextStorage *companyMap = [self createTextWithFrame:CGRectMake(desc.left, eareDesc.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        companyMap.text = @"未央区：未央区中央路盛龙广场1号楼9层/n 未央区：未央区中央路盛龙广场1号楼9层";
        
        //线
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        lineS.frame = CGRectMake(0, companyMap.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:lineS];
        
        //面试
        LWTextStorage *commentNum = [self createTextWithFrame:CGRectMake(desc.left, lineS.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        commentNum.text = @"面试评价(5)";
        
        NSString *str = @"3.5";
        CGSize sizeWH = [str sizeWithFont:[UIFont systemFontOfSize:descTitleSize+1] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        //评价数目
        LWTextStorage *num = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-10-sizeWH.width, commentNum.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:HWColor(218, 149, 62) andTextFont:descTitleSize+1];
        num.text = str;
        
        LWTextStorage *mainComment = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH/2, num.top+1, SCREEN_WIDTH/2-sizeWH.width-10, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        mainComment.textAlignment = NSTextAlignmentRight;
        mainComment.text = @"综合评价";
        //线
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        lineT.frame = CGRectMake(0, commentNum.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:lineT];
        
        self.descCompanyHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}


-(id)initCommentCell
{
    self = [super init];
    if (self) {
        //头像
        LWImageStorage *imageH = [[LWImageStorage alloc]init];
        imageH.contents = [UIImage imageNamed:@"zwListImage.jpg"];
        imageH.cornerRadius = imageWH/2;
        imageH.cornerBorderWidth = 1.0f;
        imageH.cornerBorderColor = HWColor(242, 242, 242);
        imageH.cornerBackgroundColor = [UIColor whiteColor];
        imageH.frame = CGRectMake(10, 15, imageWH, imageWH);
        [self addStorage:imageH];
        
        //name
        LWTextStorage *name = [self createTextWithFrame:CGRectMake(imageH.right+10, imageH.top, CGFLOAT_MAX, imageH.height/2) andTextColor:MainColor andTextFont:mainTitleSize];
        name.text = @"匿名用户";
        //面试
        LWTextStorage *seaKind = [self createTextWithFrame:CGRectMake(name.left, name.bottom+3, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        seaKind.text = @"已面试：用户运营";
        
        //日期
        NSString *dataStr = @"01月08日";
        CGSize dataSize = [dataStr sizeWithFont:[UIFont systemFontOfSize:descTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *dataStorage = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-10-dataSize.width, name.top, dataSize.width, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        dataStorage.textAlignment = NSTextAlignmentRight;
        dataStorage.text = dataStr;
        
        //星
        for (int i= 0; i<5; i++) {
            LWImageStorage *starImage = [[LWImageStorage alloc]init];
            
            starImage.frame = CGRectMake(SCREEN_WIDTH-95+i*(15+2), dataStorage.bottom+5, 15, 15);
            starImage.contents = [UIImage imageNamed:@"star_yellow"];
            if(i>3)
            {
                starImage.contents = [UIImage imageNamed:@"star_gray"];
            }
            [self addStorage:starImage];
        }
        
        //comment
        LWTextStorage *comTextStor = [self createTextWithFrame:CGRectMake(name.left, seaKind.bottom+10, SCREEN_WIDTH-10-name.left, CGFLOAT_MAX) andTextColor:MainColor andTextFont:descTitleSize];
        comTextStor.text =@"这个公司是一个非常有实力的公司，曾经一度被列为世界500强企业。能称为这个公司的一员，也是职业生涯中的巅峰了，这个公司是一个非常有实力的公司，曾经一度被列为世界500强企业。能称为这个公司的一员，也是职业生涯中的巅峰了。";
        
        //点赞
        NSString *strNum = @"(5)";
        CGSize numSize = [strNum sizeWithFont:[UIFont systemFontOfSize:mainTitleSize-1] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *num = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-10-numSize.width, comTextStor.bottom+10, numSize.width, numSize.height) andTextColor:HWColor(124, 185, 228) andTextFont:mainTitleSize-1];
        num.textAlignment = NSTextAlignmentRight;
        num.text = strNum;
        
        //点赞按钮
        CGRect enjoyButton = CGRectMake(SCREEN_WIDTH-numSize.width-40, num.top-4, 30, 25);
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, num.bottom+10, SCREEN_WIDTH, 1.5);
        [self addStorage:line];
        self.enjoyPoint = enjoyButton;
        self.comentCellHeight = [self suggestHeightWithBottomMargin:0];
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
