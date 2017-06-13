//
//  JobDetialLayout.h
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface JobDetialLayout : LWLayout<NSCopying>

@property(nonatomic,assign) CGFloat jobDetialHeight;

@property(nonatomic,assign) CGRect addEnjoyFrame;



-(id)initJobDetialCell;


@end
