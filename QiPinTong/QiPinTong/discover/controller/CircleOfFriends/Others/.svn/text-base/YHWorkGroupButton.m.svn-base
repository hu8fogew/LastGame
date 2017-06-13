//
//  YHWorkGroupButton.m
//  HKP
//  CSDN:  http://blog.csdn.net/samuelandkevin
//  Created by kun on 16/5/14.
//  Copyright © 2016年 HKP. All rights reserved.
//

#import "YHWorkGroupButton.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
static CGFloat const imgW = 30;
static CGFloat const imgH = 20;
static CGFloat const margin = 0; //图片与文字的间距
static CGFloat const labelH = 15;

@interface YHWorkGroupButton()


@end

@implementation YHWorkGroupButton



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        CGFloat font = 14.0f;
        
        self.imageView.contentMode = UIViewContentModeScaleAspectFit;
        self.titleLabel.textAlignment = NSTextAlignmentLeft;
        
        [self setTitleColor:RGBCOLOR(151, 161, 173) forState:UIControlStateNormal];
        [self setTitleColor:RGBCOLOR(204, 103, 72) forState:UIControlStateSelected];
        
        [self.titleLabel setTintColor:[UIColor colorWithRed:122/255.0 green:122/255.0 blue:122/255.0 alpha:1.0]];
        [self.titleLabel setFont:[UIFont boldSystemFontOfSize:font]];
        self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    }
    return self;
}

//1.重写方法,改变图片的位置,在titleRect..方法后执行
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    
    CGFloat imageX  = self.bounds.size.width*0.2;
    CGFloat imageY  = self.center.y - imgH/2;
    CGFloat width   = imgW;
    CGFloat height  = imgH;
    return CGRectMake(imageX, imageY, width, height);
    
}

//2.改变title文字的位置,构造title的矩形即可
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    
    CGFloat titleX = CGRectGetMaxX(self.imageView.frame) + margin;
    CGFloat titleY = self.center.y - labelH/2;
    CGFloat width  = self.frame.size.width - titleX;
    CGFloat height = labelH;
    return CGRectMake(titleX, titleY, width, height);
    
}

- (void)setHighlighted:(BOOL)highlighted{

}



@end
