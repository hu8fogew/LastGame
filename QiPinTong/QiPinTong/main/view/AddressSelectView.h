//
//  SelectView.h
//  SelectCity
//
//  Created by zgq on 16/11/2.
//  Copyright © 2016年 zgq. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressSelectView : UIView

- (instancetype)initWithFrame:(CGRect)rect SelectCityTtitle:(NSString *)title;

- (void)showCityView:(void(^)(NSString *proviceStr,NSString *cityStr,NSString * disStr))selectStr;

@end
