//
//  MemberCenterViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/11.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "PerOrComViewController.h"
#import "CCPActionSheetView.h"
#import "TipUserController.h"
@interface PerOrComViewController ()<UITableViewDelegate,UITableViewDataSource,PersonShowViewDelegate,HeaderViewDelegate,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;

@property (strong,nonatomic) HeaderView *hVc;
@property (nonatomic,strong) PersonShowView *selectShowView;

//模式状态
@property (strong,nonatomic) UIView *coverView;
@property (strong,nonatomic) UIView *modeView;


@property (nonatomic,assign) BOOL person;
@property (nonatomic,assign) BOOL company;
@property (nonatomic,assign) BOOL business;


@end

@implementation PerOrComViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"会员中心";
    
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

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:YES];
    
    if (![QPTUserInfoManager sharedUserInfoManager].isLogin) {
        
        [self.hVc.typeBtn setTitle:@"请登陆，与企聘通零接触!" forState:UIControlStateNormal];
        
    }else
    {
        [self.hVc.typeBtn setTitle:@"兰花草" forState:UIControlStateNormal];
        [self.hVc.typeBtn setTitleColor:whiteC forState:UIControlStateNormal];
    }
    
    self.person = [QPTUserInfoManager sharedUserInfoManager].isPerson;
    self.company = [QPTUserInfoManager sharedUserInfoManager].isCompany;
    self.business = [QPTUserInfoManager sharedUserInfoManager].isBusiness;
    
    //修改个人&企业身份
    [self.view addSubview:self.tableView];
    
    if ([QPTUserInfoManager sharedUserInfoManager].isPerson) {
        NSArray *arrS = @[
                          @{@"number":@"3",
                            @"title":@"投递记录"},
                          @{@"number":@"10",
                            @"title":@"待面试"},
                          @{@"number":@"6",
                            @"title":@"收藏"},
                          @{@"number":@"1",
                            @"title":@"粉丝"}];
        self.selectShowView.titleArr = arrS;
        
    }
    else{
        NSArray *arrF = @[
                          @{@"number":@"1",
                            @"title":@"职位"},
                          @{@"number":@"2",
                            @"title":@"简历"},
                          @{@"number":@"3",
                            @"title":@"收藏"},
                          @{@"number":@"4",
                            @"title":@"粉丝"}];
        self.selectShowView.titleArr = arrF;
        
    }
    [self.headerView addSubview:self.selectShowView];
    
}

-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:YES];
    
    [self.tableView removeFromSuperview];
    self.tableView = nil;
    
    [self.selectShowView removeFromSuperview];
    
    self.selectShowView = nil;
    
    HWLog(@"%@",self.tableView);
}


#pragma mark /**--------headerView-------**/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.3)];
        HeaderView *vi = [[HeaderView alloc]initWithFrame:_headerView.bounds];
        [_headerView addSubview:vi];
        vi.backImgView.image = [UIImage imageNamed:@"bg"];
        vi.imgView.image = [UIImage imageNamed:@"perImage.jpg"];
        vi.delegate = self;
        self.hVc = vi;
    }
    return _headerView;
}


-(void)typeBtnClick{
    HWLog(@"登录");
    
    [self loginAction];
    
}
#pragma mark ******模式选择
-(void)setOwnerImage
{
    [self loginAction];
    
    if (self.loginOrNot) {
        HWLog(@"模式");
        
        [self.view addSubview:self.coverView];
        
    }
}

