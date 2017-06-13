//
//  SelectView.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/18.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SelectView.h"

@implementation SelectView


-(id)initWithFrame:(CGRect)frame title:(NSString *)title imageStr:(NSString *)imageStr
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        self.backgroundColor = whiteC;
        //图片
        UIImageView *imageView = [[UIImageView alloc]init];
        
        imageView.image = [UIImage imageNamed:imageStr];
        
        [self addSubview:imageView];
        
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
          
            make.centerX.equalTo(self);
            
            make.top.mas_equalTo(15);
            
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/10, SCREEN_WIDTH/10));
            
        }];
        
        
//     文字
        
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.botoom+10, frame.size.width, 20) andTextColor:MainColor andTextFont:subTitleSize-1];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        
        titleLabel.text = title;
        
        [self addSubview:titleLabel];
        
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.centerX.equalTo(self);
            make.left.equalTo(self).with.offset(10);
            make.right.equalTo(self).with.offset(-10);
            make.bottom.equalTo(imageView).mas_offset(30);
            make.height.mas_equalTo(20);
            
        }];
        
    }
    return self;
}









@end
