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
        image.cornerRadius = imageWH/2;
        image.cornerBackgroundColor = [UIColor whiteColor];
        image.backgroundColor = [UIColor whiteColor];
        image.cornerBorderWidth = 1.5f;
        image.cornerBorderColor = HWColor(222, 222, 222);
        image.contents = [UIImage imageNamed:@"teacherImage"];
        
        //用户名
        LWTextStorage *name = [self createTextWithTextColor:MainColor andTextFont:CommentNameFont andFrame:CGRectMake(image.right + 5, image.top+5, CGFLOAT_MAX, CGFLOAT_MAX)];
        name.text = @"老司机上路";
        
        //日期
        LWTextStorage *date = [self createTextWithTextColor:SecondTitleColor andTextFont:dateFont andFrame:CGRectMake(name.left, name.bottom+3, CGFLOAT_MAX, CGFLOAT_MAX)];
        date.text = @"2016-08-29 11:30";
        //点赞按钮
        
        
        self.enjoyFrame = CGRectMake(SCREEN_WIDTH-50, image.top, 40, 30);
        
        
        //评论
        LWTextStorage *comment = [self createTextWithTextColor:SecondTitleColor andTextFont:MainAnswerFont andFrame:CGRectMake(image.left, image.bottom+5, SCREEN_WIDTH-leftToMargin*2, CGFLOAT_MAX)];
        comment.text = @"这个老师讲的好，对于问题的分析非常的透彻，一下子让人们的眉头轻松了许多，对于孩子的教育方式、以及教育习惯有了眉目，很感谢老师的讲解，让我能够在教育孩子当中或多这么多的新解。";
        comment.linespacing = 4.0f;
        
        self.commentHeight = [self suggestHeightWithBottomMargin:10.0f];
        [self addStorage:image];
        
    }
    return self;
}


-(LWTextStorage *)createTextWithTextColor:(UIColor *)color andTextFont:(UIFont *)size andFrame:(CGRect)rect
{
    LWTextStorage *text = [[LWTextStorage alloc]init];
    text.textColor = color;
    text.font = size;
    text.frame = rect;
    text.linespacing = 4.0f;
    [self addStorage:text];
    return text;
}

@end
