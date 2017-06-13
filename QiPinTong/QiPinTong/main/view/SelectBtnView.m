//
//  ThreeSelectBtnView.m
//  QiPinTong
//
//  Created by taylor on 2017/1/20.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SelectBtnView.h"

@implementation SelectBtnView

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
    }
    
    return self;
}

-(void)setSelectButtonArray:(NSMutableArray *)selectButtonArray
{
    if (_selectButtonArray != selectButtonArray) {
        _selectButtonArray = selectButtonArray;
        
        int i = 0;
        for (NSDictionary *dic in selectButtonArray) {
            UIView *vi = [self creatViewWith:dic andTag:i];
            if (selectButtonArray.count == 3){
                
                vi.frame = CGRectMake((SCREEN_WIDTH/3)*i, 0, SCREEN_WIDTH/3, SCREEN_WIDTH*0.24);
                
            }else if (selectButtonArray.count == 4) {
                
                
                vi.frame = CGRectMake((SCREEN_WIDTH/4)*i, 0, SCREEN_WIDTH/4, SCREEN_WIDTH*0.24);
                
            }else if (selectButtonArray.count == 5){
                
                
                vi.frame = CGRectMake((SCREEN_WIDTH/5-1)*i+i*1, 0, SCREEN_WIDTH/5-1, SCREEN_WIDTH*0.56/2-1);
                
                
            }else if (selectButtonArray.count == 8) {
                
                if (i<4) {
                    vi.frame = CGRectMake((SCREEN_WIDTH/4-1)*i+i*1, 0, SCREEN_WIDTH/4-1, SCREEN_WIDTH*0.52/2-1);
                }
                if (i>=4) {
                    vi.frame = CGRectMake((SCREEN_WIDTH/4-1)*(i-4)+(i-4)*1, SCREEN_WIDTH*0.48/2, SCREEN_WIDTH/4-1, SCREEN_WIDTH*0.48/2);
                }
                
                
            }else if (selectButtonArray.count == 10) {
                
                
                if (i<5) {
                    vi.frame = CGRectMake((SCREEN_WIDTH/5-1)*i+i*1, 0, SCREEN_WIDTH/5-1, SCREEN_WIDTH*0.56/2-1);
                }
                if (i>=5) {
                    vi.frame = CGRectMake((SCREEN_WIDTH/5-1)*(i-5)+(i-5)*1, SCREEN_WIDTH*0.48/2, SCREEN_WIDTH/5-1, SCREEN_WIDTH*0.48/2);
                }
                
                
            }
            
            
            [self addSubview:vi];
            
            
            i++;
        }
    }
}




-(UIView *)creatViewWith:(NSDictionary *)dic andTag:(NSInteger)tag
{
    UIView *vi = [[UIView alloc]init];
    
    vi.backgroundColor = [UIColor whiteColor];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.adjustsImageWhenHighlighted = NO;
    [button setBackgroundImage:[UIImage imageNamed:dic[@"slecteImg"]] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickEighthBtn:) forControlEvents:UIControlEventTouchUpInside];
    button.layer.cornerRadius = button.width/2;
    button.layer.masksToBounds = YES;
    button.tag = tag;
    [vi addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(vi);
        make.bottom.equalTo(vi.mas_centerY).with.offset(10);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/10, SCREEN_WIDTH/10));
    }];
    //添加文字
    UILabel *label = [UILabel new];
    label.text = dic[@"labTitle"];
    label.font = [UIFont systemFontOfSize:mainTitleSize];
    label.textColor = MainColor;
    label.textAlignment = NSTextAlignmentCenter;
    [vi addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(vi);
        make.top.equalTo(vi.mas_centerY).with.offset(20);
    }];
    
    [self addSubview:vi];
    
    return vi;
}


-(void)clickEighthBtn:(UIButton *)sender
{
    HWLog(@"%zd",sender.tag);
    if (_delegate && [_delegate respondsToSelector:@selector(didselectViewAtIndex:)]) {
        [_delegate didselectViewAtIndex:sender.tag];
    }
}


@end
