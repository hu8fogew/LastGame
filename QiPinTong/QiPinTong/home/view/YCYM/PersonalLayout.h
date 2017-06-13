//
//  PersonalLayout.h
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface PersonalLayout : LWLayout<NSCopying>
//个人经历cell的高度
@property(nonatomic,assign) CGFloat descCellHeight;

//个人类型介绍高度
@property(nonatomic,assign) CGFloat descViewHeight;
//按钮高度
@property(nonatomic,assign) CGRect chectButton;

//动态头不是图的高度
@property(nonatomic,assign) CGFloat discoverVHeight;


//个人求职类型视图的介绍
-(id)initPersonalOfWorkKind;

//个人介绍的cell（标题、介绍两个内容）
-(id)initDescPersonCell;

//初始化个人详情页面的顶部视图及背景
-(id)initOwnerDetailWithSrtId:(NSString *)StrId;

//朋友圈的个人头部详情
-(id)initOwnerDiscoverView;

@property(nonatomic,assign) CGFloat personViewHeight;
@property(nonatomic,assign) CGRect returnSendBtn;
@property(nonatomic,assign) CGRect enjoyButton;
@property(nonatomic,assign) CGRect photoPosition;

@property(nonatomic,assign) CGRect sendVPosition;

@property(nonatomic,assign) CGRect editViewPosition;

@end
