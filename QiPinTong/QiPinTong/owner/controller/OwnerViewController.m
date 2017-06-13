//
//  OwnerViewController.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "OwnerViewController.h"
#import "JWShareView.h"
#import "WXApiRequestHandler.h"
#import "WXApiManger.h"
#import "QPTCommonConstant.h"
#import "QPTCommonAPIConstant.h"


/** 由用户微信号和AppID组成的唯一标识，发送请求时第三方程序必须填写，用于校验微信用户是否换号登录*/
static NSString *kAuthState = @"346782";



@interface OwnerViewController ()<UIGestureRecognizerDelegate,UITableViewDelegate,UITableViewDataSource,WXApiManagerDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (nonatomic,copy) NSString *strToken;
@property (nonatomic,copy) NSString *strOpenId;
@property (nonatomic,copy) NSString *strUserOpenUrl;
@property (strong,nonatomic) UIView *bottomView;

@end

@implementation OwnerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"用户登录";
    self.view.backgroundColor = whiteC;
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    

    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    [WXApiManger sharedManager].delegate = self;
    [self setUpNavigationView];
}


-(void) setUpNavigationView
{
    
    UIBarButtonItem *item = [UIBarButtonItem itemWithTarget:self action:@selector(cancelClick) image:@"" highImage:@"" andTitle:@"取消"];
    self.navigationItem.rightBarButtonItem = item;
    
}

#pragma mark =====取消登录
-(void)cancelClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

