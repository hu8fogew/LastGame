//
//  ResumeScanCellLayout.m
//  QiPinTong
//
//  Created by taylor on 2017/3/21.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ResumeScanCellLayout.h"

@implementation ResumeScanCellLayout
-(id)copyWithZone:(NSZone *)zone{
    ResumeScanCellLayout *one = [[ResumeScanCellLayout alloc]init];
    one.resumeScanCellH = self.resumeScanCellH;
    
    return one;
}

-(id)initWithResumeScanCell{
    self = [super init];
    if (self) {
        //图像
        LWImageStorage *imgView = [[LWImageStorage alloc]init];
        imgView.contents = [UIImage imageNamed:@"zwListImage.jpg"];
        imgView.frame = CGRectMake(leftToMargin, topToMargin+5, SCREEN_WIDTH*0.18, SCREEN_WIDTH*0.18);
        imgView.cornerRadius = SCREEN_WIDTH*0.18/2;
        [self addStorage:imgView];
        
        //姓名
        LWTextStorage *name = [self createLabelWithFrame:CGRectMake(imgView.right+10, imgView.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        name.text = @"张晨斌";
        
        //性别
        LWImageStorage *sexImg = [[LWImageStorage alloc]init];
        sexImg.contents = [UIImage imageNamed:@"femaleIcon"];
        sexImg.frame = CGRectMake(name.right+5, name.top+1, MTitleSize, MTitleSize);
        [self addStorage:sexImg];
        
        //求职状态
        LWTextStorage *jobStatus = [self createLabelWithFrame:CGRectMake(name.left, name.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        jobStatus.text = @"求职状态 :";
        LWTextStorage *jobS = [self createLabelWithFrame:CGRectMake(jobStatus.right+3, jobStatus.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:blueC andFont:MTitleSize];
        jobS.text = @"离职-随时到岗";
        
        //学历
        LWImageStorage *academicIcon = [[LWImageStorage alloc]init];
        academicIcon.contents = [UIImage imageNamed:@"academicIcon"];
        academicIcon.frame = CGRectMake(jobStatus.left, jobStatus.bottom+10, MTitleSize, MTitleSize);
        [self addStorage:academicIcon];
        LWTextStorage *academicText = [self createLabelWithFrame:CGRectMake(academicIcon.right+3, academicIcon.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        academicText.text = @"大专";
        
        //经验
        LWImageStorage *experienceIcon = [[LWImageStorage alloc]init];
        experienceIcon.contents = [UIImage imageNamed:@"timeIcon"];
        experienceIcon.frame = CGRectMake(academicText.right+15, academicText.top, MTitleSize, MTitleSize);
        [self addStorage:experienceIcon];
        LWTextStorage *experienceText = [self createLabelWithFrame:CGRectMake(experienceIcon.right+3, experienceIcon.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        experienceText.text = @"3年";
        
        //地址
        LWImageStorage *addressIcon = [[LWImageStorage alloc]init];
        addressIcon.contents = [UIImage imageNamed:@"locationIcon"];
        addressIcon.frame = CGRectMake(experienceText.right+15, experienceText.top, MTitleSize, MTitleSize);
        [self addStorage:addressIcon];
        LWTextStorage *addressText = [self createLabelWithFrame:CGRectMake(addressIcon.right+3, addressIcon.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        addressText.text = @"西安";
        
        LWImageStorage *aLine = [[LWImageStorage alloc]init];
        aLine.contents = [UIImage imageNamed:@"line_icon_image"];
        aLine.frame = CGRectMake(0, imgView.bottom+topToMargin+10, SCREEN_WIDTH, 10);
        [self addStorage:aLine];
        
        ////////////////
        //基本信息
        LWTextStorage *basicText = [self createLabelWithFrame:CGRectMake(leftToMargin, aLine.bottom+topToMargin, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        basicText.text = @"基本信息";
        
        //手机
        LWTextStorage *phone = [self createLabelWithFrame:CGRectMake(basicText.left, basicText.bottom+topToMargin, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        phone.text = @"手机 :";
        LWTextStorage *phoneNum = [self createLabelWithFrame:CGRectMake(phone.right+3, phone.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        phoneNum.text = @"18629045323";
        
        //邮箱
        LWTextStorage *email = [self createLabelWithFrame:CGRectMake(phone.left, phone.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        email.text = @"邮箱 :";
        LWTextStorage *emailText = [self createLabelWithFrame:CGRectMake(email.right+3, email.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        emailText.text = @"314439799@qq.com";
        
        //微信
        LWTextStorage *weixi = [self createLabelWithFrame:CGRectMake(email.left, email.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        weixi.text = @"微信 :";
        LWTextStorage *weixiText = [self createLabelWithFrame:CGRectMake(weixi.right+3, weixi.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        weixiText.text = @"zadsds23385";
        
        //年龄
        LWTextStorage *age = [self createLabelWithFrame:CGRectMake(weixi.left, weixi.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        age.text = @"年龄 :";
        LWTextStorage *ageText = [self createLabelWithFrame:CGRectMake(age.right+3, age.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        ageText.text = @"24岁";
        
        //婚姻状况
        LWTextStorage *mStatus = [self createLabelWithFrame:CGRectMake(age.left, age.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        mStatus.text = @"婚姻状况 :";
        LWTextStorage *mStatusText = [self createLabelWithFrame:CGRectMake(mStatus.right+3, mStatus.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        mStatusText.text = @"未婚";
        
        LWImageStorage *bLine = [[LWImageStorage alloc]init];
        bLine.contents = [UIImage imageNamed:@"line_icon_image"];
        bLine.frame = CGRectMake(0, mStatus.bottom+topToMargin, SCREEN_WIDTH, 10);
        [self addStorage:bLine];
        
        //////////////
        //求职意向
        LWTextStorage *expert = [self createLabelWithFrame:CGRectMake(leftToMargin, bLine.bottom+topToMargin, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        expert.text = @"求职意向";
        LWTextStorage *expertJob = [self createLabelWithFrame:CGRectMake(expert.left, expert.bottom+topToMargin, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:blueC andFont:MTitleSize];
        expertJob.text = @"产品运营经理";
        
        //求职状态
        LWTextStorage *workStatus = [self createLabelWithFrame:CGRectMake(expertJob.left, expertJob.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        workStatus.text = @"求职状态 :";
        LWTextStorage *workSText = [self createLabelWithFrame:CGRectMake(workStatus.right+3, workStatus.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        workSText.text = @"离职-随时到岗";
        
        //期望薪资
        LWTextStorage *salary = [self createLabelWithFrame:CGRectMake(workStatus.left, workStatus.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        salary.text = @"期望薪资 :";
        LWTextStorage *salaryText = [self createLabelWithFrame:CGRectMake(salary.right+3, salary.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        salaryText.text = @"6000";
        
        //工作城市
        LWTextStorage *city = [self createLabelWithFrame:CGRectMake(salary.left, salary.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        city.text = @"工作城市 :";
        LWTextStorage *cityText = [self createLabelWithFrame:CGRectMake(city.right+3, city.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        cityText.text = @"西安";
        
        //工作性质
        LWTextStorage *jobType = [self createLabelWithFrame:CGRectMake(city.left, city.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        jobType.text = @"工作性质 :";
        LWTextStorage *jobTypeText = [self createLabelWithFrame:CGRectMake(jobType.right+3, jobType.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        jobTypeText.text = @"全职";
        
        LWImageStorage *cLine = [[LWImageStorage alloc]init];
        cLine.contents = [UIImage imageNamed:@"line_icon_image"];
        cLine.frame = CGRectMake(0, jobType.bottom+topToMargin, SCREEN_WIDTH, 10);
        [self addStorage:cLine];
        
        ////////////////
        //工作经历
        LWTextStorage *workExper = [self createLabelWithFrame:CGRectMake(leftToMargin, cLine.bottom+topToMargin, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        workExper.text = @"工作经历";
        LWTextStorage *workExperText = [self createLabelWithFrame:CGRectMake(workExper.left, workExper.bottom+topToMargin, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:blueC andFont:MTitleSize];
        workExperText.text = @"产品运营经理 | 北京万维创佳科技有限公司";
        
        //时间
        LWTextStorage *dateText = [self createLabelWithFrame:CGRectMake(workExperText.left, workExperText.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        dateText.text = @"2015年10月-至今";
        
        //工作描述
        LWTextStorage *desc = [self createLabelWithFrame:CGRectMake(dateText.left, dateText.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        desc.text = @"工作描述 :";
        LWTextStorage *descText = [self createLabelWithFrame:CGRectMake(desc.left, desc.bottom+10, SCREEN_WIDTH-leftToMargin-topToMargin, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        descText.text = @"我也根本不信别人的恭维：老饱你很有才华，好好写肯定能发财。我若不能发财你给钱啊？即使是今日头条的万人千元计划，也是有上顿没下顿的，永远不要相信别人的恭维，更不要因为别人恭维就真相信自己能靠写作发财。";
        
        LWImageStorage *dLine = [[LWImageStorage alloc]init];
        dLine.contents = [UIImage imageNamed:@"line_icon_image"];
        dLine.frame = CGRectMake(0, descText.bottom+topToMargin, SCREEN_WIDTH, 10);
        [self addStorage:dLine];
        
        ////////
        //教育经历
        LWTextStorage *study = [self createLabelWithFrame:CGRectMake(leftToMargin, dLine.bottom+topToMargin, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andFont:MTitleSize];
        study.text = @"教育经历";
        
        //专业
        LWTextStorage *majorText = [self createLabelWithFrame:CGRectMake(study.left, study.bottom+topToMargin, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:blueC andFont:MTitleSize];
        majorText.text = @"软件工程 | 西安文理学院";
        
        //年限
        LWTextStorage *timeText = [self createLabelWithFrame:CGRectMake(majorText.left, majorText.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andFont:MTitleSize];
        timeText.text = @"2012年03月 至 2015年09月  大专";
        
        LWImageStorage *eLine = [[LWImageStorage alloc]init];
        eLine.contents = [UIImage imageNamed:@"whiteView"];
        eLine.frame = CGRectMake(0, timeText.bottom+topToMargin, SCREEN_WIDTH, 10);
        [self addStorage:eLine];
        
        self.resumeScanCellH = [self suggestHeightWithBottomMargin:0];
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
