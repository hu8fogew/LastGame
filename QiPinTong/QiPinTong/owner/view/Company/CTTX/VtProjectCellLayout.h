//
//  VentureProjectCellLayout.h
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface VtProjectCellLayout : LWLayout<NSCopying>

@property (assign,nonatomic) CGFloat vtProjectCellHeight;

@property (assign,nonatomic) CGRect vEditBtn;
@property (assign,nonatomic) CGRect vDeleteBtn;

-(id)initWithVtProjectCell;

@end
