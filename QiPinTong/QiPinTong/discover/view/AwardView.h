//
//  AwardView.h
//  QiPinTong
//
//  Created by mac on 2017/3/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, SK_TYPE) {// 动画类型
    SK_TYPE_SPRING,// 弹簧效果
    SK_TYPE_ROTATION,// 旋转效果
    SK_TYPE_FADE,// 渐变效果
    SK_TYPE_LARGEN,// 变大效果
    SK_TYPE_ROTATION_LARGEN,// 旋转变大效果
    SK_TYPE_TRANSFORMATION// 变形效果
};

typedef NS_ENUM(NSInteger, SK_SUBTYPE) {// 动画方向
    SK_SUBTYPE_FROMRIGHT,// 从右侧进入
    SK_SUBTYPE_FROMLEFT,// 从左侧进入
    SK_SUBTYPE_FROMTOP,// 从顶部进入
    SK_SUBTYPE_FROMBOTTOM,// 从底部进入
    SK_SUBTYPE_FROMCENTER// 从屏幕中间进入
};

typedef void (^SKPopViewChooseCompletion)(void);

@protocol AwardViewDelegate <NSObject>
@optional
-(void)didAwardCoinNum:(CGFloat)num;

@end


@interface AwardView : UIView


@property (nonatomic,assign) id <AwardViewDelegate> delegate;//代理

@property (nonatomic,copy) SKPopViewChooseCompletion completion;//block

@property (nonatomic, assign) BOOL enableAnimation;// 开启动画，默认为NO
@property (nonatomic, assign) BOOL enableClickEffect;// 开启点击效果, 默认为NO

@property (nonatomic, assign) SK_TYPE animationType;// 动画类型
@property (nonatomic, assign) SK_SUBTYPE animationDirection;// 动画出现的方向
@property (nonatomic, assign) NSTimeInterval animationDuration;// 动画持续时间



/**
 初始化动画视图
 1、imageUrl : 弹出视窗的头像
 2、name : 弹出视窗的名字
 3、delegate : 相应的代理
 4、completion : 弹出窗之后的回调操作，若不需要就传入nil
 
 */

-(instancetype)initWithHeaderImage:(NSURL *)imageUrl andName:(NSString *)name delegate:(id <AwardViewDelegate>)delegate completion:(SKPopViewChooseCompletion)completion;



/**
 显示弹窗
 */
- (void)show;// 显示弹窗

/**
 消失弹窗
 */
- (void)dismiss;// 消失弹窗




@end
