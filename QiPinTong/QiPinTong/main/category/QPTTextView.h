//
//  QPTTextView.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//




#pragma mark - 自定义带有占位文字的UITextView


#import <UIKit/UIKit.h>


@class QPTTextView;


@protocol QPTTextViewDelegate <NSObject>

@optional

- (void)textView:(QPTTextView *)textView heightChanged:(NSInteger)height;

@end



@interface QPTTextView : UITextView

/**
 * 设置占位文字
 */
@property (nonatomic, copy) NSString *placeholder;

/**
 *  设置占位文字颜色
 */
@property (nonatomic, strong) UIColor *placeholderColor;

/**
 *  占位文字的X偏移量
 */
@property (nonatomic, assign) CGFloat placeHolderOffsetX;

/**
 *  占位文字的Y偏移量
 */
@property (nonatomic, assign) CGFloat placeHolderOffsetY;

/**
 *  光标的偏移量
 */
@property (nonatomic, assign) UIOffset  cursorOffset;

/**
 *  是否隐藏
 */
@property (nonatomic, assign)  BOOL placeHolderHidden;

/**
 代理
 */
@property (nonatomic, assign) id <QPTTextViewDelegate> sizeDelegate;
@end
