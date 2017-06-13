//
//  QPTKeyBoardViewTool.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>



typedef void(^SendBlock)(NSString * commentString);
@interface QPTKeyBoardViewTool : UIView






@property (nonatomic,copy)SendBlock sendText;




/**
 弹出自定义键盘和输入框工具条---有表情键盘  注意：一定是要在viewDidLayout中增添空间
 
 @    tooBarHeight  工具条的高度
 @    sendTextBlock  返回输入框的输入文字
 
 @return   返回QPTKeyBoardTool
 */

-(instancetype)initKeyBoradWithConfigToolBarHeight:(CGFloat)toolBarHeight sendTextCompletion:(SendBlock)sendTextBlock;
+(QPTKeyBoardViewTool *)showKeyBoardWithConfigToolBarHeight:(CGFloat)toolBarHeight sendTextCompletion:(SendBlock)sendTextBlock;

/**
 设置输入框占位文字
 
 @ placeText  占位文字
 
 */

-(void) setInputViewPlaceHolderText:(NSString *)placeText;


/**
 开启第一响应者
 */
-(void)becomeFirstResponder;

/**
 关闭第一响应者
 */
-(void)resignFirstResponder;



@end
