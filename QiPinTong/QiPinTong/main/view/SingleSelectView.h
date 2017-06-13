//
//  SingleSelectView.h
//  QiPinTong
//
//  Created by taylor on 2017/3/2.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SingleSelectView : UIView
- (instancetype)initWithFrame:(CGRect)rect SelectTtitle:(NSString *)title TitleArr:(NSArray *)arr;

- (void)showView:(void(^)(NSString *singleStr))selectStr;

@end
