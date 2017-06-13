//
//  PayView.m
//  QiPinTong
//
//  Created by taylor on 2017/6/3.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//
//密码位数
static NSInteger const  dotsCount = 6;
//密码黑点宽高相同
static CGFloat const dotsWidth_Height = 10;
//输入框宽高
static CGFloat const fieldsWidth_Height = 50;

#import "PayView.h"

@interface PayView()<UITextFieldDelegate>
@property (strong,nonatomic) UIView *coverView;
@property (strong,nonatomic) UIView *payView;
@property (strong,nonatomic) NSMutableArray *dotArr;

@end

@implementation PayView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [MainColor colorWithAlphaComponent:0.7];
        
        [self addSubview:self.payView];
        
    }
    return self;
}

#pragma mark --------支付视图---------
-(UIView *)payView{
    if (!_payView) {
        _payView = [[UIView alloc]initWithFrame:CGRectMake(20, 50, SCREEN_WIDTH-40, SCREEN_WIDTH-40)];
        _payView.backgroundColor = whiteC;
        CGFloat spaceH = SCREEN_WIDTH*0.15/3;
        
        //图像
        self.imgView = [UIImageView new];
        [_payView addSubview:self.imgView];
        [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(spaceH);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH*0.11, SCREEN_WIDTH*0.11));
        }];
        
        //
        UILabel *payLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+2 Sview:_payView];
        payLab.text = @"请输入支付密码";
        [payLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView.mas_right).offset(5);
            make.centerY.equalTo(self.imgView);
        }];
        
        //关闭按钮
        UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [closeBtn setImage:[UIImage imageNamed:@"error_gray"] forState:UIControlStateNormal];
        [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_payView addSubview:closeBtn];
        [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.imgView);
            make.right.mas_equalTo(-20);
            make.size.mas_equalTo(CGSizeMake(MTitleSize+2, MTitleSize+2));
        }];
        
        //横线
        UIView *blueV = [UIView new];
        blueV.backgroundColor = blueC;
        [_payView addSubview:blueV];
        [blueV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(_payView);
            make.top.equalTo(self.imgView.mas_bottom).offset(spaceH*0.8);
            make.size.mas_equalTo(CGSizeMake(_payView.width, 1));
        }];
        
        //收款账户
        self.titleLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:_payView];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_payView);
            make.top.equalTo(blueV.mas_bottom).offset(spaceH);
        }];
        //金额
        self.amountLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+10 Sview:_payView];
        [self.amountLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(spaceH);
            make.centerX.equalTo(_payView);
        }];
        UILabel *yuanLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+3 Sview:_payView];
        yuanLab.text = @"¥";
        [yuanLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.amountLab.mas_left).offset(-3);
            make.centerY.equalTo(self.amountLab);
        }];
        
        
        //灰色横线
        UIView *firstV = [UIView new];
        firstV.backgroundColor = grayC;
        [_payView addSubview:firstV];
        [firstV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.amountLab.mas_bottom).offset(spaceH);
            make.centerX.equalTo(_payView);
            make.size.mas_equalTo(CGSizeMake(_payView.width-40, 1));
        }];
        
        //券
        UIImageView *quanImg = [UIImageView new];
        quanImg.image = [UIImage imageNamed:@"huiIcon"];
        [_payView addSubview:quanImg];
        [quanImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(firstV);
            make.top.equalTo(firstV.mas_bottom).offset(spaceH);
            make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
        }];
        UILabel *quanLab = [UILabel labelWithTextColor:SecondTitleColor FontSize:MTitleSize Sview:_payView];
        quanLab.text = @"30元代金券，满100元可用";
        [quanLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(quanImg);
            make.left.equalTo(quanImg.mas_right).offset(5);
        }];
        UIButton *selectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [selectBtn setImage:[UIImage imageNamed:@"agreeIconN"] forState:UIControlStateNormal];
        [selectBtn setImage:[UIImage imageNamed:@"agreeIconS"] forState:UIControlStateSelected];
        [selectBtn addTarget:self action:@selector(selectBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_payView addSubview:selectBtn];
        [selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(firstV);
            make.centerY.equalTo(quanImg);
            make.size.equalTo(quanImg);
        }];
        
        //灰色横线
        UIView *secondV = [UIView new];
        secondV.backgroundColor = grayC;
        [_payView addSubview:secondV];
        [secondV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(quanImg.mas_bottom).offset(spaceH);
            make.centerX.equalTo(_payView);
            make.size.equalTo(firstV);
        }];
        
        [_payView addSubview:self.passwordField];
        
    }
    return _payView;
}

