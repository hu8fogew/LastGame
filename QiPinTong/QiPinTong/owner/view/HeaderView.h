//
//  MemberHeaderView.h
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeaderView;

@protocol HeaderViewDelegate <NSObject>

-(void)editOwnerInformation;

-(void)setOwnerImage;

-(void)typeBtnClick;

@end


@interface HeaderView : UIView

@property (strong,nonatomic) UIImageView *backImgView;

@property (strong,nonatomic) UIImageView *imgView;

@property (strong,nonatomic) UIButton *typeBtn;

@property (strong,nonatomic) UIButton *setupBtn;

@property (strong,nonatomic) UIButton *editBtn;

@property(nonatomic,assign) id <HeaderViewDelegate> delegate;

@end
