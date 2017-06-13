//
//  SiftView.m
//  家长界
//
//  Created by mac on 2016/11/18.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "SiftView.h"

@implementation SiftView


-(instancetype)initWithFrame:(CGRect)frame andArr:(NSArray *)arr andAction:(SEL)action andTaget:(nullable id)target
{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        
        self.backgroundColor = [UIColor whiteColor];
        [self createSiftBtnTextArr:arr addTarget:target andAction:action andSuperView:self];
        
    }
    return self;
}


-(void)createSiftBtnTextArr:(NSArray *)arr addTarget:(nullable id)target andAction:(SEL)action andSuperView:(UIView *)sView
{
//    NSArray *arr = @[@"学龄段",@"课程类别",@"人气排行"];
    for (int i = 0; i < 3; i++) {
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.selected = NO;
        [btn setFrame:CGRectMake(0+i*((SCREEN_WIDTH-4)/3 + 2), 0, (SCREEN_WIDTH - 4)/3, siftHeight-1)];
        btn.tag = i;
        [btn addTarget:target action: action forControlEvents:UIControlEventTouchUpInside];
        [btn setTitleEdgeInsets:UIEdgeInsetsMake(btn.height/3, -20, btn.height/3, btn.width/12)];
        btn.titleLabel.font = [UIFont systemFontOfSize:17];
        [btn setImage:[UIImage imageNamed:@"down"] forState:UIControlStateNormal];
        [btn setShowsTouchWhenHighlighted:YES];
        [btn setImage:[UIImage imageNamed:@"up"] forState:UIControlStateSelected];
        btn.backgroundColor = [UIColor whiteColor];
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        [btn setTitleColor:HWColor(0, 0, 0) forState:UIControlStateNormal];
        [btn setTitleColor:HWColor(171, 244, 74) forState:UIControlStateSelected];
        [btn setTintColor:[UIColor blackColor]];
        [btn setImageEdgeInsets:UIEdgeInsetsMake(btn.height/3, btn.width*3/4, btn.height/3, btn.width/6)];
        if (btn.tag == 0) {
            self.btnF = btn;
        }
        
        if (btn.tag == 1) {
            self.btnS = btn;
        }
        
        if (btn.tag == 2) {
            self.btnT = btn;
        }
        
        if (i<2) {
            UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(btn.width + i*(2 + btn.width), siftHeight/8, 2, siftHeight-siftHeight/4)];
            vi.backgroundColor = HWColor(217, 217, 217);
            [sView addSubview:vi];
        }
        
        
        [sView addSubview:btn];
    }
    
}

@end