-(void)selectBtnAction:(UIButton *)btn{
    btn.selected = !btn.selected;
    
}

-(void)closeBtnClick{
    [self removeFromSuperview];
}

#pragma mark -------dotAry-------
-(NSMutableArray *)dotArr{
    if (!_dotArr) {
        _dotArr = [[NSMutableArray alloc]initWithCapacity:dotsCount];
    }
    return _dotArr;
}

#pragma mark ------textField---------
-(TyTextField *)passwordField{
    if (!_passwordField) {
        _passwordField = [[TyTextField alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-fieldsWidth_Height*6)/2-20, self.payView.height-fieldsWidth_Height-20, fieldsWidth_Height*6, fieldsWidth_Height)];
        _passwordField.delegate = self;
        _passwordField.backgroundColor = whiteC;
        _passwordField.textColor = clearC;
        _passwordField.tintColor = clearC;
        _passwordField.layer.borderColor = SecondTitleColor.CGColor;
        _passwordField.layer.borderWidth = 1;
        _passwordField.keyboardType = UIKeyboardTypeDecimalPad;
        _passwordField.secureTextEntry = YES;
        [_passwordField addTarget:self action:@selector(passwordFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        
        //密码输入框的宽度
        CGFloat fieldWidth = CGRectGetWidth(self.passwordField.frame)/dotsCount;
        //密码输入框的高度
        CGFloat fieldHeight = CGRectGetHeight(self.passwordField.frame);
        
        for (int i = 0; i < dotsCount; i++) {
            UIView *line = [[UIView alloc]initWithFrame:CGRectMake(i*fieldWidth, 0, 1, fieldHeight)];
            line.backgroundColor = grayC;
            [self.passwordField addSubview:line];
            
            //密码点的坐标
            CGFloat dotX = (i+1)*fieldWidth-fieldWidth/2-dotsWidth_Height/2;
            CGFloat dotY = (fieldHeight-dotsWidth_Height)/2;
            UIView *dotView = [[UIView alloc]initWithFrame:CGRectMake(dotX, dotY, dotsWidth_Height, dotsWidth_Height)];
            dotView.backgroundColor = MainColor;
            dotView.layer.cornerRadius = dotsWidth_Height/2;
            dotView.hidden = YES;
            [_passwordField addSubview:dotView];
            [self.dotArr addObject:dotView];
        }

    }
    return _passwordField;
}

-(void)passwordFieldDidChange:(TyTextField *)textField{
//    HWLog(@"%@",textField.text);
    
    for (UIView *dotView in self.dotArr) {
        dotView.hidden = YES;
    }
    for (int i = 0; i < textField.text.length; i++) {
        ((UIView *)[self.dotArr objectAtIndex:i]).hidden = NO;
    }
    if (textField.text.length == dotsCount) {
        HWLog(@"输入完毕");
    }
    
    if ([_delegate respondsToSelector:@selector(passwordFieldDidChange:)]) {
        [_delegate passwordFieldDidChange:textField];
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        return NO;
    }
    else if (string.length == 0){
        return YES;
    }
    else if (self.passwordField.text.length >= dotsCount) {
        return NO;
    }
    else{
        return YES;
    }
}


@end
