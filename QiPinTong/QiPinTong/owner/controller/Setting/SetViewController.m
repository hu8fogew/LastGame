//
//  ViewController.m
//  QiPinTong
//
//  Created by mac on 2017/2/13.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SetViewController.h"
#import "UIWindow+MainWindow.h"
@interface SetViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"设置";

    [self.view addSubview:self.tableView];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}


#pragma mark /--------tableView--------/
-(UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.backgroundColor = grayC;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = NO;
    }
    
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 1) {
        return 1;
    }
    return 3;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
    
    NSInteger row = indexPath.row;
    NSInteger section = indexPath.section;
    if (section == 0) {
        if (row == 0) {
            cell.titleLabel.text = @"修改手机号";
        }else if (row == 1)
        {
            cell.titleLabel.text = @"设置密码";
        }else{
            cell.titleLabel.text =@"设置支付密码";
        }
    }
    if (section == 1) {
         cell.exitLab.text = @"退出登录";
        cell.arrowIcon.image = [UIImage imageNamed:@""];
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return formCellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return topToMargin;
    }
    return leftToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 5;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            PhoneBindViewController *bVC = [PhoneBindViewController new];
//            PhoneModifyViewController *mVC = [PhoneModifyViewController new];
            [self.navigationController pushViewController:bVC animated:YES];
        }
        else if (indexPath.row == 1){
            PasswordSetViewController *sVC = [PasswordSetViewController new];
//            PasswordModifyViewController *dVC = [PasswordModifyViewController new];
            [self.navigationController pushViewController:sVC animated:YES];
        }else
        {
            PayPwdSetViewController *vc = [PayPwdSetViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
    
    else{
//        [LWAlertView shoWithMessage:@"退出登录"];
        
        //退出登录
        [[QPTUserInfoManager sharedUserInfoManager] didLoginOut];
        
    
        [UIView animateWithDuration:2.0f animations:^{
            
            [MBProgressHUD showLoading:@"正在退出登录" toView:self.view];
            
        } completion:^(BOOL finished) {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
            UIWindow *window = [UIApplication sharedApplication].keyWindow;
            
            [window backMainRootViewController];
            
        }];
        
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
