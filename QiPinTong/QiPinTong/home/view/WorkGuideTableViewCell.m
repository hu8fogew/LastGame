//
//  WorkGuidTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/2/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "WorkGuideTableViewCell.h"

@interface WorkGuideTableViewCell()<LWAsyncDisplayViewDelegate>

@property (strong,nonatomic) LWAsyncDisplayView *asynView;

@end

@implementation WorkGuideTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = UITableViewCellSeparatorStyleNone;
        
        [self.contentView addSubview:self.asynView];
    }
    return self;
}

-(void)layoutSubviews{
    self.asynView.frame = CGRectMake(0, 0, SCREEN_WIDTH,self.guideLayout.guideCellHeight);
}

-(LWAsyncDisplayView *)asynView{
    if (!_asynView) {
        _asynView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asynView.delegate = self;
    }
    
    return _asynView;
}

-(WorkGuideLayout *)guideLayout{
    if (!_guideLayout) {
        _guideLayout = [[WorkGuideLayout alloc]initWithWorkGuideCell];
        self.asynView.layout = self.guideLayout;
    }
    
    return _guideLayout;
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
