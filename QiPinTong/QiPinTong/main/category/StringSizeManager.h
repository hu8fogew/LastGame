//
//  StringSizeManager.h
//  QiPinTong
//
//  Created by mac on 2017/1/7.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringSizeManager : NSObject

//主标题高度
@property(nonatomic,assign,readonly) CGFloat mTitleSize;

//副标题高度
@property(nonatomic,assign,readonly) CGFloat suTitleSize;

//搜索框高度
@property(nonatomic,assign,readonly) CGFloat searchBarSize;

//轮播图高度
@property(nonatomic,assign,readonly) CGFloat lunboSize;

//选择按钮高度
@property(nonatomic,assign,readonly) CGFloat seleButtonSize;

//切换按钮高度
@property(nonatomic,assign,readonly) CGFloat segumentSize;

//初始化方法;
+(id)shareStringManager;

@end
