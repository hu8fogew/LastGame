//
//  DateSelectView.h
//  QiPinTong
//
//  Created by taylor on 2017/2/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DateSelectView : UIView

-(instancetype)initWithFrame:(CGRect)rect SelectDateTtitle:(NSString *)title;

-(void)showDateView:(void(^)(NSString *selectStr))selectStr;

@end
