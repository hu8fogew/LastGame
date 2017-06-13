//
//  MessageTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/8.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MessageTableViewCell.h"

@implementation MessageTableViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.2)];
        view.backgroundColor = HWColor(241, 241, 241);
        [self addSubview:view];
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 1, SCREEN_WIDTH, SCREEN_WIDTH*0.2-2)];
        vi.backgroundColor = [UIColor whiteColor];
        [view addSubview:vi];
        self.imgView = [UIImageView new];
        self.imgView.layer.masksToBounds = YES;
        self.imgView.layer.cornerRadius = SCREEN_WIDTH*0.2*0.3;
        [vi addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.centerY.equalTo(vi);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.2*0.6, SCREEN_WIDTH*0.2*0.6));
        }];
        
        self.nameLabel = [self addLabelWithFont:15 andTextColor:HWColor(51, 51, 51) andsView:vi];
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).with.offset(10);
            make.top.equalTo(self.imgView);
        }];
        
        self.titleLabel = [self addLabelWithFont:13 andTextColor:HWColor(153, 153, 153) andsView:vi];
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.nameLabel);
            make.bottom.equalTo(self.imgView.mas_bottom);
        }];
        
        self.timeLabel = [self addLabelWithFont:14 andTextColor:HWColor(153, 153, 153) andsView:vi];
        [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(vi).with.offset(-10);
            make.centerY.equalTo(self.nameLabel);
        }];
    }
    return self;
}


-(UILabel *)addLabelWithFont:(CGFloat)font andTextColor:(UIColor *)color andsView:(UIView *)sView{
    UILabel *label = [UILabel new];
    label.font = [UIFont systemFontOfSize:font];
    label.textColor = color;
    [sView addSubview:label];
    
    return label;
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
