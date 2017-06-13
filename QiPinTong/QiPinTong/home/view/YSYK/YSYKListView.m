//
//  YSYKListView.m
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YSYKListView.h"

@interface YSYKListView ()<LWAsyncDisplayViewDelegate>

@property(nonatomic,strong)LWAsyncDisplayView *asycView;

@property(nonatomic,strong)UIButton *buyBtn;//支付
@property (nonatomic ,strong) UIButton *mapButton;//导航

@property (nonatomic,strong) UIButton *telephoneButton;//一键拨打

@property (nonatomic ,strong) UIButton *getMoneyBtn;//领取优惠券

@end


@implementation YSYKListView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
       
        self.backgroundColor = [UIColor whiteColor];
        [self addSubview:self.asycView];
        [self addSubview:self.buyBtn];
        [self addSubview:self.mapButton];
        [self addSubview:self.telephoneButton];
        [self addSubview:self.getMoneyBtn];
        
    }
    return self;
}


-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.asycView.frame = CGRectMake(0, 0, SCREEN_WIDTH, self.listViewLayout.listViewHeight);
    //主线程runloop空闲时执行
    LWTransaction* layerAsyncTransaction = self.layer.lw_asyncTransaction;
    [layerAsyncTransaction
     addAsyncOperationWithTarget:self
     selector:@selector(_layouSubViews)
     object:nil
     completion:^(BOOL canceled) {}];
}

- (void)_layouSubViews {
    
    self.buyBtn.frame = self.listViewLayout.buyButton;
    
    self.telephoneButton.frame = self.listViewLayout.telephoneFrame;
    self.mapButton.frame = self.listViewLayout.taxiFrame;
    self.getMoneyBtn.frame = self.listViewLayout.getMoneyFrame;
}


//点击LWTextStorage
- (void)lwAsyncDisplayView:(LWAsyncDisplayView *)asyncDisplayView
    didCilickedTextStorage:(LWTextStorage *)textStorage
                  linkdata:(id)data {
    //回复评论
    HWLog(@"%@",data);
    
    if ([data isEqualToString:@"18209295072"]) {
        NSString *number = @"18209295072";// 此处读入电话号码
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
    
    if ([data isEqualToString:@"www.baidu.com"]) {
        
        
    }
    
    
}


//购买按钮
-(void)buyClickBtn:(UIButton *)sender
{
    HWLog(@"购买");
    if (_delegate && [_delegate respondsToSelector:@selector(buyAction)]) {
        [_delegate buyAction];
    }
    
}


//导航
-(void)mapClickAction:(UIButton *)sender
{
    if (sender.tag == 100) {
        if (_delegate && [_delegate respondsToSelector:@selector(naviBtnAction)]){
            
            [_delegate naviBtnAction];
        }
        
        
        
    }else if(sender.tag == 101)
    {
        NSString *number = @"18209295072";// 此处读入电话号码
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
    }else
    {
        if(_delegate && [_delegate respondsToSelector:@selector(getBoon:)])
        {
            [_delegate getBoon:sender];
        }
    }
}


//初始化
-(LWAsyncDisplayView *)asycView
{
    if (!_asycView) {
        _asycView = [[LWAsyncDisplayView alloc]initWithFrame:CGRectZero];
        _asycView.delegate = self;
    }
    return _asycView;
}


-(YSYKLayout *)listViewLayout
{
    if (!_listViewLayout) {
        _listViewLayout = [[YSYKLayout alloc] initListViewDetialView];
        self.asycView.layout = self.listViewLayout;
    }
    return _listViewLayout;
}

-(UIButton *)buyBtn
{
    if (!_buyBtn) {
        _buyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyBtn.frame = CGRectZero;
        [_buyBtn setTitle:@"支付" forState:UIControlStateNormal];
        _buyBtn.titleLabel.font = [UIFont systemFontOfSize:subTitleSize];
        _buyBtn.backgroundColor = blueC;
        [_buyBtn setTitleColor:whiteC forState:UIControlStateNormal];
        [_buyBtn addTarget:self action:@selector(buyClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _buyBtn;
}

-(UIButton *)mapButton
{
    if (!_mapButton) {
        _mapButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _mapButton.frame = CGRectZero;
        
        [_mapButton setImage:[UIImage imageNamed:@"taxi_icon"] forState:UIControlStateNormal];
        _mapButton.backgroundColor = clearC;
        _mapButton.tag = 100;
        [_mapButton addTarget:self action:@selector(mapClickAction:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _mapButton;
}


-(UIButton *)telephoneButton
{
    if (!_telephoneButton) {
        _telephoneButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _telephoneButton.frame = CGRectZero;
        
        [_telephoneButton setImage:[UIImage imageNamed:@"telephone_icon"] forState:UIControlStateNormal];
        _telephoneButton.backgroundColor = clearC;
        _telephoneButton.tag = 101;
        [_telephoneButton addTarget:self action:@selector(mapClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _telephoneButton;
}

-(UIButton *)getMoneyBtn
{
    if (!_getMoneyBtn) {
        _getMoneyBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _getMoneyBtn.frame = CGRectZero;
        
        _getMoneyBtn.layer.cornerRadius = 2.0f;
        _getMoneyBtn.layer.borderColor = [orangeC CGColor];
        _getMoneyBtn.layer.borderWidth = 1.0f;
        
        _getMoneyBtn.layer.masksToBounds = YES;
        _getMoneyBtn.titleLabel.font = [UIFont systemFontOfSize:subTitleSize];
        [_getMoneyBtn setTitle:@"领取" forState:UIControlStateNormal];
        [_getMoneyBtn setTitle:@"已领取" forState:UIControlStateSelected];
        [_getMoneyBtn setTitleColor:orangeC forState:UIControlStateNormal];
        
        _getMoneyBtn.backgroundColor = clearC;
        _getMoneyBtn.tag = 102;
        [_getMoneyBtn addTarget:self action:@selector(mapClickAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _getMoneyBtn;
}


@end
