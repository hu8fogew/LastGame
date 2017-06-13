//
//  MessageLayout.m
//  QiPinTong
//
//  Created by mac on 2017/1/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "MessageLayout.h"

@implementation MessageLayout

-(id)copyWithZone:(NSZone *)zone
{
    MessageLayout *one = [[MessageLayout alloc]init];
    one.messageCellHeight = self.messageCellHeight;
    one.ownMessageHeight = self.ownMessageHeight;
    one.otherMessageHeight = self.otherMessageHeight;
    return one;
}


-(id)initMessageCell
{
    self = [super init];
    if (self) {
        
        //头像
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.cornerBorderColor = grayC;
        image.cornerBorderWidth = 1.0f;
        image.cornerBackgroundColor = whiteC;
        image.frame = CGRectMake(leftToMargin, topToMargin, SCREEN_WIDTH*0.13, SCREEN_WIDTH*0.13);
        image.contents = [UIImage imageNamed:@"zwListImage.jpg"];
        //name
        LWTextStorage *name = [self createTextWithFrame:CGRectMake(image.right+leftToMargin, image.top+5, CGFLOAT_MAX, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        name.text = @"香格里拉郎";
        
        //时间
        NSString *strTime = @"11:59";
        CGSize timeSize = [strTime sizeWithFont:[UIFont systemFontOfSize:mainTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *timeText = [self createTextWithFrame:CGRectMake(SCREEN_WIDTH-timeSize.width-10, name.top, timeSize.width, timeSize.height) andTextColor:SecondTitleColor andTextFont:mainTitleSize];
        timeText.text = strTime;
        
        
        //消息内容
        LWTextStorage *descDetial = [self createTextWithFrame:CGRectMake(name.left, image.bottom-descTitleSize-5, SCREEN_WIDTH-name.left-20-timeSize.width, CGFLOAT_MAX) andTextColor:SecondTitleColor andTextFont:mainTitleSize-1];
        
        descDetial.text = @"哈喽，大家好，我是卢本伟。很荣幸能给大家带来欢笑，希望大家用热烈的掌声欢迎ppd小童鞋给大家唱歌。";
        descDetial.maxNumberOfLines = 1;
        descDetial.lineBreakMode = NSLineBreakByTruncatingTail;
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        line.frame = CGRectMake(0, image.bottom+topToMargin, SCREEN_WIDTH, 1);
        [self addStorage:line];
        [self addStorage:image];
        self.messageCellHeight = [self suggestHeightWithBottomMargin:0];
        
    }
    return self;
}


//他人的消息

-(id)initOtherMessageCell
{
    self = [super init];
    if (self) {
        
        //头像
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.cornerBorderColor = HWColor(242, 242, 242);
        image.cornerBorderWidth = 1.0f;
        image.cornerBackgroundColor = whiteC;
        image.frame = CGRectMake(leftToMargin, topToMargin, imageWH-10, imageWH-10);
        image.contents = [UIImage imageNamed:@"mq_image.jpeg"];
        //内容
        LWTextStorage *name = [self createTextWithFrame:CGRectMake(image.right+5, image.top+5, SCREEN_WIDTH-image.right-55, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        name.text = @"你好！你好！你好！你好！你好！你好！你好！你好！你好！你好！你好！你好！你好！你好！";
        [self addStorage:image];
        self.otherMessageHeight = [self suggestHeightWithBottomMargin:0];
        
    }
    return self;
}

//我的消息
-(id)initOwnMessageCell
{
    self = [super init];
    if (self) {
        
        //头像
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.cornerBorderColor = HWColor(242, 242, 242);
        image.cornerBorderWidth = 1.0f;
        image.cornerBackgroundColor = whiteC;
        image.frame = CGRectMake(SCREEN_WIDTH-imageWH, topToMargin, imageWH-10, imageWH-10);
        image.contents = [UIImage imageNamed:@"mq_image.jpeg"];
        //内容
        
        NSString *str = @"很好！很好！很好！很好！很好！很好！很好！很好！很好！很好！很好！很好！很好！你很好好！";
        
//        CGSize strSize = [str sizeWithFont:[UIFont systemFontOfSize:mainTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        LWTextStorage *name = [self createTextWithFrame:CGRectMake(imageWH+20, image.top+3, SCREEN_WIDTH-2*imageWH-20, CGFLOAT_MAX) andTextColor:MainColor andTextFont:mainTitleSize];
        name.text = str;
        [self addStorage:image];
        self.ownMessageHeight = [self suggestHeightWithBottomMargin:0];
        
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
