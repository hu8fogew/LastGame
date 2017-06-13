//
//  WorkGuideLayout.h
//  QiPinTong
//
//  Created by taylor on 2017/2/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface WorkGuideLayout : LWLayout<NSCopying>

@property (assign,nonatomic) CGFloat guideCellHeight;

-(id)initWithWorkGuideCell;

@end
