//
//  VentureCellLayout.h
//  QiPinTong
//
//  Created by taylor on 2017/2/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface VentureCellLayout : LWLayout<NSCopying>

@property (assign,nonatomic) CGFloat ventureCellHeight;

-(id)initWithVentureCell;

@end
