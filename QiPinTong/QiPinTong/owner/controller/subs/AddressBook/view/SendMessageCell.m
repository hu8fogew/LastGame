//
//  SendMessageCell.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SendMessageCell.h"

@interface SendMessageCell ()
@property (nonatomic ,strong) UIButton *sendButton;

@end

@implementation SendMessageCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = clearC;
        [self.contentView addSubview:self.sendButton];
        [self.sendButton mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.center.equalTo(self);
            
            make.height.mas_equalTo(44);
            
            make.width.mas_equalTo(SCREEN_WIDTH-40);
            
        }];
    }
    return self;
}






-(void)sendMessageClick
{
    if (_delegate && [_delegate respondsToSelector:@selector(sendMessageWith:)]) {
        [_delegate sendMessageWith:self];
    }
    
}



-(UIButton *)sendButton
{
    if (!_sendButton) {
        _sendButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _sendButton.layer.masksToBounds = YES;
        
        _sendButton.layer.cornerRadius = 4.0f;
        
        _sendButton.backgroundColor = blueC;
        [_sendButton setTitleColor:whiteC forState:UIControlStateNormal];
        [_sendButton addTarget:self action:@selector(sendMessageClick) forControlEvents:UIControlEventTouchUpInside];
        [_sendButton setTitle:@"发消息" forState:UIControlStateNormal];
    }
    return _sendButton;
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
