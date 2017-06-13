//
//  ActionDetialCell.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/6/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "ActionDetialCell.h"


@interface ActionDetialCell()<LWAsyncDisplayViewDelegate>

@property (nonatomic ,strong) LWAsyncDisplayView *asycView;

@property (nonatomic ,strong) UIButton *enterBtn;

@end

@implementation ActionDetialCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = whiteC;
        
        [self.contentView addSubview:self.asycView];
        [self.contentView addSubview:self.enterBtn];
    }
    return self;
}



//点击image
-(void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView didCilickedImageStorage:(LWImageStorage *)imageStorage touch:(UITouch *)touch
{
    NSInteger tag = imageStorage.tag;
    
    HWLog(@"%zd",tag);
    if (self.clickedImageCall) {
        self.clickedImageCall(self, tag);
    }
    
    
}



-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.detialAction.detailActionHeight);
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
}

- (void)_layouSubViews {
    self.enterBtn.frame = self.detialAction.enterFrame;
    
}
-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asycView.delegate = self;
        
    }
    return _asycView;
}

-(YSYKLayout *)detialAction
{
    if (!_detialAction) {
        _detialAction = [[YSYKLayout alloc]initDetailAction];
        
        self.asycView.layout = self.detialAction;
    }
    return _detialAction;
}

-(UIButton *)enterBtn
{
    if (!_enterBtn) {
        _enterBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _enterBtn.backgroundColor = clearC;
        
        _enterBtn.frame = CGRectZero;
        
        [_enterBtn addTarget:self action:@selector(enterClick) forControlEvents:UIControlEventTouchUpInside];
        
        
        
    }
    return _enterBtn;
}

//进入主页
-(void)enterClick
{
    HWLog(@"进入主页");
    
    if (_delegate && [_delegate respondsToSelector:@selector(enterPersonDetialViewFrom:andIndexPath:)]) {
        
        [_delegate enterPersonDetialViewFrom:self andIndexPath:self.indexPath];
        
    }
    
    
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