//右滑返回
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-SCREEN_HEIGHT/7-49-64, SCREEN_WIDTH, SCREEN_HEIGHT/7)];
        _bottomView.backgroundColor = whiteC;
        
        //其他方式登录
        UIButton *otherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [otherBtn setTitle:@"其他方式登录" forState:UIControlStateNormal];
        [otherBtn setTitleColor:HWColor(91, 85, 132) forState:UIControlStateNormal];
        otherBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
        [otherBtn addTarget:self action:@selector(clickOtherBtn:) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:otherBtn];
        
        [otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_bottomView);
            
        }];
        
    }
    return _bottomView;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_HEIGHT/7-49)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
        
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return SCREEN_HEIGHT-SCREEN_HEIGHT/7-49-SCREEN_HEIGHT/6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    OwnerMainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    if (cell == nil) {
        cell = [[OwnerMainTableViewCell alloc]initWithFrame:cell.bounds];
        [cell.loginBtn addTarget:self action:@selector(clickLoginBtn:) forControlEvents:UIControlEventTouchUpInside];
        cell.loginBtn.selected = NO;
        [cell.retrievePwdBtn addTarget:self action:@selector(clickRetrievePwd) forControlEvents:UIControlEventTouchUpInside];
        [cell.registerBtn addTarget:self action:@selector(clickRetgisterBtn) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return cell;
}


#pragma mark _____登录
//点击登录按钮
-(void)clickLoginBtn:(UIButton *)sender{
    
    
    sender.selected = !sender.selected;
    
    [[QPTUserInfoManager sharedUserInfoManager] didLoginIn];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark ____找回密码
//点击找回密码
-(void)clickRetrievePwd{
    RetrievePwdViewController *vc = [RetrievePwdViewController new];
    [self.navigationController pushViewController:vc animated:YES
     ];
}

#pragma mark _____用户注册
//点击用户注册
-(void)clickRetgisterBtn{
    RegisterViewController *vc = [RegisterViewController new];
    [self.navigationController pushViewController:vc animated:YES
     ];
}

#pragma mark _____其它方式登录
//点击其他方式登录
-(void)clickOtherBtn:(UIButton *)sender
{
    NSArray *contentArray = @[@{@"name":@"QQ",@"icon":@"qq_icon"},
                              @{@"name":@"微信",@"icon":@"weixin_icon"},
                              @{@"name":@"新浪微博",@"icon":@"weibo_icon"},
                              ];
    JWShareView *shareView = [[JWShareView alloc] init];
    [shareView addShareItems:self.view shareItems:contentArray selectShareItem:^(NSInteger tag, NSString *title) {
        switch (tag) {
            case 0:
                //QQ授权登录
                [LWAlertView shoWithMessage:@"请尝试微信登陆"];
                break;
            case 1:
                //微信授权登录
                [WXApiRequestHandler sendAuthRequestScope:QPTWXScope State:kAuthState OpenID:QPTWXAppID InViewController:self];
                break;
            case 2:
                //微博授权登录
                [LWAlertView shoWithMessage:@"请尝试微信登陆"];
                break;
            default:
                break;
        }
        NSLog(@"%ld --- %@", tag, title);
    }];
}


#pragma mark ________第三方授权登录
//微信第三方登录回应
-(void)managerDidRecvAuthResponse:(SendAuthResp *)response
{
    
    //    NSString *strTitle = [NSString stringWithFormat:@"Auth结果"];
#pragma mark +++++++++++++获取微信接口的方法步骤++++++++++++++
    //********第一步*********获取    code
    
    NSString *strMsg = [NSString stringWithFormat:@"code:%@,state:%@,errcode:%d",response.code,response.state,response.errCode];
    
    HWLog(@"第一步%@",strMsg);
    
    //********第二步*********获取    access_token
    //参数：appid、appSecrect、code、grant_type(authorization_code)
    NSString *str = @"authorization_code";
    NSString *accessUrl = [QPTGETWX_access_tokenAPI stringByAppendingFormat:@"appid=%@&secret=%@&code=%@&grant_type=%@",QPTWXAppID,QPTWXApiSecret,response.code,str];
    NSLog(@"+++++++++++%@",accessUrl);
    
    [QPTRequestManager GET:accessUrl parameters:nil responseSeialilzerType:QPTResponseSeializerTypeJSON success:^(id responseObject) {
        
        HWLog(@"success:======%@",responseObject);
        
//        dispatch_async(dispatch_get_main_queue(), ^{
            
//            self.strToken = [responseObject objectForKey:@"access_token"];
//            self.strOpenId = [responseObject objectForKey:@"openid"];
            NSString *openid = [responseObject objectForKey:@"openid"];
            
            NSString *token = [responseObject objectForKey:@"access_token"];
            
            NSString *userUrl = [QPTGETWX_PersonInformationAPI stringByAppendingFormat:@"access_token=%@&openid=%@",token,openid];
            
            self.strUserOpenUrl = userUrl;
        [QPTRequestManager GET:self.strUserOpenUrl parameters:nil responseSeialilzerType:QPTResponseSeializerTypeJSON success:^(id responseObject) {
            
            HWLog(@"sucess***************%@",responseObject);
            
            NSString *strName = [responseObject objectForKey:@"nickname"];
            
            HWLog(@"%@",[strName stringByRemovingPercentEncoding]);
            
        } failure:^(NSError *error) {
            HWLog(@"faulse == %@",error);
        }];
        
        
        HWLog(@"=====----------%@",userUrl);
            
//        });
        
    } failure:^(NSError *error) {
        
        
        HWLog(@"fail:=======%@",error);
        
    }];
    HWLog(@"当前的线程================%@",[NSThread currentThread]);
    //********第三步*********获取    微信用户信息
    //参数：access_token、openid
    
    
//    [QPTRequestManager GET:self.strUserOpenUrl parameters:nil responseSeialilzerType:QPTResponseSeializerTypeJSON success:^(id responseObject) {
//        
//        HWLog(@"sucess***************%@",responseObject);
//        
//    } failure:^(NSError *error) {
//        HWLog(@"faulse == %@",error);
//    }];
//
        
    
    
    //https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
    //    token :3ZhtKNH0GTuCMmOdenAd4WZd7jshalx0N68Opwtzt6t7tZ6iDzYXj5Zx0XI8pHzSF1h4lv6p1S9C1t28FGArBihNe9pSoJ_VTEKWVZalUW0
    //    openid : odgxZ0g5XRf8Xps1pGi90MVcBmEo
#pragma mark -----WXApiSecret : d0e8e1c22b1f93f796057ca7fe2c4805
    //    {"errcode":40002,"errmsg":"invalid grant_type, hints: [ req_id: cniRwA0229th20 ]"}
    
#pragma mark --https://api.weixin.qq.com/sns/oauth2/access_token?appid=wxd169198a79aaa674&secret=d0e8e1c22b1f93f796057ca7fe2c4805&code=001nZUhM1l4uE314YykM1Q6biM1nZUh7&grant_type=authorization_code
    
    /*
     https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID
     */
    
    //    https://api.weixin.qq.com/sns/userinfo?access_token=3ZhtKNH0GTuCMmOdenAd4WZd7jshalx0N68Opwtzt6t7tZ6iDzYXj5Zx0XI8pHzSF1h4lv6p1S9C1t28FGArBihNe9pSoJ_VTEKWVZalUW0&openid=odgxZ0g5XRf8Xps1pGi90MVcBmEo
    //    http://wx.qlogo.cn/mmopen/fWJhv9xMFTsm2Rhw7K7Ptzq8iaX99S0jOcxlV0Oic8wUoJAB1ibVrtFWvITwBHos9llpN3YgeNO1oORebPFkyumK5BaVY6FISqU/0
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
