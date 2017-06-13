//
//  BottomBtnView.h
//  QiPinTong
//
//  Created by mac on 2017/3/20.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>


@class BottomBtnView;

@protocol BottomBtnViewDelegate <NSObject>

-(void)bottomActionWithNum:(NSInteger)num;

@end

@interface BottomBtnView : UIView



@property(nonatomic,assign) id <BottomBtnViewDelegate> delegate;




-(void)setupViewWithStringId:(NSString *)strId;

@end
