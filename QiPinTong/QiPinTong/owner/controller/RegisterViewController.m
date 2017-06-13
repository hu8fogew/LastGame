//
//  RegisterViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate>

@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) UIView *bottomView;

@property (strong,nonatomic) UIButton *classBtn;

@end

@implementation RegisterViewController{
    //BOOL keyboardIsShowing;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"用户注册";

    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

#pragma mark 键盘出现
-(void)keyboardWillShow:(NSNotification *)note
{
    CGRect keyBoardRect = [note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, keyBoardRect.size.height+30, 0);
}

#pragma mark 键盘消失
-(void)keyboardWillHide:(NSNotification *)note
{
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
}

#pragma mark /------bottomView-------/
-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-SCREEN_HEIGHT/7-64, SCREEN_WIDTH, SCREEN_HEIGHT/7)];
        _bottomView.backgroundColor = whiteC;
        
        //其他方式登录
        UIButton *otherBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [otherBtn setTitle:@"已经是会员，请登录" forState:UIControlStateNormal];
        [otherBtn setTitleColor:HWColor(91, 85, 132) forState:UIControlStateNormal];
        otherBtn.titleLabel.font = [UIFont systemFontOfSize:18];
        [otherBtn addTarget:self action:@selector(clickOtherBtn) forControlEvents:UIControlEventTouchUpInside];
        [_bottomView addSubview:otherBtn];
        [otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_bottomView);
        }];
    }
    return _bottomView;
}

#pragma mark /------tableView-------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-SCREEN_HEIGHT/7)];
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
    return SCREEN_HEIGHT-SCREEN_HEIGHT/7-SCREEN_HEIGHT/6;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    RegisterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    if (cell == nil) {
        cell = [[RegisterTableViewCell alloc]initWithFrame:cell.bounds];
        [cell.classBtn addTarget:self action:@selector(clickClassBtn) forControlEvents:UIControlEventTouchUpInside];
        self.classBtn = cell.classBtn;
        [cell.commitBtn addTarget:self action:@selector(clickCommitBtn) forControlEvents:UIControlEventTouchUpInside];
        [cell.registerBtn addTarget:self action:@selector(clickregisterBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;
}

#pragma mark *****类别选择******
-(void)clickClassBtn{
    HWLog(@"选择");
    SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) SelectTtitle:@"类别" TitleArr:@[@"个人",@"企业"]];
    [single showView:^(NSString *singleStr) {
        [self.classBtn setTitle:singleStr forState:UIControlStateNormal];
    }];
}

/*获取验证码*/
-(void)clickCommitBtn{
    HWLog(@"获取验证码");

}

/*注册按钮*/
-(void)clickregisterBtn{
    
    HWLog(@"注册");

}

/*会员登录*/
-(void)clickOtherBtn{
    HWLog(@"会员登录");
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
