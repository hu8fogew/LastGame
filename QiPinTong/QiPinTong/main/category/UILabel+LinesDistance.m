//
//  UILabel+LinesDistance.m
//  家长界
//
//  Created by mac on 2016/11/22.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "UILabel+LinesDistance.h"

@implementation UILabel (LinesDistance)


-(instancetype)initWithFrame:(CGRect)frame andTextColor:(UIColor *)color andTextFont:(CGFloat)size
{
    
    self = [super init];
    if (self) {
        
        self.frame = frame;
        self.textColor = color;
        self.font = [UIFont systemFontOfSize:size];
        self.backgroundColor = whiteC;
        
    }
    return self;
}




@end
