//
//  InviteCellLayout.h
//  QiPinTong
//
//  Created by taylor on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface InviteCellLayout : LWLayout<NSCopying>

@property (nonatomic,assign) CGFloat inviteCellHeight;

@property (assign,nonatomic) CGRect backView;

-(id)initInviteCell;

@end
