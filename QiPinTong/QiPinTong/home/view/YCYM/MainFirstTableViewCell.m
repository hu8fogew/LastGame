//
//  MainFirstTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MainFirstTableViewCell.h"

@interface MainFirstTableViewCell()

@property(nonatomic,strong)LWAsyncDisplayView *asycView;
@property(nonatomic,strong)UIButton *chectButton;
@end


@implementation MainFirstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.backgroundColor = [UIColor whiteColor];
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.asycView];
        [self.contentView addSubview:self.chectButton];
    }
    return self;
}

-(void)layoutSubviews
{
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.perDescLayout.descViewHeight);
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
}

- (void)_layouSubViews {
   
    self.chectButton.frame = self.perDescLayout.chectButton;
    
}

-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
        _asycView.backgroundColor = [UIColor whiteColor];
    }
    return _asycView;
}


-(PersonalLayout *)perDescLayout
{
    if (!_perDescLayout) {
        _perDescLayout = [[PersonalLayout alloc]initPersonalOfWorkKind];
        
        self.asycView.layout = self.perDescLayout;
    }
    return _perDescLayout;
}

-(UIButton *)chectButton
{
    if (!_chectButton) {
        _chectButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _chectButton.titleLabel.textAlignment = NSTextAlignmentRight;
        _chectButton.backgroundColor = [UIColor whiteColor];
        _chectButton.layer.cornerRadius = 4.0f;
        _chectButton.layer.masksToBounds = YES;
        [_chectButton setBackgroundImage:[UIImage imageNamed:@"blueView"] forState:UIControlStateSelected];
        [_chectButton setBackgroundImage:[UIImage imageNamed:@"whiteView"] forState:UIControlStateNormal];
        [_chectButton setTitle:@"查看电话" forState:UIControlStateNormal];
        [_chectButton setTitle:@"一键拨打" forState:UIControlStateSelected];
        [_chectButton setTitleColor:whiteC forState:UIControlStateSelected];
        [_chectButton setTitleColor:HWColor(120, 179, 226) forState:UIControlStateNormal];
        _chectButton.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize-1];
        [_chectButton addTarget:self action:@selector(clickChectBtn:) forControlEvents:UIControlEventTouchUpInside];
        _chectButton.frame = CGRectZero;
    }
    return _chectButton;
}

-(void)clickChectBtn:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(onChectOutInCell:andBtn:)]) {
        [_delegate onChectOutInCell:self andBtn:sender];
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
