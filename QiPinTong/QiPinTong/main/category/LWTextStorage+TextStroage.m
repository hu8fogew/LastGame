//
//  LWTextStorage+TextStroage.m
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWTextStorage+TextStroage.h"

@implementation LWTextStorage (TextStroage)




-(id)initWithFrame:(CGRect)frame andTextColor:(UIColor *)color andTextFont:(CGFloat)size
{
    self = [super init];
    if (self) {
        self.frame = frame;
        self.textColor = color;
        self.font = [UIFont systemFontOfSize:size];
//        self.backgroundColor = [UIColor whiteColor];
        self.textAlignment = NSTextAlignmentLeft;
        self.linespacing = 5.0f;
    }
    return self;
}



@end
