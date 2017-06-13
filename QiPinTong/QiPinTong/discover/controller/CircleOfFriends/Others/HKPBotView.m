//
//  HKPBotView.m
//  HKPTimeLine  仿赤兔、微博动态
//  CSDN:  http://blog.csdn.net/samuelandkevin
//  Created by samuelandkevin on 16/9/20.
//  Copyright © 2016年 HKP. All rights reserved.
//

#import "HKPBotView.h"
#import "YHWorkGroupButton.h"
#import "Masonry.h"
#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]
@interface HKPBotView()
@property (nonatomic,strong) UIView *viewTopLine;//顶部横线
@property (nonatomic,strong) UIView *viewVLine1;//竖线1
@property (nonatomic,strong) UIView *viewVLine2;//竖线2

@end

@implementation HKPBotView



- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

- (void)setup{
    
    //评论
    YHWorkGroupButton *btnComment = [YHWorkGroupButton new];
    [btnComment setTitle:@"0" forState:UIControlStateNormal];
    [btnComment setImage:[UIImage imageNamed:@"commentIcon"] forState:UIControlStateNormal];
    
    
    
    
    [btnComment addTarget:self action:@selector(onComment:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btnComment];
    self.btnComment = btnComment;
    
    
    
    
    //点赞
    YHWorkGroupButton *btnLike = [YHWorkGroupButton new];
    [self addSubview:btnLike];
    [btnLike setTitle:@"1" forState:UIControlStateNormal];
    [btnLike setImage:[UIImage imageNamed:@"praiseNIcon"] forState:UIControlStateNormal];
    [btnLike setImage:[UIImage imageNamed:@"praiseSIcon"] forState:UIControlStateSelected];
    [btnLike addTarget:self action:@selector(onLike:) forControlEvents:UIControlEventTouchUpInside];
    self.btnLike = btnLike;
    
    
    //分享
    YHWorkGroupButton *btnShare = [YHWorkGroupButton new];
    [btnShare setTitle:@"打赏" forState:UIControlStateNormal];
    [btnShare setImage:[UIImage imageNamed:@"icon_image"] forState:UIControlStateNormal];
    [btnShare addTarget:self action:@selector(onShare:) forControlEvents:UIControlEventTouchUpInside];
    
    [self addSubview:btnShare];
    self.btnShare = btnShare;
    
    
    [self layoutUI];
    
}

- (void)layoutUI{
    __weak typeof(self) weakSelf = self;
    
    [self.btnLike mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf).offset(8.0f);
        make.top.equalTo(weakSelf.mas_top);
        make.width.equalTo(weakSelf.mas_width).dividedBy(3.22f);
        make.bottom.equalTo(weakSelf).offset(-0.0);
    }];
    
    
    [self.btnComment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btnLike.mas_right);
        make.centerY.equalTo(weakSelf.btnLike.mas_centerY);
        make.width.mas_equalTo(weakSelf.btnLike.mas_width);
        make.height.mas_equalTo(weakSelf.btnLike.mas_height);
    }];
    
    
    [self.btnShare mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.btnComment.mas_right);
        make.centerY.equalTo(weakSelf.btnLike.mas_centerY);
        make.width.mas_equalTo(weakSelf.btnLike.mas_width);
        make.height.mas_equalTo(weakSelf.btnLike.mas_height);
    }];

}


#pragma mark - Action

- (void)onShare:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(onShare)]) {
        [_delegate onShare];
    }
    
}

- (void)onLike:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (_delegate && [_delegate respondsToSelector:@selector(onLike)]) {
        [_delegate onLike];
    }
}

- (void)onComment:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(onComment)]) {
        [_delegate onComment];
    }
}


@end
