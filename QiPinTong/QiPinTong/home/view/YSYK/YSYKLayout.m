//
//  YSYKLayout.m
//  QiPinTong
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "YSYKLayout.h"

@implementation YSYKLayout


-(id)copyWithZone:(NSZone *)zone
{
    YSYKLayout *one = [[YSYKLayout alloc]init];
    one.listViewHeight = self.listViewHeight;
    one.buyButton = self.buyButton;
    one.taxiFrame = self.taxiFrame;
    one.telephoneFrame = self.telephoneFrame;
    one.getMoneyFrame = self.getMoneyFrame;
    one.businessCellHeight = self.businessCellHeight;
    one.businessActionCellHeight = self.businessActionCellHeight;
    one.detailActionHeight = self.detailActionHeight;
    one.photoPosition = self.photoPosition;
    one.enterFrame = self.enterFrame;
    return one;
}

//初始化商家详情的list view的详情
-(id)initListViewDetialView
{
    self = [super init];
    if (self) {
        //店铺图片
        LWImageStorage *businessImg = [[LWImageStorage alloc]init];
        
        businessImg.contents = [NSURL URLWithString:@"http://mob.qipintong.com/assets/js/kindeditor/attached/image/20161114/20161114150030_0003.png"];
        businessImg.placeholder = [UIImage imageNamed:@"Qpt_icon"];
        
        businessImg.frame = CGRectMake(10, 15, SCREEN_WIDTH/5.3, SCREEN_WIDTH/5.3);
        
        [self addStorage:businessImg];
        
        //店铺名称
        LWTextStorage *businessName = [self createTextWithFrame:CGRectMake(businessImg.right+10, businessImg.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:MTitleSize];
        
        businessName.text = @"法西米娅浪漫的味道（逸翠园店）";
        
        
        //店铺类型
        
        LWTextStorage *businessKind = [self createTextWithFrame:CGRectMake(businessName.left, businessImg.top+businessImg.height/2-8, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        businessKind.text = @"西餐";
        
        //店铺
        
        LWTextStorage *businessHelp = [self createTextWithFrame:CGRectMake(businessKind.right+10, businessKind.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        
        businessHelp.text = @"自助餐厅";
        
        //地址
        LWTextStorage *businessMap = [self createTextWithFrame:CGRectMake(businessName.left, businessImg.bottom-16, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        
        businessMap.text = @"唐延南路";
        
        LWImageStorage *mapImg = [[LWImageStorage alloc]init];
        
        mapImg.contents = [UIImage imageNamed:@"locationIcon"];
        
        mapImg.frame = CGRectMake(SCREEN_WIDTH/2-20, businessMap.top, 15, 15);
        
        [self addStorage:mapImg];
        
        
        //距离
        LWTextStorage *formKilo = [self createTextWithFrame:CGRectMake(mapImg.right+5, businessMap.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        
        formKilo.text = @"3.5km";
        
        
        
        NSString *str = @"2345";
        
        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:subTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        //人气量
        LWTextStorage *businessNumber = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-size.width-10, businessMap.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        
        businessNumber.text = str;
        
        
        LWImageStorage *eyeImg = [[LWImageStorage alloc]init];
        
        eyeImg.contents = [UIImage imageNamed:@"eyeIcon"];
        
        eyeImg.frame = CGRectMake(SCREEN_WIDTH-size.width-10-20, mapImg.top, 15, 15);
        [self addStorage:eyeImg];
        
        //线
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.frame = CGRectMake(0, businessImg.bottom+15, SCREEN_WIDTH, 6.0f);
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        
        [self addStorage:lineF];
        
        
        //代金券领取
        
        LWImageStorage *djqImage = [[LWImageStorage alloc]init];
        
        djqImage.frame = CGRectMake(businessImg.left, lineF.bottom + 15, 17, 17);
        
        djqImage.contents = [UIImage imageNamed:@"huiIcon"];
        
        [self addStorage:djqImage];
        
        //
        LWTextStorage *djqText = [self createTextWithFrame:CGRectMake(djqImage.right+5, djqImage.top+1.5, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        djqText.text = @"代金券";
        
        
        LWTextStorage *detialF = [self createTextWithFrame:CGRectMake(djqText.left, djqText.bottom+15, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:subTitleSize];
        detialF.text = @"30元代金券，满100元可用";
        
        //领取按钮位置
        CGRect getButtonFrame = CGRectMake(SCREEN_WIDTH-75, detialF.top-5, 65, detialF.height+10);
        
        
        
        //线
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.frame = CGRectMake(0, detialF.bottom+20, SCREEN_WIDTH, 1.0f);
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        
        [self addStorage:lineS];
        
        
        //买单
        LWImageStorage *buyImage = [[LWImageStorage alloc]init];
        buyImage.contents = [UIImage imageNamed:@"huiIcon"];
        
        buyImage.frame = CGRectMake(djqImage.left, lineS.bottom+15, 17, 17);
        [self addStorage:buyImage];
        
        
        LWTextStorage *buyText = [self createTextWithFrame:CGRectMake(djqText.left, buyImage.top+1.5, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        
        buyText.text = @"去买单";
        
        //支付按钮
        CGRect buyButtonFrame = CGRectMake(getButtonFrame.origin.x, buyText.top-5, getButtonFrame.size.width, getButtonFrame.size.height);
        
        
        //线
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.frame = CGRectMake(0, buyText.bottom+20, SCREEN_WIDTH, lineF.height);
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        
        [self addStorage:lineT];
        
        
        //地图
        LWImageStorage *mapBusiness = [[LWImageStorage alloc]init];
        
        mapBusiness.contents = [UIImage imageNamed:@"deepMap_icon"];
        mapBusiness.frame = CGRectMake(businessImg.left, lineT.bottom+15, 20, 20);
        [self addStorage:mapBusiness];
        
        LWTextStorage *mapBusinessText = [self createTextWithFrame:CGRectMake(mapBusiness.right+5, mapBusiness.top+2.0f, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        
        mapBusinessText.text = @"唐延南路逸翠园i都会";
        
        //出租车
        CGRect taxiButtonFrame = CGRectMake(SCREEN_WIDTH-115, mapBusiness.top-3, 26, 26);
        
        
//        line
        LWImageStorage *lineFo = [[LWImageStorage alloc]init];
        lineFo.frame = CGRectMake(SCREEN_WIDTH - 75, mapBusiness.top-3, 1.0f, mapBusiness.height+6);
//        lineFo.contents = [UIImage imageNamed:@""];
        lineFo.backgroundColor = grayC;
        
        [self addStorage:lineFo];
        
        //电话
        CGRect telephonebuttonFrame = CGRectMake(SCREEN_WIDTH-54, taxiButtonFrame.origin.y+1, taxiButtonFrame.size.width-2, taxiButtonFrame.size.height-2);
        
        //线
        LWImageStorage *lineFv = [[LWImageStorage alloc]init];
        lineFv.frame = CGRectMake(0, mapBusiness.bottom+20, SCREEN_WIDTH, lineF.height*2);
        lineFv.contents = [UIImage imageNamed:@"line_icon_image"];
        
        [self addStorage:lineFv];
        
//        店铺环境
        
        LWImageStorage *dpImage = [[LWImageStorage alloc]init];
        dpImage.frame = CGRectMake(mapBusiness.left, lineFv.bottom+15, mapBusiness.width, mapBusiness.height);
        
        dpImage.contents = [UIImage imageNamed:@"dpImage_icon"];
        
        [self addStorage:dpImage];
        
        LWTextStorage *dpText = [self createTextWithFrame:CGRectMake(mapBusinessText.left, dpImage.top+3.0f, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        dpText.text = @"店铺环境";
        self.buyButton = buyButtonFrame;//支付
        self.getMoneyFrame = getButtonFrame;//领取代金券
        self.telephoneFrame = telephonebuttonFrame;//电话
        self.taxiFrame = taxiButtonFrame;//导航
        self.listViewHeight = [self suggestHeightWithBottomMargin:0];
    }
    return self;
}


-(id)initYsykListCell
{
    self = [super init];
    if (self) {
        //店铺图片
        LWImageStorage *businessImg = [[LWImageStorage alloc]init];
        
        businessImg.contents = [NSURL URLWithString:@"http://mob.qipintong.com/assets/js/kindeditor/attached/image/20161114/20161114150030_0003.png"];
        businessImg.placeholder = [UIImage imageNamed:@"Qpt_icon"];
        
        businessImg.frame = CGRectMake(10, 15, SCREEN_WIDTH/5.3, SCREEN_WIDTH/5.3);
        
        [self addStorage:businessImg];
        
        //店铺名称
        LWTextStorage *businessName = [self createTextWithFrame:CGRectMake(businessImg.right+10, businessImg.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:MTitleSize];
        
        businessName.text = @"法西米娅浪漫的味道（逸翠园店）";
        
        
        //店铺类型
        
        LWTextStorage *businessKind = [self createTextWithFrame:CGRectMake(businessName.left, businessImg.top+businessImg.height/2-8, CGFLOAT_MAX, 16) andTextColor:deepGrayColor andTextFont:subTitleSize];
        businessKind.text = @"西餐";
        
        //店铺
        
        LWTextStorage *businessHelp = [self createTextWithFrame:CGRectMake(businessKind.right+10, businessKind.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        
        businessHelp.text = @"自助餐厅";
        
        //地址
        LWTextStorage *businessMap = [self createTextWithFrame:CGRectMake(businessName.left, businessImg.bottom-16, CGFLOAT_MAX, 16) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        
        businessMap.text = @"唐延南路";
        
        LWImageStorage *mapImg = [[LWImageStorage alloc]init];
        
        mapImg.contents = [UIImage imageNamed:@"map_oragin_icon"];
        
        mapImg.frame = CGRectMake(SCREEN_WIDTH/2-20, businessMap.top+2, 15, 15);
        
        [self addStorage:mapImg];
        
        
        //距离
        LWTextStorage *formKilo = [self createTextWithFrame:CGRectMake(mapImg.right+5, businessMap.top+3, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:orangeC andTextFont:subTitleSize];
        
        formKilo.text = @"3.5km";
        
        
        
        NSString *str = @"2345";
        
        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:subTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        //人气量
        LWTextStorage *businessNumber = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-size.width-10, businessMap.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        
        businessNumber.text = str;
        
        
        LWImageStorage *eyeImg = [[LWImageStorage alloc]init];
        
        eyeImg.contents = [UIImage imageNamed:@"eyeIcon"];
        
        eyeImg.frame = CGRectMake(SCREEN_WIDTH-size.width-10-20, mapImg.top, 15, 15);
        [self addStorage:eyeImg];
        
        
        //线
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.frame = CGRectMake(0, businessImg.bottom+10, SCREEN_WIDTH, 6.0f);
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        
        [self addStorage:lineF];
        
        self.businessCellHeight = [self suggestHeightWithBottomMargin:0];
        
    }
    return self;
}



-(id)initBusinessAcion
{
    self = [super init];
    if (self) {
        
        
        //线
        LWImageStorage *lineFv = [[LWImageStorage alloc]init];
        lineFv.frame = CGRectMake(0, 20, SCREEN_WIDTH, 8);
        lineFv.contents = [UIImage imageNamed:@"line_icon_image"];
        
        [self addStorage:lineFv];
        
        //        店铺环境
        
        LWImageStorage *dpImage = [[LWImageStorage alloc]init];
        dpImage.frame = CGRectMake(10, lineFv.bottom+15, 20, 20);
        
        dpImage.contents = [UIImage imageNamed:@"dpImage_icon"];
        
        [self addStorage:dpImage];
        
        LWTextStorage *dpText = [self createTextWithFrame:CGRectMake(dpImage.right+5, dpImage.top+3.0f, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        dpText.text = @"商家活动";
        
        NSString *mStr = @"仅售14.85元！价值16.5元的香辣鸡腿一份全场通用，可叠加使用，提供免费Wi-Fi。";
        LWTextStorage *mStorge = [self createTextWithFrame:CGRectMake(dpImage.left, dpImage.bottom, SCREEN_WIDTH-85, CGFLOAT_MAX) andTextColor:MainColor andTextFont:MTitleSize];
        mStorge.text = mStr;
        [self removeStorage:mStorge];
        
        NSString *dateStr = @"阅读量";
        
        
        CGSize subSize = [dateStr sizeWithFont:[UIFont systemFontOfSize:subTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        
        
        
        
        LWImageStorage *businessAction = [[LWImageStorage alloc]init];
        
//        businessAction.contents = nil;
        businessAction.placeholder = [UIImage imageNamed:@"Qpt_icon"];
        
        businessAction.frame = CGRectMake(leftToMargin, dpImage.bottom+15, mStorge.height+subSize.height, mStorge.height+subSize.height);
        
        [self addStorage:businessAction];
        
        LWTextStorage *detailText = [self createTextWithFrame:CGRectMake(businessAction.right+8, businessAction.top, SCREEN_WIDTH-businessAction.right-8-10, CGFLOAT_MAX) andTextColor:MainColor andTextFont:MTitleSize];
        detailText.linespacing = 6.0f;
        detailText.text = mStr;
        //时间
        LWTextStorage *dateText = [self createTextWithFrame:CGRectMake(detailText.left, businessAction.bottom-15, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        dateText.text = @"2017-5-26";
        
        //阅读量
        LWTextStorage *seeNum = [self createTextWithFrame:CGRectMake(dateText.right+15, dateText.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        
        seeNum.text = @"阅读量 777";
        
        self.businessActionCellHeight = [self suggestHeightWithBottomMargin:15];
        
        
        
    }
    
    return self;
}


-(id)initDetailAction
{
    self = [super init];
    if (self) {
        
        //店铺图片
        LWImageStorage *businessImg = [[LWImageStorage alloc]init];
        
        businessImg.contents = [NSURL URLWithString:@"http://mob.qipintong.com/assets/js/kindeditor/attached/image/20161114/20161114150030_0003.png"];
        businessImg.placeholder = [UIImage imageNamed:@"Qpt_icon"];
        
        businessImg.frame = CGRectMake(10, 15, SCREEN_WIDTH/5.3, SCREEN_WIDTH/5.3);
        
        [self addStorage:businessImg];
        
        //店铺名称
        LWTextStorage *businessName = [self createTextWithFrame:CGRectMake(businessImg.right+10, businessImg.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:MTitleSize];
        
        businessName.text = @"法西米娅浪漫的味道（逸翠园店）";
        
        
        //店铺类型
        
        LWTextStorage *businessKind = [self createTextWithFrame:CGRectMake(businessName.left, businessImg.top+businessImg.height/2-8, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        businessKind.text = @"西餐";
        
        //店铺
        
        LWTextStorage *businessHelp = [self createTextWithFrame:CGRectMake(businessKind.right+10, businessKind.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:subTitleSize];
        
        businessHelp.text = @"自助餐厅";
        
        //地址
        LWTextStorage *businessMap = [self createTextWithFrame:CGRectMake(businessName.left, businessImg.bottom-16, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        
        businessMap.text = @"唐延南路";
        
        LWImageStorage *mapImg = [[LWImageStorage alloc]init];
        
        mapImg.contents = [UIImage imageNamed:@"locationIcon"];
        
        mapImg.frame = CGRectMake(SCREEN_WIDTH/2-20, businessMap.top, 15, 15);
        
        [self addStorage:mapImg];
        
        
        //距离
        LWTextStorage *formKilo = [self createTextWithFrame:CGRectMake(mapImg.right+5, businessMap.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        
        formKilo.text = @"3.5km";
        
        
        
        NSString *str = @"2345";
        
        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:subTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        //人气量
        LWTextStorage *businessNumber = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-size.width-10, businessMap.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        
        businessNumber.text = str;
        
        
        LWImageStorage *eyeImg = [[LWImageStorage alloc]init];
        
        eyeImg.contents = [UIImage imageNamed:@"eyeIcon"];
        
        eyeImg.frame = CGRectMake(SCREEN_WIDTH-size.width-10-20, mapImg.top, 15, 15);
        [self addStorage:eyeImg];
        
        //线
        LWImageStorage *lineF = [[LWImageStorage alloc]init];
        lineF.frame = CGRectMake(0, businessImg.bottom+15, SCREEN_WIDTH, 6.0f);
        lineF.contents = [UIImage imageNamed:@"line_icon_image"];
        
        [self addStorage:lineF];
        
        LWTextStorage *descText =[self createTextWithFrame:CGRectMake(businessImg.left, lineF.bottom+20, SCREEN_WIDTH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:MTitleSize];
        
        descText.text = @"仅售118元！价值154元的海鲜大咖特惠118元，建议3～4人用餐，提供免费Wi-Fi";
        LWTextStorage *dateText =[ self createTextWithFrame:CGRectMake(descText.left, descText.bottom+10, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        dateText.text = @"2017-5-26";
        
        //阅读量
        LWTextStorage *readNum = [self createTextWithFrame:CGRectMake(dateText.right+20, dateText.top, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:subTitleSize];
        readNum.text = @"阅读量 888";
        
        //线
        LWImageStorage *lineS = [[LWImageStorage alloc]init];
        lineS.frame = CGRectMake(0, dateText.bottom+15, SCREEN_WIDTH, 1.0f);
        lineS.contents = [UIImage imageNamed:@"line_icon_image"];
        
        [self addStorage:lineS];
        
        
        
        
        //图片
        NSArray *arr = @[@"http://ww2.sinaimg.cn/mw690/60718250jw1f2jg46smtmj20go0go77r.jpg"];
        
        self.imageArr = arr;
        
        CGFloat imageWidth = (SCREEN_WIDTH -30.0f)/3.0f;
        NSInteger imageCount = arr.count;
        
        
        NSMutableArray *imageArray = [[NSMutableArray alloc]initWithCapacity:imageCount];
        
        NSMutableArray *positionArray = [[NSMutableArray alloc]initWithCapacity:imageCount];
        
        //图片类型
        NSInteger row = 0;
        NSInteger column = 0;
        if (imageCount == 1) {
            
            CGRect imageRect = CGRectMake(SCREEN_WIDTH/2-imageWidth, lineS.bottom+20.0f, imageWidth*2.0f, imageWidth*2.0f);
            
            NSString *imagePositionString = NSStringFromCGRect(imageRect);
            [positionArray addObject:imagePositionString];
            
            LWImageStorage *imageStorge = [[LWImageStorage alloc]initWithIdentifier:@"photo"];
            imageStorge.tag = 0;
            imageStorge.clipsToBounds = YES;
            imageStorge.contentMode = UIViewContentModeScaleAspectFill;
            
            imageStorge.frame = imageRect;
            
            imageStorge.backgroundColor = clearC;
            
            NSString *urlString = [arr objectAtIndex:0];
            
            imageStorge.contents = [NSURL URLWithString:urlString];
            
            [imageArray addObject:imageStorge];
        }
        
        [self addStorages:imageArray];
        
        self.photoPosition = positionArray;
        
        
        
        
        //文字描述
        
        LWImageStorage *img = [imageArray lastObject];
        
        
        LWTextStorage *detailText = [self createTextWithFrame:CGRectMake(leftToMargin, img.bottom+15, SCREEN_WIDTH-leftToMargin, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:MTitleSize];
        
        detailText.text = @"        美团网总裁王慧文表示，美团的排序是根据团购预付费的商业模式研究出来的，“在预付费模式中，消费者把钱打到团购网站的账户里事，他并未看到实物，也没有接收到服务，消费者事最先产生成本的，他的风险最大，商家的风险是只有消费者把钱打到我们的账号并消费后，商家才有成本产生。“\n        我们就是把风险最大的人放在最上面保护好，风险最小。";
        
        
        //线
        LWImageStorage *lineT = [[LWImageStorage alloc]init];
        lineT.frame = CGRectMake(0, detailText.bottom+15, SCREEN_WIDTH, 1.0f);
        lineT.contents = [UIImage imageNamed:@"line_icon_image"];
        
        [self addStorage:lineT];
        
        //进入主页
        LWTextStorage *lastText = [self createTextWithFrame:CGRectMake(leftToMargin+5, lineT.bottom+15, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:deepGrayColor andTextFont:MTitleSize];
        lastText.text = @"进入主页";
        
        LWImageStorage *rightImg = [[LWImageStorage alloc]init];
        rightImg.contents = [UIImage imageNamed:@"right_back_icon"];
        
        rightImg.frame = CGRectMake(lastText.right+2, lastText.top, lastText.height/2, lastText.height);
        
        [self addStorage:rightImg];
        
        CGRect enterButtonFrame = CGRectMake(leftToMargin, lastText.top, lastText.width+rightImg.width, lastText.height);
        
        self.enterFrame = enterButtonFrame;
        
        self.detailActionHeight = [self suggestHeightWithBottomMargin:15];
        
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

-(LWImageStorage *)createImage
{
    LWImageStorage *image = [[LWImageStorage alloc]init];
    
    [self addStorage:image];
    
    return image;
}


@end
