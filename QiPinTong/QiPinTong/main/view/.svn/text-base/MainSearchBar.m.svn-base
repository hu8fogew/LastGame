//
//  MainSearchBar.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "MainSearchBar.h"

@implementation MainSearchBar

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.font = [UIFont systemFontOfSize:15];
        self.placeholder = @"请输入搜索条件";
        self.background = [UIImage imageNamed:@""];
        
        //通过init来创建初始化绝大部分控件，控件都是没有尺寸
        UIImageView *searchIcon = [[UIImageView alloc]init];
        searchIcon.image = [UIImage imageNamed:@""];
        searchIcon.width = 30;
        searchIcon.height = 30;
        searchIcon.contentMode = UIViewContentModeCenter;
        self.leftView = searchIcon;
        self.leftViewMode = UITextFieldViewModeAlways;
        
    }
    
    return self;
}

+(instancetype)searchBar
{
    
    return [[self alloc]init];
    
}

@end
