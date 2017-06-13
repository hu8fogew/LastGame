//
//  ResumeScanTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/3/21.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ResumeScanTableViewCell.h"

@interface ResumeScanTableViewCell()<LWAsyncDisplayViewDelegate>

@property (strong,nonatomic) LWAsyncDisplayView *asyncView;

@end

@implementation ResumeScanTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        [self.contentView addSubview:self.asyncView];
    }
    return self;
}

-(void)layoutSubviews{
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH,self.scanCellLayout.resumeScanCellH);
}

-(LWAsyncDisplayView *)asyncView{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
    }
    return _asyncView;
}

-(ResumeScanCellLayout *)scanCellLayout{
    if (!_scanCellLayout) {
        _scanCellLayout = [[ResumeScanCellLayout alloc]initWithResumeScanCell];
        self.asyncView.layout = _scanCellLayout;
    }
    return _scanCellLayout;
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
