//
//  VtTCLYTableViewCell.m
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "VtTCLYTableViewCell.h"

@interface VtTCLYTableViewCell()<LWAsyncDisplayViewDelegate>

@property (strong,nonatomic) LWAsyncDisplayView *asyncView;

@property (strong,nonatomic) UIButton *editBtn;
@property (strong,nonatomic) UIButton *deleteBtn;


@end

@implementation VtTCLYTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = whiteC;
        self.selectionStyle = NO;
        
        [self.contentView addSubview:self.asyncView];
        [self.contentView addSubview:self.editBtn];
        [self.contentView addSubview:self.deleteBtn];
    }
    return self;
}

-(void)layoutSubviews{
    self.asyncView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.vtShowLayout.vtShowCellHeight);
    
    LWTransaction *layertransaction = self.layer.lw_asyncTransaction;
    [layertransaction addAsyncOperationWithTarget:self selector:@selector(_layoutSubviews) object:nil completion:^(BOOL canceled) {
        
    }];
}

-(void)_layoutSubviews{
    self.editBtn.frame = self.vtShowLayout.sEditBtn;
    self.deleteBtn.frame = self.vtShowLayout.sDeleteBtn;
}

-(LWAsyncDisplayView *)asyncView{
    if (!_asyncView) {
        _asyncView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        
        _asyncView.delegate = self;
    }
    return _asyncView;
}

-(VtTCLYCellLayout *)vtShowLayout{
    if (!_vtShowLayout) {
        _vtShowLayout = [[VtTCLYCellLayout alloc]initWithVtShowCell];
        self.asyncView.layout = self.vtShowLayout;
    }
    return _vtShowLayout;
}

-(UIButton *)editBtn{
    if (!_editBtn) {
        _editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_editBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [_editBtn setImage:[UIImage imageNamed:@"座机"] forState:UIControlStateNormal];
        _editBtn.layer.masksToBounds = YES;
        _editBtn.layer.cornerRadius = 3;
        _editBtn.layer.borderWidth = 1;
        _editBtn.layer.borderColor = SecondTitleColor.CGColor;
        [_editBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
        _editBtn.titleLabel.font = [UIFont systemFontOfSize:subTitleSize];
        [_editBtn addTarget:self action:@selector(clickEditBtn:) forControlEvents:UIControlEventTouchUpInside];
        _editBtn.frame = CGRectZero;
    }
    
    return _editBtn;
}

-(UIButton *)deleteBtn{
    if (!_deleteBtn) {
        _deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteBtn setImage:[UIImage imageNamed:@"座机"] forState:UIControlStateNormal];
        _deleteBtn.layer.masksToBounds = YES;
        _deleteBtn.layer.cornerRadius = 3;
        _deleteBtn.layer.borderWidth = 1;
        _deleteBtn.layer.borderColor = SecondTitleColor.CGColor;
        [_deleteBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
        _deleteBtn.titleLabel.font = [UIFont systemFontOfSize:subTitleSize];
        [_deleteBtn addTarget:self action:@selector(clickDeleteBtn:) forControlEvents:UIControlEventTouchUpInside];
        _deleteBtn.frame = CGRectZero;
    }
    
    return _deleteBtn;
}


-(void)clickEditBtn:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(clickVtCLYCEditBtn:)]) {
        [_delegate clickVtCLYCEditBtn:self ];
    }
}


-(void)clickDeleteBtn:(UIButton *)sender{
    if (_delegate && [_delegate respondsToSelector:@selector(clickVtCLYCDeleteBtn:)]) {
        [_delegate clickVtCLYCDeleteBtn:self ];
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
