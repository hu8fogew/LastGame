//
//  PartnerTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PartnerTableViewCell.h"

@interface PartnerTableViewCell()

@property (strong,nonatomic) LWAsyncDisplayView *asyncView;

@end

@implementation PartnerTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        [self addSubview:self.asyncView];
    }
    return self;
}

-(void)layoutSubviews{
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.partnerLayout.partnerCellH);
    
}

-(PartnerLayout *)partnerLayout{
    if (!_partnerLayout) {
        _partnerLayout = [[PartnerLayout alloc]initWithPartnerCell];
    }
    return _partnerLayout;
}

-(LWAsyncDisplayView *)asyncView{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
        _asyncView.layout = self.partnerLayout;
    }
    return _asyncView;
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
