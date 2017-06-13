//
//  ThreeSelectBtnView.h
//  QiPinTong
//
//  Created by taylor on 2017/1/20.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SelectBtnView;
@protocol BtnViewDidSelectDelegate<NSObject>
@optional
//-(void)ThreeBtnViewDidSelect:(NSInteger)index;
//-(void)FourBtnViewDidSelect:(NSInteger)index;
//-(void)EightBtnViewDidSelect:(NSInteger)index;


-(void)didselectViewAtIndex:(NSInteger)index;

@end

@interface SelectBtnView : UIView

@property(assign,nonatomic)id<BtnViewDidSelectDelegate>delegate;

//@property (strong,nonatomic) NSArray *threeViewArr;
//@property (strong,nonatomic) NSArray *fourViewArr;
//@property (strong,nonatomic) NSArray *eightViewArr;

@property (nonatomic ,strong) NSMutableArray *selectButtonArray;


@end