#pragma mark ---------模式状态****
-(UIView *)coverView{
    if (!_coverView) {
        _coverView = [[UIView alloc]initWithFrame:self.view.bounds];
        _coverView.backgroundColor = [MainColor colorWithAlphaComponent:0.7];
        
        [_coverView addSubview:self.modeView];
    }
    return _coverView;
}
-(UIView *)modeView{
    if (!_modeView) {
        _modeView = [[UIView alloc]initWithFrame:CGRectMake(20, SCREEN_HEIGHT*0.3-32, SCREEN_WIDTH-40, SCREEN_HEIGHT*0.4)];
        _modeView.backgroundColor = grayC;
        
        UIView *fv = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _modeView.width, _modeView.height*0.28)];
        fv.backgroundColor = whiteC;
        [_modeView addSubview:fv];
        
        [fv addSubview:({
            UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            closeBtn.frame = CGRectMake(self.modeView.width-35, 10, 22, 22);
            closeBtn.adjustsImageWhenHighlighted = NO;
            [closeBtn setImage:[UIImage imageNamed:@"rClose_gray"] forState:UIControlStateNormal];
            [closeBtn addTarget:self action:@selector(closeBtnClick) forControlEvents:UIControlEventTouchUpInside];
            closeBtn;
        })];
        
        //模式状态
        UILabel *title = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize+2 Sview:fv];
        title.font = [UIFont boldSystemFontOfSize:MTitleSize+2];
        title.text = @"模式状态";
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(fv);
        }];
        
        UIView *vv = [UIView new];
        for (int i = 0; i<3; i++) {
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, fv.botoom+1+40*i+i*leftToMargin, _modeView.width, 40)];
            view.backgroundColor = whiteC;
            vv = view;
            
            UILabel *lab = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:view];
            lab.font = [UIFont boldSystemFontOfSize:MTitleSize];
            lab.text = @[@"简历",@"合伙人",@"达人帮"][i];
            [lab mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.mas_equalTo(topToMargin);
                make.centerY.equalTo(view);
            }];
            
            LQXSwitch *switchBtn = [[LQXSwitch alloc]initWithFrame:CGRectMake(_modeView.width-50, 10, 40, 20) onColor:blueC offColor:grayC font:[UIFont systemFontOfSize:MTitleSize] ballSize:20];
            switchBtn.tag = i;
            
            [switchBtn addTarget:SecondTitleColor action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
            [view addSubview:switchBtn];
            
            [_modeView addSubview:view];
        }
        
        UIView *sv = [[UIView alloc]initWithFrame:CGRectMake(0, vv.botoom+1, _modeView.width, _modeView.height-vv.botoom-1)];
        sv.backgroundColor = whiteC;
        [_modeView addSubview:sv];
        
    }
    return _modeView;
}

-(void)switchValueChanged:(UISwitch *)sender{
    if (sender.tag == 0) {
        if (sender.isOn) {
            HWLog(@"on0");
        }
        else{
            HWLog(@"off0");
        }
    }
    if (sender.tag == 1) {
        if (sender.isOn) {
            HWLog(@"on1");
        }
        else{
            HWLog(@"off1");
        }
    }
    if (sender.tag == 2) {
        if (sender.isOn) {
            HWLog(@"on2");
        }
        else{
            HWLog(@"off2");
        }
    }
    
}

-(void)closeBtnClick{
    [self.coverView removeFromSuperview];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    CGPoint point = [[touches anyObject] locationInView:self.coverView];
    if (!CGRectContainsPoint(self.modeView.frame, point)) {
        [self.coverView removeFromSuperview];
    }
}

-(void)editOwnerInformation
{
    HWLog(@"编辑个人信息");
    [self loginAction];
    if (self.loginOrNot) {
        PerEditController *perEdit = [PerEditController new];
        ComEditViewController *comEdit = [ComEditViewController new];
        StoreEditViewController *storeEdit = [StoreEditViewController new];
        if (self.person||self.company) {
            [self.navigationController pushViewController:self.person?perEdit:comEdit animated:YES];
        }else{
            [self.navigationController pushViewController:storeEdit animated:YES];
        }
    }
}

/**/
-(PersonShowView *)selectShowView
{
    if (!_selectShowView) {
        _selectShowView = [[PersonShowView alloc]initWithFrame:CGRectMake(0, self.hVc.botoom, SCREEN_WIDTH,SCREEN_WIDTH*0.18)];
        _selectShowView.backgroundColor = whiteC;
        _selectShowView.delegate = self;
        
    }
    return _selectShowView;
}

