//
//  ComentLayout.m
//  家长界
//
//  Created by mac on 2016/12/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ComentLayout.h"

@implementation ComentLayout



-(id)copyWithZone:(NSZone *)zone
{
    ComentLayout *one = [[ComentLayout alloc]init];
    one.commentHeight = self.commentHeight;
    return one;
}

-(id)initCommentCell
{
    self = [super init];
    if (self) {
        
        //头像
        LWImageStorage *image = [[LWImageStorage alloc]init];
        image.frame = CGRectMake(leftToMargin, topToMargin, imageWH, imageWH);
//        image.cornerRadius = imageWH/2;
        image.cornerBackgroundColor = [UIColor whiteColor];
        image.backgroundColor = [UIColor whiteColor];
        image.cornerBorderWidth = 1.5f;
        image.cornerBorderColor = HWColor(222, 222, 222);
        image.contents = nil;
        image.placeholder = [UIImage imageNamed:@"zwListImage.jpg"];
        [self addStorage:image];
        
        //用户名
        LWTextStorage *name = [self createTextWithTextColor:MainColor andTextFont:CommentNameFont andFrame:CGRectMake(image.right + 5, image.top+2, CGFLOAT_MAX, CGFLOAT_MAX)];
        name.text = @"企聘通成员";
        
        
        
        //日期
        LWTextStorage *date = [self createTextWithTextColor:SecondTitleColor andTextFont:dateFont andFrame:CGRectMake(name.left, name.bottom+3, CGFLOAT_MAX, CGFLOAT_MAX)];
        date.text = @"2016-08-29 11:30";
        //评论
        NSInteger num = 5;
        NSString *strNum = [NSString stringWithFormat:@"打赏%zd个通币",num];
        
        CGSize size = [strNum sizeWithFont:[UIFont systemFontOfSize:subTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        
        LWTextStorage *comment = [self createTextWithTextColor:SecondTitleColor andTextFont:[UIFont systemFontOfSize:subTitleSize] andFrame:CGRectMake(SCREEN_WIDTH-size.width-10, image.top, size.width, size.height)];
        comment.text = strNum;
        
        LWImageStorage *line = [[LWImageStorage alloc]init];
        line.contents = [UIImage imageNamed:@"line_icon_image"];
        
        line.frame = CGRectMake(0, image.bottom+10.0f, SCREEN_WIDTH, 1.0f);
        [self addStorage:line];
        
        
        self.commentHeight = [self suggestHeightWithBottomMargin:0.0f];
        
        
    }
    return self;
}

-(LWTextStorage *)createTextWithTextColor:(UIColor *)color andTextFont:(UIFont *)size andFrame:(CGRect)rect
{
    LWTextStorage *text = [[LWTextStorage alloc]init];
    text.textColor = color;
    text.font = size;
    text.frame = rect;
    text.linespacing = 7.0f;
    [self addStorage:text];
    return text;
}

@end
