//
//  BottomBtnView.m
//  QiPinTong
//
//  Created by mac on 2017/3/20.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "BottomBtnView.h"

@implementation BottomBtnView

-(id)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = whiteC;
    }
    return self;
}

//设置视图
-(void)setupViewWithStringId:(NSString *)strId
{
    UIButton *buttonF = [self createButtonWithFrame:CGRectMake(10, 15, (SCREEN_WIDTH-30)/2, 40) andText:strId andTag:0];
    
    [self addSubview:buttonF];
    UIButton *buttonS = [self createButtonWithFrame:CGRectMake(10+10+(SCREEN_WIDTH-30)/2, 15, (SCREEN_WIDTH-30)/2, 40) andText:strId andTag:1];
    
    [self addSubview: buttonS];
}

-(UIButton *)createButtonWithFrame:(CGRect)frame andText:(NSString*)str andTag:(NSInteger)tag
{
    NSString *strId = @"个人";
    BOOL isRight = [str isEqualToString:strId];
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = frame;
    button.layer.cornerRadius = 4.0f;
    button.layer.borderWidth = 1.0f;
    button.layer.borderColor = [blueC CGColor];
    button.layer.masksToBounds = YES;
    
    button.imageEdgeInsets = UIEdgeInsetsMake(2, -3, 2, 3);
    button.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
    button.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize];
    button.backgroundColor = whiteC;
    if (tag == 0) {
        [button setTitle:@"加关注" forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"fans"] forState:UIControlStateNormal];
        [button setTitleColor:blueC forState:UIControlStateNormal];
        
    }
    if (tag == 1) {
        [button setTitle: isRight ? @"发邀请":@"投递简历" forState:UIControlStateNormal];
        button.backgroundColor = blueC;
        [button setImage:[UIImage imageNamed: @"sendResume_icon"] forState:UIControlStateNormal];
        [button setTitleColor:whiteC forState:UIControlStateNormal];
        
    }
    button.tag = tag;
    
    [button addTarget:self action:@selector(bottomBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
    return button;
}




-(void)bottomBtnClick:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(bottomActionWithNum:)]) {
        [_delegate bottomActionWithNum:sender.tag];
        
    }
}


@end
