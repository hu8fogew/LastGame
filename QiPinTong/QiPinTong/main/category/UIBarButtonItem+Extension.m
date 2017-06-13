//
//  UIBarButtonItem+Extension.m
//  黑马微博2期
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)
/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage andTitle:(NSString *)title
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    
    
    if (title) {
        [btn setTitle:title forState:UIControlStateNormal];
        btn.titleLabel.font = [UIFont systemFontOfSize:15];
        [btn setTitleColor:whiteC forState:UIControlStateNormal];
        [btn setTitleColor:MainColor forState:UIControlStateHighlighted];
        
        
    }
    [btn setImageEdgeInsets:UIEdgeInsetsMake(0, -15, 0, 0)];
    [btn setTitleEdgeInsets:UIEdgeInsetsMake(3, -10, 3, 5)];
    
    
    // 设置按钮的尺寸为背景图片的尺寸+文字大小
    btn.width = btn.currentImage.size.width +[title sizeWithFont:btn.titleLabel.font maxSize:CGSizeMake(MAXFLOAT, MAXFLOAT)].width;
    btn.height = btn.currentImage.size.height;
    
    // 设置尺寸
    //    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