#pragma mark /------关注、发布简历等动作-------/
-(void)didSelectButton:(NSInteger)index
{
    [self loginAction];
    if (self.loginOrNot) {
        if (index == 103) {
            FunsViewController *vc = [FunsViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else if (index==100&&self.company){
            PostManageViewController *vc = [PostManageViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
        else{
            id classVc = nil;
            PerShowViewController *personVC = [PerShowViewController new];
            personVC.selectIndex = index;
            ComShowViewController *companyVC = [ComShowViewController new];
            companyVC.selectIndex = index;
            classVc = self.person ? personVC : companyVC;
            [self.navigationController pushViewController:classVc animated:YES];
        }
    }
}

#pragma mark /**---------tableview及方法---------**/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = grayC;
        _tableView.separatorStyle = NO;
        _tableView.scrollEnabled = YES;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.selectShowView.botoom;
    }
    return _tableView;
}

//返回分组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.business) {
        return 4;
    }
    return 5;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //返回行数
    NSInteger rows = 0;
    
    //根据不同分组 返回不同行数
    switch (section) {
        case 0:
            rows= (self.person || self.business) ? 2 : 1;//商户和个人在0区均为2
            break;
        case 1:
            rows= (self.company || self.business) ? 3 : 1;//企业和商户在1区均为3
            break;
        case 2:
            if (self.person ) {
                rows = 2;
            }else if (self.company){
                rows = 3;
            }else{
                rows = 1;
            }
            break;
        case 3:
            rows=1;//切换身份
            break;
        default:
            rows = 1;//设置
            break;
    }
    
    return rows;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 10;
    }
    else{
        return 5;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 4) {
        return 10;
    }else
    {
        return 5;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    DiscoverTableViewCell *cell = [[DiscoverTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellDis"];
    
    switch (section) {
        case 0:
            if (self.person || self.business) {
                switch (row){
                    case 0:
                        [self configerCell:cell andTitle:self.person?@"钱包":@"账户余额"  andImage:@"wallet_image" andShowTitle:self.person?nil:@"23" andTextColor:self.person?clearC:MainColor];
                        break;
                    default:
                        [self configerCell:cell andTitle:self.person?@"币斗":@"收款功能"  andImage:self.person?@"coindou_image":@"code_image"andShowTitle:self.person?nil:@"去激活" andTextColor:self.person?clearC:orangeC];
                        break;
                }
            }
            else{
                [self configerCell:cell andTitle:@"账户余额"  andImage:@"wallet_image" andShowTitle:@"23" andTextColor:MainColor];
            }
            break;
            
            ///
        case 1:
            if (self.business || self.company) {
                switch (row){
                    case 0:
                        [self configerCell:cell andTitle:@"客户库" andImage:@"helper_image" andShowTitle:nil andTextColor:clearC];
                        break;
                    case 1:
                        [self configerCell:cell andTitle:@"共享达人帮" andImage:@"drbhticon" andShowTitle:@"去激活" andTextColor:orangeC];
                        break;
                    default:
                        [self configerCell:cell andTitle:@"简历库" andImage:@"resume_image" andShowTitle:nil andTextColor:clearC];
                        break;
                }
            }
            else{
                [self configerCell:cell andTitle:@"共享达人帮" andImage:@"drbhticon" andShowTitle:@"去开通" andTextColor:orangeC];
            }
            break;
            
            ///
        case 2:
            if (self.company) {
                switch (row) {
                    case 0:
                        [self configerCell:cell andTitle:self.company?@"我的助手":@"客户库" andImage:self.company? @"helper_image":@"helper_image" andShowTitle:nil andTextColor:clearC];
                        break;
                    case 1:
                        [self configerCell:cell andTitle:self.company?@"我的二维码":@"共享达人帮" andImage:self.company?@"code_image":@"drbhticon" andShowTitle:self.company?nil:@"去激活" andTextColor:self.company?clearC:orangeC];
                        break;
                    default:
                        [self configerCell:cell andTitle:self.company?@"超级管理":@"简历库" andImage:self.company?@"manage_icon":@"resume_image" andShowTitle:nil andTextColor:clearC];
                        break;
                }
            }
            else if (self.person){
                switch (row) {
                    case 0:
                        [self configerCell:cell andTitle:@"我的二维码" andImage:@"code_image" andShowTitle:nil andTextColor:clearC];
                        break;
                    default:
                        [self configerCell:cell andTitle:@"超级管理" andImage:@"manage_icon" andShowTitle:nil andTextColor:clearC];
                        break;
                }
            }
            else{
                [self configerCell:cell andTitle:@"身份切换" andImage:@"qiehuansficon" andShowTitle:nil andTextColor:clearC];
            }
            break;
            
            ///
        case 3:
            if (self.person || self.company) {
                [self configerCell:cell andTitle:@"身份切换" andImage:@"qiehuansficon" andShowTitle:nil andTextColor:clearC];
            }
            else {
                [self configerCell:cell andTitle:@"设置" andImage:@"set_image" andShowTitle:nil andTextColor:clearC];
            }
            break;
            
            ///
        default:
            [self configerCell:cell andTitle:@"设置" andImage:@"set_image" andShowTitle:nil andTextColor:clearC];
            break;
    }
    
    return cell;
    
}

-(void)configerCell:(DiscoverTableViewCell *)cell andTitle:(NSString *)title andImage:(NSString *)imgStr andShowTitle:(NSString *)showTitle andTextColor:(UIColor *)textColor
{
    cell.icon.image = [UIImage imageNamed:imgStr];
    cell.title.text = title;
    cell.showLab.text = showTitle;
    cell.showLab.textColor = textColor;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WalletViewController *walletVC = [WalletViewController new];
    SuperManageViewController *manageVC = [SuperManageViewController new];
    CoinDouProfitViewController *coinDouVC = [CoinDouProfitViewController new];
    QR_CodeViewController *codeVC = [QR_CodeViewController new];
    MyHelperViewController *helperVC = [MyHelperViewController new];
    FeedbackViewController *feedbackVC = [FeedbackViewController new];
    ResumeLibraryViewController *resumeVC = [ResumeLibraryViewController new];
    TalentGangViewController *talentVC = [TalentGangViewController new];
    ClientLibraryViewController *clientVC = [ClientLibraryViewController new];
    TipUserController *vc = [TipUserController new];
    
    
    if (!self.loginOrNot) {
        [self loginAction];
    }else
    {
        if (indexPath.section == 0) {
            if (self.person || self.business) {//商户和个人
                if (indexPath.row == 0) {
                    [self.navigationController pushViewController:self.person ? walletVC :walletVC animated:YES];//账户余额&&钱包
                    walletVC.navigationItem.title = self.person?@"我的钱包":@"账户";
                }else
                {
                    [self.navigationController pushViewController: self.person ? coinDouVC:feedbackVC animated:YES];//币斗&&收款功能
                }
                
            }else//企业
            {
                [self.navigationController pushViewController:walletVC animated:YES];//账户余额
                walletVC.navigationItem.title = @"账户";
            }
        }
        
        if (indexPath.section == 1) {
            if (self.business || self.company) {//商户&&企业
                if (indexPath.row == 0) {
                    [self.navigationController pushViewController:clientVC animated:YES];
                }else if (indexPath.row == 1) {
                    [self.navigationController pushViewController:talentVC animated:YES];
                }else {
                    [self.navigationController pushViewController:resumeVC animated:YES];
                }
            }
            else {//个人
//                [self.navigationController pushViewController:talentVC animated:YES];//跳转至达人帮
                [self.navigationController pushViewController:vc animated:YES];//激活页面
                
            }
        }
        //
        if (indexPath.section == 2) {
            if (self.business) {//商户
                IdentitySwitchViewController *vc = [IdentitySwitchViewController new];
                MainNavigationController *navi = [[MainNavigationController alloc]initWithRootViewController:vc];
                [self presentViewController:navi animated:YES completion:nil];
            }
            else if (self.person){//个人
                if (indexPath.row == 0) {
                    [self.navigationController pushViewController:codeVC animated:YES];
                }else
                {
                    [self.navigationController pushViewController:manageVC animated:YES];
                }
            }
            else{//企业
                if (indexPath.row == 0) {
                    [self.navigationController pushViewController:helperVC animated:YES];
                    
                }else if (indexPath.row == 1){
                    [self.navigationController pushViewController:codeVC animated:YES];
                    
                }else {
                    [self.navigationController pushViewController:manageVC animated:YES];
                }
            }
        }
        if (indexPath.section == 3) {//身份切换
            if (self.company || self.person) {
                IdentitySwitchViewController *vc = [IdentitySwitchViewController new];
                MainNavigationController *navi = [[MainNavigationController alloc]initWithRootViewController:vc];
                [self presentViewController:navi animated:YES completion:nil];
            }
            else{
                SetViewController *setVC = [SetViewController new];
                [self.navigationController pushViewController:setVC animated:YES];
            }
        }
        if (indexPath.section == 4) {
            SetViewController *setVC = [SetViewController new];
            [self.navigationController pushViewController:setVC animated:YES];
        }
        
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
