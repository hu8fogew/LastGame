//
//  CityCollectionHeadView.m
//  PCN
//
//  Created by 蒙奇D路飞 on 16/8/11.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import "CityCollectionHeadView.h"

@implementation CityCollectionHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.sectionTitleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, frame.size.width-5, frame.size.height)];
        self.sectionTitleLabel.font = [UIFont boldSystemFontOfSize:17];
        self.sectionTitleLabel.textColor = SecondTitleColor;
        [self addSubview:self.sectionTitleLabel];
        
    }
    return self;
}


-(void)setIshiddenDeleteImg:(BOOL)ishiddenDeleteImg
{
    if (_ishiddenDeleteImg != ishiddenDeleteImg) {
        _ishiddenDeleteImg = ishiddenDeleteImg;
    }
    
    
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    
    btn.x = SCREEN_WIDTH-30;
    
    btn.centerY = self.centerY-10;
    
    btn.size = CGSizeMake(20, 20);
    
    btn.layer.cornerRadius = 25/2;
    btn.layer.masksToBounds = YES;
    
    [btn setImage:[UIImage imageNamed:@"delete_changeArr_icon"] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(clickDelete) forControlEvents:UIControlEventTouchUpInside];
    
    if (ishiddenDeleteImg == YES) {
        [self addSubview:btn];
    }
    
    
    
    
}

-(void)clickDelete
{
    if (_delegate && [_delegate respondsToSelector:@selector(deleteChangeArr)]) {
        [_delegate deleteChangeArr];
    }
}

@end
