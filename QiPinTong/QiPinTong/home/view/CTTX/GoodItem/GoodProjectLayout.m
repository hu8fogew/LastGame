//
//  GoodProjectLayout.m
//  QiPinTong
//
//  Created by mac on 2017/1/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "GoodProjectLayout.h"

@implementation GoodProjectLayout

-(id)copyWithZone:(NSZone *)zone
{
    GoodProjectLayout *one = [[GoodProjectLayout alloc]init];
    
    
    one.projectCellHeight = self.projectCellHeight;
    one.partnerCellHeight = self.partnerCellHeight;
    
    return one;
}


-(id)initWellProjectCell
{
    self = [super init];
    if (self) {
     
        //项目详情
        LWTextStorage *textDe = [self createTextWithFrame:CGRectMake(10, 15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        textDe.text = @"项目详情";
        
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
        historyText.text = @"项目详情";
        
        LWTextStorage *historyDesc = [self createTextWithFrame:CGRectMake(textDe.left, historyText.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        historyDesc.text = @"2015年11月     种子轮     2000万人民币     银江资本";
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        lineS.frame = CGRectMake(0, historyDesc.bottom+10, SCREEN_WIDTH, 8);
        
        //项目标签
        LWTextStorage *projectTag = [self createTextWithFrame:CGRectMake(textDe.left, lineS.bottom+15, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        projectTag.text = @"项目标签";
        
        NSArray *arr = @[@"天使轮",@"创投天下",@"万达广场天使轮",@"永辉商场",@"天使轮",@"万达广场",@"万达广场天使轮",@"永辉商场",@"创投天下",@"万达广场"];
        
        //判断到第几个换行；
        CGFloat w = projectTag.left;
        int sb = 0;
        for (int i = 0; i<arr.count; i++) {
            CGSize Swh = [arr[i] sizeWithFont:[UIFont systemFontOfSize:descTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
            CGFloat sizew = Swh.width+8;
            w += sizew;
            if (w>SCREEN_WIDTH-20) {
                sb=i;
                break;
            }
        }
        
        NSMutableArray *arrsign = [NSMutableArray array];
        CGFloat textW = 0;
        CGFloat textSW = 0;
        for (int i = 0; i<arr.count; i++) {
            
            LWTextStorage *signText = [[LWTextStorage alloc]init];
            
            signText.textColor = HWColor(139, 203, 197);
            signText.font = [UIFont systemFontOfSize:descTitleSize];
            signText.linespacing = 7.0f;
            signText.text = arr[i];
            signText.cornerBackgroundColor = [UIColor whiteColor];
            signText.backgroundColor = [UIColor whiteColor];
            signText.cornerRadius = 2.0;
            signText.textBoundingStrokeColor = HWColor(139, 203, 197);
            signText.strokeWidth = 1.0f;
            [self addStorage:signText];
            if(i  < 1)
            {
                signText.frame = CGRectMake(projectTag.left, projectTag.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX);
            }
            if (i>0) {
                CGSize textSize = [arr[i-1] sizeWithFont:[UIFont systemFontOfSize:descTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
                CGFloat tw = textSize.width+10;
                textW += tw;
                signText.frame = CGRectMake(projectTag.left+textW, projectTag.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX);
                
                if (i>(sb-1)) {
                    if (i == sb) {
                        signText.frame = CGRectMake(projectTag.left, signText.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX);
                    }else{
                        CGFloat ww = textSize.width +10;
                        textSW += ww;
                        signText.frame = CGRectMake(projectTag.left+textSW, signText.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX);
                    }
                }
                
            }
            
//            HWLog(@"%zd========%f",i,textSize.width);
            
            [arrsign addObject:signText];
            }
           
         //获取最后一个标记
        LWTextStorage *lastText = [arrsign lastObject];
        
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        lineT.frame = CGRectMake(0, lastText.bottom+10, SCREEN_WIDTH, 8);
        [self addStorage:lineS];
        [self addStorage:lineF];
        [self addStorage:lineT];
        self.projectCellHeight = [self suggestHeightWithBottomMargin:10];
    }
    return self;
}


//合伙人

-(id)initPartnerDetialCell
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
        historyText.text = @"合伙期望";
        
        LWTextStorage *historyDesc = [self createTextWithFrame:CGRectMake(textDe.left, historyText.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        historyDesc.text = @"求天下有志之士相聚一堂，共谋大事，携手共赢天下";
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        lineS.frame = CGRectMake(0, historyDesc.bottom+10, SCREEN_WIDTH, 8);
        
        [self addStorage:lineF];
        [self addStorage:lineS];
        
        self.partnerCellHeight = [self suggestHeightWithBottomMargin:10];
        
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
