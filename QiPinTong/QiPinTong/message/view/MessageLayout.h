//
//  MessageLayout.h
//  QiPinTong
//
//  Created by mac on 2017/1/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface MessageLayout : LWLayout<NSCopying>

//消息高度
@property(nonatomic,assign) CGFloat messageCellHeight;

-(id)initMessageCell;


//他人消息
@property(nonatomic,assign) CGFloat otherMessageHeight;
-(id)initOtherMessageCell;


//我的消息
@property(nonatomic,assign) CGFloat ownMessageHeight;
-(id)initOwnMessageCell;
@end
