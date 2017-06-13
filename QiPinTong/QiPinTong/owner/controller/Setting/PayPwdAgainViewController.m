//
//  PayPwdAgainViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/6/2.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//


#import "PayPwdAgainViewController.h"

@interface PayPwdAgainViewController ()<UITextFieldDelegate>

@property (strong,nonatomic) UIButton *confirmBtn;

@end

@implementation PayPwdAgainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.titleLab.text = @"请再次输入";
    
    [self.view addSubview:self.confirmBtn];
    
}

//
-(void)textFieldDidChange:(UITextField *)textField{
    HWLog(@"%@",textField.text);
    
    for (UIView *dotView in self.dotAry) {
        dotView.hidden = YES;
    }
    for (int i = 0; i < textField.text.length; i++) {
        ((UIView *)[self.dotAry objectAtIndex:i]).hidden = NO;
    }
    
    if (textField.text.length < dotCount) {
        self.confirmBtn.selected = NO;
        self.confirmBtn.backgroundColor = [blueC colorWithAlphaComponent:0.3];
    }
    
    if (textField.text.length == dotCount) {
        HWLog(@"输入完毕");
        
        self.confirmBtn.backgroundColor = blueC;
        self.confirmBtn.selected = YES;
        
        if ([textField.text isEqualToString:self.password]) {
            HWLog(@"正确");
            
        }
        else{
            HWLog(@"error");
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"两次密码输入不一样" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                
                [self clearUpPassword];
                self.confirmBtn.selected = NO;
                self.confirmBtn.backgroundColor = [blueC colorWithAlphaComponent:0.3];
            }];
            
            [alert addAction:cancelAction];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }
    
}

#pragma mark ------确定按钮--------
-(UIButton *)confirmBtn{
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmBtn.frame = CGRectMake(self.textField.left, self.textField.botoom+30, self.textField.width, formBtnHeight);
        [_confirmBtn setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmBtn setTitleColor:whiteC forState:UIControlStateNormal];
        _confirmBtn.backgroundColor = [blueC colorWithAlphaComponent:0.3];
        _confirmBtn.layer.cornerRadius = 3;
        _confirmBtn.layer.masksToBounds = YES;
        _confirmBtn.selected = NO;
        [_confirmBtn addTarget:self action:@selector(confirmBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmBtn;
}

-(void)confirmBtnClick:(UIButton *)btn{
    if (btn.selected == YES) {
        HWLog(@"ssss");
        
        UIViewController *vc = self.navigationController.viewControllers[1];
        [self.navigationController popToViewController:vc animated:NO];
    }
    else{
        HWLog(@"111111");
    }
}

-(void)clearUpPassword{
    self.textField.text = @"";
    [self textFieldDidChange:self.textField];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
