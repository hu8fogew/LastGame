//
//  PayPwdSetViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/6/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PayPwdSetViewController.h"

@interface PayPwdSetViewController ()<UITextFieldDelegate>


@end

@implementation PayPwdSetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"支付密码";
    self.view.backgroundColor = grayC;
    [self.view addSubview:self.textField];
    [self.view addSubview:self.titleLab];
        [self addDotsViews];
    
}

#pragma mark -------密码点--------
-(void)addDotsViews{
    //密码输入框的宽度
    CGFloat fieldWidth = CGRectGetWidth(self.textField.frame)/dotCount;
    //密码输入框的高度
    CGFloat fieldHeight = CGRectGetHeight(self.textField.frame);
    
    for (int i = 0; i < dotCount; i++) {
        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(i*fieldWidth, 0, 1, fieldHeight)];
        line.backgroundColor = grayC;
        [self.textField addSubview:line];
        
        //密码点的坐标
        CGFloat dotX = (i+1)*fieldWidth-fieldWidth/2-dotWidth_Height/2;
        CGFloat dotY = (fieldHeight-dotWidth_Height)/2;
        UIView *dotView = [[UIView alloc]initWithFrame:CGRectMake(dotX, dotY, dotWidth_Height, dotWidth_Height)];
        dotView.backgroundColor = MainColor;
        dotView.layer.cornerRadius = dotWidth_Height/2;
        dotView.hidden = YES;
        [self.textField addSubview:dotView];
        [self.dotAry addObject:dotView];
    }
}

#pragma mark -------dotAry-------
-(NSMutableArray *)dotAry{
    if (!_dotAry) {
        _dotAry = [[NSMutableArray alloc]initWithCapacity:dotCount];
    }
    return _dotAry;
}

#pragma mark -----titleLab--------
-(UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+1 Sview:self.view];
        _titleLab.textAlignment = NSTextAlignmentCenter;
        _titleLab.text = @"设置支付密码";
        CGSize size = [_titleLab.text sizeWithFont:[UIFont systemFontOfSize:MTitleSize+1] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        _titleLab.frame = CGRectMake((SCREEN_WIDTH-size.width)/2, 60, size.width, 20);
    }
    return _titleLab;
}

#pragma mark ------textField---------
-(TyTextField *)textField{
    if (!_textField) {
        _textField = [[TyTextField alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-fieldWidth_Height*6)/2, 100, fieldWidth_Height*6, fieldWidth_Height)];
        _textField.delegate = self;
        _textField.backgroundColor = whiteC;
        _textField.textColor = clearC;
        _textField.tintColor = clearC;
        _textField.layer.borderColor = SecondTitleColor.CGColor;
        _textField.layer.borderWidth = 1;
        _textField.keyboardType = UIKeyboardTypePhonePad;
        _textField.secureTextEntry = YES;
        [_textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
        
        }
    return _textField;
}

-(void)textFieldDidChange:(UITextField *)textField{
    HWLog(@"%@",textField.text);
    
    for (UIView *dotView in self.dotAry) {
        dotView.hidden = YES;
    }
    for (int i = 0; i < textField.text.length; i++) {
        ((UIView *)[self.dotAry objectAtIndex:i]).hidden = NO;
    }
    if (textField.text.length == dotCount) {
        HWLog(@"输入完毕");
        PayPwdAgainViewController *vc = [PayPwdAgainViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        vc.password = textField.text;
    }
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    if ([string isEqualToString:@"\n"]) {
        return NO;
    }
    else if (string.length == 0){
        return YES;
    }
    else if (self.textField.text.length >= dotCount) {
        return NO;
    }
    else{
        return YES;
    }
}

-(void)clearUpPassword{
    self.textField.text = @"";
    [self textFieldDidChange:self.textField];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.textField becomeFirstResponder];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
