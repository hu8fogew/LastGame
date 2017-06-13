//
//  MessageTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/8.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MessageTableViewCell.h"

@interface MessageTableViewCell()

@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@end

@implementation MessageTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = whiteC;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.asycView];
        
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.messageLayout.messageCellHeight);
    
}

-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
    }
    return _asycView;
}


-(MessageLayout *)messageLayout
{
    if (!_messageLayout) {
        _messageLayout = [[MessageLayout alloc]initMessageCell];
        self.asycView.layout = self.messageLayout;
    }
    return _messageLayout;
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
