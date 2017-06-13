//
//  BusinessActionCell.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/6/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "BusinessActionCell.h"

@interface BusinessActionCell()

@property (nonatomic ,strong) LWAsyncDisplayView *asycView;

@end

@implementation BusinessActionCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = whiteC;
        
        [self.contentView addSubview:self.asycView];
        
        
    }
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.actionLayout.businessActionCellHeight);
    
}






-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
    }
    
    return _asycView;
}


-(YSYKLayout *)actionLayout
{
    if (!_actionLayout) {
        _actionLayout = [[YSYKLayout alloc]initBusinessAcion];
        
        self.asycView.layout = self.actionLayout;
        
    }
    return _actionLayout;
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
