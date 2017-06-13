//
//  VtTCLYCellLayout.h
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface VtTCLYCellLayout : LWLayout<NSCopying>

@property (assign,nonatomic) CGFloat vtShowCellHeight;

@property (assign,nonatomic) CGRect sEditBtn;
@property (assign,nonatomic) CGRect sDeleteBtn;

-(id)initWithVtShowCell;

@end
