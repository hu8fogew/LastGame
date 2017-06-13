//
//  CommentCell.m
//  家长界
//
//  Created by mac on 2016/12/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "CommentCell.h"
#import "ComentLayout.h"
#import "LWAsyncDisplayView.h"

@interface CommentCell()<LWAsyncDisplayViewDelegate>
@property(nonatomic,strong)LWAsyncDisplayView *asyncView;

@end


@implementation CommentCell




- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = HWColor(232, 232, 232);
        [self.contentView addSubview:self.asyncView];
        
        
    }
    return self;
}


- (void)extraAsyncDisplayIncontext:(CGContextRef)context
                              size:(CGSize)size
                       isCancelled:(LWAsyncDisplayIsCanclledBlock)isCancelled {
    if (!isCancelled()) {
        CGContextMoveToPoint(context, 0.0f, self.bounds.size.height);
        CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
        CGContextSetLineWidth(context, 0.2f);
        CGContextSetStrokeColorWithColor(context,RGB(220.0f, 220.0f, 220.0f, 1).CGColor);
        CGContextStrokePath(context);
        
    }
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.comLayout.commentHeight);
    
}






-(LWAsyncDisplayView *)asyncView
{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asyncView.delegate = self;
    }
    return _asyncView;
}

-(ComentLayout *)comLayout
{
    if (!_comLayout) {
        _comLayout = [[ComentLayout alloc]initCommentCell];
        self.asyncView.layout = _comLayout;
    }
    return _comLayout;
}



- (void)awakeFromNib {
    [super awakeFromNib];
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
