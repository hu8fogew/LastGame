//
//  YCJobFirstTableViewCell.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCJobFirstTableViewCell.h"

@interface YCJobFirstTableViewCell()<LWAsyncDisplayViewDelegate>

@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@property(nonatomic,strong) UIButton *addFriendBtn;


@end


@implementation YCJobFirstTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.asycView];
        [self.contentView addSubview:self.addFriendBtn];
    }
    return self;
}

-(void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView didCilickedTextStorage:(LWTextStorage *)textStorage linkdata:(id)data
{
    HWLog(@"%@",data);
    
    
    if ([data isEqualToString:@"02985572521"]) {
        NSString *number = @"02985572521";// 此处读入电话号码
        // NSString *num = [[NSString alloc]initWithFormat:@"tel://%@",number]; //number为号码字符串 如果使用这个方法结束电话之后会进入联系人列表
        
        NSString *num = [[NSString alloc]initWithFormat:@"telprompt://%@",number]; //而这个方法则打电话前先弹框 是否打电话 然后打完电话之后回到程序中 网上说这个方法可能不合法 无法通过审核
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:num] options:@{} completionHandler:^(BOOL success) {
            if (success) {
                HWLog(@"成功");
            }else
            {
                HWLog(@"失败");
            }
        }];
    }
    
}



-(void)layoutSubviews
{
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.jobLayout.jobDetialHeight);
    
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
}

- (void)_layouSubViews {
    
    self.addFriendBtn.frame = self.jobLayout.addEnjoyFrame;
    
}
-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asycView.delegate = self;
    }
    return _asycView;
}

-(JobDetialLayout *)jobLayout
{
    if (!_jobLayout) {
        _jobLayout = [[JobDetialLayout alloc]initJobDetialCell];
        self.asycView.layout = self.jobLayout;
    }
    return _jobLayout;
}

-(UIButton *)addFriendBtn
{
    if (!_addFriendBtn) {
        _addFriendBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _addFriendBtn.frame = CGRectZero;
        _addFriendBtn.backgroundColor = whiteC;
        _addFriendBtn.layer.cornerRadius = 4;
        _addFriendBtn.layer.borderWidth = 1.0f;
        _addFriendBtn.imageEdgeInsets = UIEdgeInsetsMake(2, -3, 2, 3);
        _addFriendBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
        _addFriendBtn.layer.borderColor = [blueC CGColor];
        [_addFriendBtn setTitle:@"加好友" forState:UIControlStateNormal];
        [_addFriendBtn setImage:[UIImage imageNamed:@"addFirend_icon"] forState:UIControlStateNormal];
        _addFriendBtn.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize];
        [_addFriendBtn setTitleColor:blueC forState:UIControlStateNormal];
        _addFriendBtn.layer.masksToBounds = YES;
        [_addFriendBtn addTarget:self action:@selector(enjoyFriendClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addFriendBtn;
}

//加关注
-(void)enjoyFriendClick
{
    
    if (_delegate && [_delegate respondsToSelector:@selector(addFriend)]) {
        [_delegate addFriend];
    }
    
    HWLog(@"加关注");
    
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
