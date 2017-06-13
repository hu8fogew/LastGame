//
//  GoodDeFirstTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "GoodDeFirstTableViewCell.h"
@interface GoodDeFirstTableViewCell()


@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@end

@implementation GoodDeFirstTableViewCell


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
    
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.projectLayout.projectCellHeight);
}



-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
    }
    
    return _asycView;
}


-(GoodProjectLayout *)projectLayout
{
    if (!_projectLayout) {
        _projectLayout = [[GoodProjectLayout alloc]initWellProjectCell];
        self.asycView.layout = self.projectLayout;
    }
    return _projectLayout;
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
