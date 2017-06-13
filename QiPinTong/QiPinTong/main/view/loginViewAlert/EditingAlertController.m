//
//  EditingAlertController.m
//  测试001
//
//  Created by mac on 2017/1/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "EditingAlertController.h"
#define GWYCELLBorderW 10
#define TABCEllHEIGHT 44.0
#define TitltViewHeight 40
#define ContactHeight   140
#define AddressHeight   240
@interface EditingAlertController ()
//用户名
@property(nonatomic,strong)UITextField *nameText;
//密码
@property(nonatomic,strong)UITextField *secretText;
//登录
@property(nonatomic,strong)UIButton *loginButton;
//注册
@property(nonatomic,strong)UIButton *signButton;
//找回密码
@property(nonatomic,strong)UIButton *findSecretButton;
@end

@implementation EditingAlertController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = HWColor(241, 241, 241);
    
    [self createView];
}

//添加视图
-(void)createView
{
    UIView *vf = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 58)];
    vf.backgroundColor = whiteC;
    [self.view addSubview:vf];
    //账户文字
    UILabel *num = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH/5, 40) andTextColor:HWColor(51, 51, 51) andTextFont:18];
    num.textAlignment = NSTextAlignmentRight;
    num.text = @"账号";
    [vf addSubview:num];
    //账户输入框
    _nameText = [[UITextField alloc]initWithFrame:CGRectMake(num.right+10, num.top, SCREEN_WIDTH*4/5-25, num.height)];
    _nameText.placeholder = @"手机号/邮箱账号";
    _nameText.backgroundColor = whiteC;
    _nameText.clearsOnBeginEditing = NO;
    _nameText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _nameText.font = [UIFont systemFontOfSize:16];
    [vf addSubview:_nameText];
    
    UIView *vs = [[UIView alloc]initWithFrame:CGRectMake(0, vf.botoom+1.5, SCREEN_WIDTH, 58)];
    vs.backgroundColor = whiteC;
    [self.view addSubview:vs];
    //账户文字
    UILabel *secretText = [[UILabel alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH/5, 40) andTextColor:HWColor(51, 51, 51) andTextFont:18];
    secretText.textAlignment = NSTextAlignmentRight;
    secretText.text = @"密码";
    [vs addSubview:secretText];
    //账户输入框
    _secretText = [[UITextField alloc]initWithFrame:CGRectMake(num.right+10, num.top, SCREEN_WIDTH*4/5-25, num.height)];
    _secretText.placeholder = @"请输入密码";
    _secretText.backgroundColor = whiteC;
    _secretText.clearsOnBeginEditing = YES;
    _secretText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _secretText.secureTextEntry = YES;
    _secretText.font = [UIFont systemFontOfSize:16];
    [vs addSubview:_secretText];
    
    UIView *vt = [[UIView alloc]initWithFrame:CGRectMake(0, vs.botoom+1.5, SCREEN_WIDTH, 150)];
    vt.backgroundColor = whiteC;
    vt.userInteractionEnabled = YES;
    [self.view addSubview:vt];
    //登录
    _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _loginButton.frame = CGRectMake(10, 15, SCREEN_WIDTH-20, 40);
    [_loginButton setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    _loginButton.backgroundColor = [UIColor blueColor];
    [_loginButton setTitle:@"登            录" forState:UIControlStateNormal];
    [_loginButton setTitleColor:whiteC forState:UIControlStateNormal];
    _loginButton.titleLabel.font = [UIFont systemFontOfSize:18];
    [_loginButton addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    [vt addSubview:_loginButton];
    //找回密码
    _findSecretButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _findSecretButton.frame = CGRectMake(_loginButton.left, _loginButton.botoom+15, (SCREEN_WIDTH-20)/2, 30);
    [_findSecretButton setTitle:@"找回密码" forState:UIControlStateNormal];
    [_findSecretButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _findSecretButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_findSecretButton addTarget:self action:@selector(findSecretClick:) forControlEvents:UIControlEventTouchUpInside];
    [vt addSubview:_findSecretButton];
    //注册
    _signButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _signButton.frame = CGRectMake(_findSecretButton.right, _findSecretButton.top, (SCREEN_WIDTH-20)/2, 30);
    [_signButton setTitle:@"立即注册" forState:UIControlStateNormal];
    [_signButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    _signButton.titleLabel.font = [UIFont systemFontOfSize:16];
    [_signButton addTarget:self action:@selector(signClick:) forControlEvents:UIControlEventTouchUpInside];
    [vt addSubview:_signButton];
}


#pragma mark --------登录、注册、忘记密码
-(void)loginClick:(UIButton *)sender
{
    
    if (_delegate && [_delegate respondsToSelector:@selector(ownerLogin)]) {
        [_delegate ownerLogin];
    }
    
}

-(void)findSecretClick:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(ownerFindSecretNum)]) {
        [_delegate ownerFindSecretNum];
    }
}

-(void)signClick:(UIButton *)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(ownerSign)]) {
        [_delegate ownerSign];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
