//
//  MainSecondTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MainSecondTableViewCell.h"
@interface MainSecondTableViewCell()


@property(nonatomic,strong)LWAsyncDisplayView *asyncView;

@end


@implementation MainSecondTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.asyncView];
        
    }
    return self;
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.perLayout.descCellHeight);
    
}


-(LWAsyncDisplayView *)asyncView
{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asyncView.backgroundColor = [UIColor whiteColor];
    }
    return _asyncView;
}


-(PersonalLayout *)perLayout
{
    if (!_perLayout) {
        _perLayout = [[PersonalLayout alloc]initDescPersonCell];
        self.asyncView.layout = self.perLayout;
    }
    return _perLayout;
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
