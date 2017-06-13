//
//  VentureTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/2/6.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "VentureTableViewCell.h"

@interface VentureTableViewCell()<LWAsyncDisplayViewDelegate>

@property (strong,nonatomic) LWAsyncDisplayView *asynView;

@end

@implementation VentureTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self.contentView addSubview:self.asynView];
    }
    
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.asynView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.ventureLayout.ventureCellHeight);
}

-(LWAsyncDisplayView *)asynView{
    if (!_asynView) {
        _asynView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asynView.delegate = self;
    }
    return _asynView;
}

-(VentureCellLayout *)ventureLayout{
    if (!_ventureLayout) {
        _ventureLayout = [[VentureCellLayout alloc]initWithVentureCell];
        
        self.asynView.layout = self.ventureLayout;
    }
    return _ventureLayout;
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
