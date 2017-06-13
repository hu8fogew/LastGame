//
//  MainTabBar.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "MainTabBar.h"
@interface MainTabBar()
@property(nonatomic,weak)UIButton *plusBtn;
@end
@implementation MainTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    
    
    self = [super initWithFrame:frame];
    if (self) {
        //添加一个按钮在Tabbar中
        UIButton *plusBtn = [[UIButton alloc]init];
        [plusBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        
        [plusBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        [plusBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
        [plusBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
        plusBtn.size = plusBtn.currentBackgroundImage.size;
        
        [plusBtn addTarget:self action:@selector(plusClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:plusBtn];
        self.plusBtn = plusBtn;
    }
    
    return self;
}


/**
 *  加号按钮点击
 *
 *  @return
 */

-(void)plusClick
{
    
    //通知代理
    if ([self.delegate respondsToSelector:@selector(tabBarDidClickPlusButton:)]) {
        [self.delegate tabBarDidClickPlusButton:self];
        
    }
}
/**
-(void)layoutSubviews
{
    
    [super layoutSubviews];
    //1、设置加号按钮的位置
    self.plusBtn.centerX = self.width *0.5;
    self.plusBtn.centerY = self.height *0.5;
    
    
    
    
}

*/

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
