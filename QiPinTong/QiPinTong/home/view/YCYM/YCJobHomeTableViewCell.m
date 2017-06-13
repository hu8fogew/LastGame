//
//  YCListTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCJobHomeTableViewCell.h"

@interface YCJobHomeTableViewCell()

@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@property(nonatomic,strong)UIButton *enjoyBtn;

@end


@implementation YCJobHomeTableViewCell




-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.asycView];
        [self.contentView addSubview:self.enjoyBtn];
    }
    return self;
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.comCellLay.comentCellHeight);
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
}

- (void)_layouSubViews {
    
    self.enjoyBtn.frame = self.comCellLay.enjoyPoint;
    
}
-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
    }
    return _asycView;
}

-(CompanyLayout *)comCellLay
{
    if (!_comCellLay) {
        _comCellLay = [[CompanyLayout alloc]initCommentCell];
        self.asycView.layout = self.comCellLay;
    }
    return _comCellLay;
}

-(UIButton *)enjoyBtn
{
    if (!_enjoyBtn) {
        _enjoyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_enjoyBtn setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateNormal];
        [_enjoyBtn setImage:[UIImage imageNamed:@"dianzan"] forState:UIControlStateSelected];
        _enjoyBtn.frame = CGRectZero;
        [_enjoyBtn addTarget:self action:@selector(enjoyClickBtn:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _enjoyBtn;
}


-(void)enjoyClickBtn:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(onEnjoyBtnInCell:)] ) {
        [_delegate onEnjoyBtnInCell:self];
    }
    
    HWLog(@"点赞------");
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
