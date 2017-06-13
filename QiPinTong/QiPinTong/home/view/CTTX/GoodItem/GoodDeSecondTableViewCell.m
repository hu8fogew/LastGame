//
//  GoodDeSecondTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "GoodDeSecondTableViewCell.h"

@interface GoodDeSecondTableViewCell()

@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@end


@implementation GoodDeSecondTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.asycView];
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.partnerLayout.partnerCellHeight);
}

-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
    }
    return _asycView;
}


-(GoodProjectLayout *)partnerLayout
{
    if (!_partnerLayout) {
        _partnerLayout = [[GoodProjectLayout alloc]initPartnerDetialCell];
        self.asycView.layout = self.partnerLayout;
    }
    return _partnerLayout;
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
