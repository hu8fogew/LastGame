//
//  StringSizeManager.m
//  QiPinTong
//
//  Created by mac on 2017/1/7.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "StringSizeManager.h"

@interface StringSizeManager()

@property(nonatomic,copy) NSString *iphoneKind;

//7、6、6s
@property(nonatomic,assign) BOOL iphone76;
//7plus、6s plus、6 plus
@property(nonatomic,assign) BOOL iphone76Plus;
//5
@property(nonatomic,assign) BOOL ipone5;

@end

@implementation StringSizeManager

+(id)shareStringManager
{
    static StringSizeManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[StringSizeManager alloc]init];
    });
    return manager;
}

//当前的手机款式
/*iphone5、iphone5s、iphone6等*/
-(NSString *)iphoneKind
{
    if (!_iphoneKind) {
        _iphoneKind = [UIDevice devicePlatForm];
    }
    return _iphoneKind;
}

-(BOOL)ipone5
{
    if (!_ipone5) {
        if (([self.iphoneKind isEqualToString:@"iPhone 5"] || [self.iphoneKind isEqualToString:@"iPhone 5s"]) || ([self.iphoneKind isEqualToString:@"iPhone 5c"] || [self.iphoneKind isEqualToString:@"iPhone SE"])) {
            _ipone5 = YES;
        }else
        {
            _ipone5 = NO;
        }
        
    }
    return _ipone5;
}

-(BOOL)iphone76
{
    if (!_iphone76) {
        
        if (([self.iphoneKind isEqualToString:@"iPhone 7"] || [self.iphoneKind isEqualToString:@"iPhone 6"]) || ([self.iphoneKind isEqualToString:@"iPhone 6s"])) {
            _iphone76 = YES;
        }else
        {
            _iphone76 = NO;
        }
    }
    return _iphone76;
}


-(BOOL)iphone76Plus
{
    if (!_iphone76Plus) {
        if (([self.iphoneKind isEqualToString:@"iPhone 7 plus"] || [self.iphoneKind isEqualToString:@"iPhone 6 plus"]) || ([self.iphoneKind isEqualToString:@"iPhone 6s plus"])) {
            _iphone76Plus = YES;
        }else
        {
            _iphone76Plus = NO;
        }
    }
    return _iphone76Plus;
}



//设置当前的主标题大小

-(CGFloat)mTitleSize
{
    CGFloat a = 16.0f;
    if (self.ipone5) {
        a= 15.0f;
    }
    if (self.iphone76) {
        a = 16.0f;
    }
    if (self.iphone76Plus) {
        a = 17.0f;
    }
    return a;
}
//设置副标题的大小
-(CGFloat)suTitleSize
{
    CGFloat a = 14.0f;
    if (self.ipone5) {
        a= 13.0f;
    }
    if (self.iphone76) {
        a = 14.0f;
    }
    if (self.iphone76Plus) {
        a = 15.0f;
    }
    return a;
    
}

//搜索框高度
-(CGFloat)searchBarSize
{
    CGFloat a = 14.0f;
    if (self.ipone5) {
        a= 13.0f;
    }
    if (self.iphone76) {
        a = 14.0f;
    }
    if (self.iphone76Plus) {
        a = 15.0f;
    }
    return a;
    
}

//轮播高度
-(CGFloat)lunboSize
{
    CGFloat a = 14.0f;
    if (self.ipone5) {
        a= 13.0f;
    }
    if (self.iphone76) {
        a = 14.0f;
    }
    if (self.iphone76Plus) {
        a = 15.0f;
    }
    return a;
}

//选择按钮

-(CGFloat)seleButtonSize
{
    CGFloat a = 14.0f;
    if (self.ipone5) {
        a= 13.0f;
    }
    if (self.iphone76) {
        a = 14.0f;
    }
    if (self.iphone76Plus) {
        a = 15.0f;
    }
    return a;
}

//切换按钮的高度
-(CGFloat)segumentSize
{
    CGFloat a = 14.0f;
    if (self.ipone5) {
        a= 13.0f;
    }
    if (self.iphone76) {
        a = 14.0f;
    }
    if (self.iphone76Plus) {
        a = 15.0f;
    }
    return a;
}

@end
