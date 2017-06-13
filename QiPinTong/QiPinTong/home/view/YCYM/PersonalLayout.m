//
//  PersonalLayout.m
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PersonalLayout.h"

@implementation PersonalLayout
-(id)copyWithZone:(NSZone *)zone
{
    PersonalLayout *one = [[PersonalLayout alloc]init];
    one.descCellHeight = self.descCellHeight;
    one.descViewHeight = self.descViewHeight;
    one.chectButton = self.chectButton;
    one.returnSendBtn = self.returnSendBtn;
    one.enjoyButton = self.enjoyButton;
    one.personViewHeight = self.personViewHeight;
    one.photoPosition = self.photoPosition;
    one.editViewPosition = self.editViewPosition;
    one.discoverVHeight = self.discoverVHeight;
//    one.sendVPosition = self.sendVPosition;
    return one;
}
//个人求职类型视图的介绍

-(id)initPersonalOfWorkKind
{
    self = [super init];
    if (self) {
        //职位
        LWTextStorage *jobKind = [self createTextWithFrame:CGRectMake(10, 15, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        jobKind.text = @"高级UI设计师";
        //职位类型（全职、薪资）
        LWTextStorage *jobSalary = [self createTextWithFrame:CGRectMake(jobKind.right+4, 16, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:HWColor(218, 149, 62) andTextFont:mainTitleSize-1];
        jobSalary.text = @"(全职  5-8k)";
        
        //查看电话按钮
        CGRect buttonShare = CGRectMake(SCREEN_WIDTH-80, jobKind.top, 70, jobKind.height);
        
        //地区图片
        LWImageStorage *mapImg = [[LWImageStorage alloc]init];
        mapImg.frame = CGRectMake(jobKind.left, jobKind.bottom+8, 15, 15);
        mapImg.contents = [UIImage imageNamed:@"locationIcon"];
        
        //区域
        LWTextStorage *mapText = [self createTextWithFrame:CGRectMake(mapImg.right+3, jobKind.bottom+8, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        mapText.text = @"乌鲁木齐";
        
        //工龄图片
        LWImageStorage *timeImage = [[LWImageStorage alloc]init];
        timeImage.contents = [UIImage imageNamed:@"timeIcon"];
        timeImage.frame = CGRectMake(mapText.right+15, mapImg.top, mapImg.width, mapImg.height);
        //工龄
        LWTextStorage *workTime = [self createTextWithFrame:CGRectMake(timeImage.right+4, mapText.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        workTime.text = @"3年";
        
        //学历照片
        LWImageStorage *eduImg =[[LWImageStorage alloc]init];
        eduImg.frame = CGRectMake(workTime.right+15, mapImg.top, mapImg.width, mapImg.height);
        eduImg.contents = [UIImage imageNamed:@"academicIcon"];
        
        //学历
        LWTextStorage *eduText =[self createTextWithFrame:CGRectMake(eduImg.right+4, mapText.top+1, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        eduText.text = @"硕士";
        
        //期望行业
        LWTextStorage *wantKind = [self createTextWithFrame:CGRectMake(jobKind.left, mapImg.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        wantKind.text = @"期望行业：互联网/电子商务";
        //求职状态
        LWTextStorage *stateWork = [self createTextWithFrame:CGRectMake(wantKind.right+10, wantKind.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        stateWork.text = @"求职状态：离职-随时到岗";
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, stateWork.bottom+10, SCREEN_WIDTH, DistanceForCell);
        
        
        [self addStorage:line];
        self.chectButton = buttonShare;
        [self addStorage:mapImg];
        [self addStorage:eduImg];
        [self addStorage:timeImage];
        self.descViewHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}






//个人经历介绍的cell（标题、介绍两个内容）
-(id)initDescPersonCell
{
    self = [super init];
    if (self) {
        //主标题
        LWTextStorage *mainTitle = [self createTextWithFrame:CGRectMake(leftToMargin, topToMargin, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        mainTitle.text = @"我的优势";
        //我的介绍
        LWTextStorage *descTitle = [self createTextWithFrame:CGRectMake(mainTitle.left, mainTitle.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        descTitle.text = @"我品学兼优、有超强的个人素质和信仰，有超强的这方面的经验，我能快速的融入到这个团队中";
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, descTitle.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:line];
        
        //主标题
        LWTextStorage *commentTitle = [self createTextWithFrame:CGRectMake(leftToMargin, line.bottom+topToMargin, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        commentTitle.text = @"自我评价";
        //我的评价
        LWTextStorage *descComment = [self createTextWithFrame:CGRectMake(commentTitle.left, commentTitle.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        descComment.text = @"我品学兼优、有超强的个人素质和信仰，有超强的这方面的经验，我能快速的融入到这个团队中";
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        lineF.frame = CGRectMake(0, descComment.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:lineF];
        
        
        //主标题
        LWTextStorage *educateTitle = [self createTextWithFrame:CGRectMake(leftToMargin, lineF.bottom+topToMargin, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        educateTitle.text = @"教育经历";
        //我的评价
        LWTextStorage *descEducate = [self createTextWithFrame:CGRectMake(educateTitle.left, educateTitle.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        NSString *strE1 = @"2015年8月 - 2015年10月  牛津大学 物理系 硕士";
        NSString *strE2 = @"2016年1月 - 2016年11月 西点军校 镭射系 博士";
        strE1 = [strE1 stringByAppendingFormat:@"\n%@",strE2];
        
        
        descEducate.text = strE1;
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        lineS.frame = CGRectMake(0, descEducate.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:lineS];
        
        //主标题
        LWTextStorage *teachTitle = [self createTextWithFrame:CGRectMake(leftToMargin, lineS.bottom+topToMargin, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        teachTitle.text = @"培训经历";
        //我的评价
        LWTextStorage *descTech = [self createTextWithFrame:CGRectMake(teachTitle.left, teachTitle.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        descTech.text = strE1;
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        lineT.frame = CGRectMake(0, descTech.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:lineT];
        
        //主标题
        LWTextStorage *awardTitle = [self createTextWithFrame:CGRectMake(leftToMargin, lineT.bottom+topToMargin, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        awardTitle.text = @"获奖情况";
        //我的评价
        LWTextStorage *descAward = [self createTextWithFrame:CGRectMake(awardTitle.left, awardTitle.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        descAward.text = @"我品学兼优、有超强的个人素质和信仰，有超强的这方面的经验，我能快速的融入到这个团队中";
        LWImageStorage *linfo = [[LWImageStorage alloc]init];
        linfo.contents = [UIImage imageNamed:@"line_icon_image"];
        linfo.frame = CGRectMake(0, descAward.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:linfo];
        
        //主标题
        LWTextStorage *workTitle = [self createTextWithFrame:CGRectMake(leftToMargin, linfo.bottom+topToMargin, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        workTitle.text = @"工作经历";
        //我的评价
        LWTextStorage *descWork = [self createTextWithFrame:CGRectMake(workTitle.left, workTitle.bottom+10, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:descTitleSize];
        descWork.text = strE1;
        LWImageStorage *linfv = [[LWImageStorage alloc]init];
        linfv.contents = [UIImage imageNamed:@"line_icon_image"];
        linfv.frame = CGRectMake(0, descWork.bottom+10, SCREEN_WIDTH, 6);
        [self addStorage:linfv];
        
        self.descCellHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}

//个人、企业的个人头部视图详情
-(id)initOwnerDetailWithSrtId:(NSString *)StrId
{
    NSString *str = @"个人";
    BOOL isright = [StrId isEqualToString:str];
    
    self = [super init];
    if (self) {
        
        //头像
        LWImageStorage *headerImage = [[LWImageStorage alloc]init];
        headerImage.tag = 1001;
        headerImage.frame = CGRectMake((SCREEN_WIDTH/2)-(0.17*SCREEN_WIDTH)/2, 20, SCREEN_WIDTH*0.17, SCREEN_WIDTH*0.17);
        headerImage.contents = [UIImage imageNamed:@"perImage.jpg"];
        headerImage.cornerRadius = 0.17*SCREEN_WIDTH/2;
        headerImage.cornerBorderWidth = 1.0f;
        headerImage.cornerBorderColor = headerImgColor;
        CGRect photoPosition = CGRectMake((SCREEN_WIDTH/2)-(0.17*SCREEN_WIDTH)/2, 20, SCREEN_WIDTH*0.17, SCREEN_WIDTH*0.17);
        [self addStorage:headerImage];
        
        LWImageStorage *vipImg = [[LWImageStorage alloc]init];
        vipImg.frame = CGRectMake(headerImage.center.x+15, headerImage.center.y+15, 18, 18);
        vipImg.cornerRadius = 7.5f;
        vipImg.contents = [UIImage imageNamed:@"yvipIcon"];
        [self addStorage:vipImg];
        
        
        //点赞和转发的位置
        CGRect reSentFrame = CGRectMake(SCREEN_WIDTH-15-20-10-20, headerImage.top, 20, 20);
        CGRect enjoyBtnFrame = CGRectMake(SCREEN_WIDTH-15-20, headerImage.top, 20, 20);
        //名称
        NSString *str = isright ? @"韩雪冬":@"深圳腾讯科技有限公司";
        CGSize strSize = [str sizeWithFont:[UIFont systemFontOfSize:mainTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *nameStore = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH/2-strSize.width/2, headerImage.bottom + 10, strSize.width, CGFLOAT_MAX) andTextColor:whiteC andTextFont:mainTitleSize];
        nameStore.text = str;
        //性别
        LWImageStorage *sexImg = [[LWImageStorage alloc]init];
        sexImg.contents = [UIImage imageNamed:@"maleIcon"];
        sexImg.frame = CGRectMake(nameStore.right+5, nameStore.top, nameStore.height-3, nameStore.height-3);
        [self addStorage:sexImg];
        
        NSString *strF = @"关注 45";
        CGSize strFSize = [strF sizeWithFont:[UIFont systemFontOfSize:descTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *enjoyText = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH/2-strFSize.width-8, nameStore.bottom+10, strFSize.width, CGFLOAT_MAX) andTextColor:whiteC andTextFont:descTitleSize];
        enjoyText.text = strF;
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"whiteLine"];
        
        line.frame = CGRectMake(SCREEN_WIDTH/2-0.5, enjoyText.top, 1, enjoyText.height);
        [self addStorage:line];
        
        NSString *strS = @"粉丝 888";
        LWTextStorage *fance = [self createTextWithFrame:CGRectMake(line.right+7.5, enjoyText.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:whiteC andTextFont:descTitleSize];
        fance.text = strS;
        NSString *strPersonalDesc = @"183cm  未婚  陕西西安";
        CGSize descSize = [strPersonalDesc sizeWithFont:[UIFont systemFontOfSize:descTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *descPerson = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH/2-descSize.width/2, enjoyText.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:whiteC andTextFont:descTitleSize];
        descPerson.text = strPersonalDesc;
        
        descPerson.hidden = isright;
        
        
        self.returnSendBtn = reSentFrame;
        self.enjoyButton = enjoyBtnFrame;
        self.photoPosition = photoPosition;
        
        self.personViewHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}




-(id)initOwnerDiscoverView
{
    self = [super init];
    if (self) {
        
        //头像
        LWImageStorage *headerImage = [[LWImageStorage alloc]init];
        headerImage.tag = 1001;
        headerImage.frame = CGRectMake((SCREEN_WIDTH/2)-(0.17*SCREEN_WIDTH)/2, 20, SCREEN_WIDTH*0.17, SCREEN_WIDTH*0.17);
        headerImage.contents = [UIImage imageNamed:@"perImage.jpg"];
        headerImage.cornerRadius = 0.17*SCREEN_WIDTH/2;
        headerImage.cornerBorderWidth = 0.5f;
        headerImage.cornerBorderColor = headerImgColor;
        CGRect photoPosition = CGRectMake((SCREEN_WIDTH/2)-(0.17*SCREEN_WIDTH)/2, 20, SCREEN_WIDTH*0.17, SCREEN_WIDTH*0.17);
        [self addStorage:headerImage];
        
        //名称
        NSString *str = @"韩雪冬";
        CGSize strSize = [str sizeWithFont:[UIFont systemFontOfSize:mainTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *nameStore = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH/2-strSize.width/2, headerImage.bottom + 10, strSize.width, CGFLOAT_MAX) andTextColor:whiteC andTextFont:mainTitleSize];
        nameStore.text = str;
        
        LWImageStorage *sexImg = [[LWImageStorage alloc]init];
        sexImg.contents = [UIImage imageNamed:@"femaleIcon"];
        sexImg.frame = CGRectMake(nameStore.right+5, nameStore.top, nameStore.height, nameStore.height);
        [self addStorage:sexImg];
        
        
        
        NSString *strF = @"关注 45";
        CGSize strFSize = [strF sizeWithFont:[UIFont systemFontOfSize:descTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *enjoyText = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH/2-strFSize.width-8, nameStore.bottom+10, strFSize.width, CGFLOAT_MAX) andTextColor:whiteC andTextFont:descTitleSize];
        enjoyText.text = strF;
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"whiteLine"];
        
        line.frame = CGRectMake(SCREEN_WIDTH/2-0.5, enjoyText.top, 1, enjoyText.height);
        [self addStorage:line];
        
        NSString *strS = @"粉丝 888";
        LWTextStorage *fance = [self createTextWithFrame:CGRectMake(line.right+7.5, enjoyText.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:whiteC andTextFont:descTitleSize];
        fance.text = strS;
        
        
        self.editViewPosition = CGRectMake(0, -100, SCREEN_WIDTH, fance.bottom+20+100);
        
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        
        lineS.frame = CGRectMake(0, fance.bottom+20, SCREEN_WIDTH, DistanceForCell);
        [self addStorage:lineS];
        
        /*
        LWTextStorage *text = [self createTextWithFrame:CGRectMake(10, lineS.bottom+20, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:17];
        text.text = @"说点什么......";
        
        
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.contents = [UIImage imageNamed:@"camera_icon"];
        image.frame = CGRectMake(SCREEN_WIDTH-50, lineS.bottom+10, 40, 40);
        image.tag = 1005;
        [self addStorage:image];
        
        
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        
        lineT.frame = CGRectMake(0, text.bottom+20, SCREEN_WIDTH, DistanceForCell);
        [self addStorage:lineT];
        
        CGRect sendViewFrame = CGRectMake(0, lineS.bottom, SCREEN_WIDTH, lineS.bottom-lineT.top);
        */
//        self.sendVPosition = sendViewFrame;
        self.photoPosition = photoPosition;
        self.discoverVHeight = [self suggestHeightWithBottomMargin:0];
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
