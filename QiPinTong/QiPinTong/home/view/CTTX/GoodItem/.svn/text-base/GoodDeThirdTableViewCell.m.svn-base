//
//  GoodDeThirdTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "GoodDeThirdTableViewCell.h"

@implementation GoodDeThirdTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.18)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.18-5)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        
        self.titleLabel = [self createLabelWithFont:14 andTextColor:HWColor(51, 51, 51) andSview:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.18/6);
        }];
        
        NSArray *arr = @[@"环境好",@"服务好",@"美食好"];
        for (int i = 0; i < arr.count; i++) {
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10+i*(SCREEN_WIDTH/9+6), SCREEN_WIDTH*0.18*0.55, SCREEN_WIDTH/9, 15)];
            label.font = [UIFont systemFontOfSize:12];
            label.textColor = HWColor(50, 198, 191);
            label.textAlignment = NSTextAlignmentCenter;
            label.layer.borderColor = [HWColor(50, 198, 191)CGColor];
            label.layer.borderWidth = 1;
            label.layer.cornerRadius = 3;
            label.text = arr[i];
            
            [vi addSubview:label];
        }
        
    }
    return self;
}

-(UILabel *)createLabelWithFont:(CGFloat)font andTextColor:(UIColor *)textColor andSview:(UIView *)sView{
    
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    [sView addSubview:lab];
    
    return lab;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
