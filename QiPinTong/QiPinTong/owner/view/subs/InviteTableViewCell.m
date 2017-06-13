//
//  InviteTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "InviteTableViewCell.h"

@interface InviteTableViewCell()<LWAsyncDisplayViewDelegate>

@property (strong,nonatomic) LWAsyncDisplayView *asyncView;

@end

@implementation InviteTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        [self.contentView addSubview:self.asyncView];
    }
    return self;
}


-(void)layoutSubviews{
    [super layoutSubviews];
    
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.inviteLayout.inviteCellHeight);
}


-(void)extraAsyncDisplayIncontext:(CGContextRef)context size:(CGSize)size isCancelled:(LWAsyncDisplayIsCanclledBlock)isCancelled
{
    if (!isCancelled()) {
        
        CGContextMoveToPoint(context, 0.0f, self.height);
        CGContextAddLineToPoint(context, self.width, self.height);
        CGContextSetLineWidth(context, 0.2f);
        CGContextSetStrokeColorWithColor(context, RGB(220, 220, 220, 1).CGColor);
        CGContextStrokePath(context);
        CGContextAddRect(context, self.inviteLayout.backView);
        CGContextSetFillColorWithColor(context, HWColor(240, 240, 240).CGColor);
        CGContextFillPath(context);
    }
}


-(LWAsyncDisplayView *)asyncView{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asyncView.delegate = self;
    }
    
    return _asyncView;
}

-(InviteCellLayout *)inviteLayout{
    if (!_inviteLayout) {
        _inviteLayout = [[InviteCellLayout alloc]initInviteCell];
        self.asyncView.layout = self.inviteLayout;
    }
    return _inviteLayout;
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
