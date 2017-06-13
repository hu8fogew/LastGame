//
//  VtPerSendViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "VtPerSendViewController.h"

@interface VtPerSendViewController ()<UITableViewDelegate,UITableViewDataSource,EditingControllerBackStringDelegate>

@property (strong,nonatomic) UITableView *tableView;

//项目
@property (strong,nonatomic) NSMutableArray *projectTitleAry;
@property (strong,nonatomic) NSMutableArray *projectSLabAry;

//同城路演
@property (strong,nonatomic) NSMutableArray *tclyTitleAry;
@property (strong,nonatomic) NSMutableArray *tclySLabAry;

@property (strong,nonatomic) UIView *footerView;

@end


@implementation VtPerSendViewController

id vtSCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    
    self.projectTitleAry = [NSMutableArray arrayWithObjects:@"主题",@"领域",@"区域",@"融资轮次",@"融资额度",@"运营状态",@"项目标签",@"项目详情", nil];
    self.projectSLabAry = [NSMutableArray arrayWithObjects:@"请填写",@"请选择",@"请选择",@"请选择",@"请填写(单位万元)",@"请选择",@"请填写(用逗号隔开)",@"请填写", nil];
    
    self.tclyTitleAry = [NSMutableArray arrayWithObjects:@"主题",@"区域",@"地址",@"开始时间",@"结束时间",@"主办方",@"详情",@"图片", nil];
    self.tclySLabAry = [NSMutableArray arrayWithObjects:@"请填写",@"请选择",@"请填写",@"请选择",@"请选择",@"请填写",@"请填写",@"请上传", nil];
    
    [self setupNavigationItem];
}

#pragma mark ---------setNavigation
- (void)setupNavigationItem {
    NSArray *arr = @[@"发布项目",@"同城路演"];
    NSString *prefix = arr[self.vtPerIndex];
    
    NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:prefix];
        [string addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:MTitleSize+1] range:[prefix rangeOfString:prefix]];
    [string addAttribute:NSForegroundColorAttributeName value:whiteC range:[prefix rangeOfString:prefix]];

    //创建label
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.attributedText = string;
    titleLabel.numberOfLines = 0;
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.width = 100;
    titleLabel.height = 44;
    self.navigationItem.titleView = titleLabel;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelClick)];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
}
//取消编辑
-(void)cancelClick
{
    [self.view endEditing:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark /---------footerView----------/
-(UIView *)footerView{
    if (!_footerView) {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 120)];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitle:@"保存" forState:UIControlStateNormal];
        btn.backgroundColor = blueC;
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 3;
        [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
        [_footerView addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.and.bottom.equalTo(_footerView);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-30, formBtnHeight));
            
        }];
    }
    return _footerView;
}

//发布按钮跳转
-(void)btnAction:(UIButton *)btn{
    HWLog(@"发布");
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark /----------tableView-----------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        
        _tableView.separatorStyle = NO;
        
        _tableView.sectionFooterHeight = 0;
        _tableView.backgroundColor = whiteC;
        
        _tableView.tableFooterView = self.footerView;
        _tableView.tableFooterView.height = self.footerView.height;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.vtPerIndex == 0) {
        return 2;
    }
    
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.vtPerIndex == 0) {
        if (section == 0) {
            return self.projectTitleAry.count;
        }
        return 1;
    }
    else{
        return self.tclyTitleAry.count;
    }
    
}

//自定义分组头视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, topToMargin)];
    headView.backgroundColor = grayC;
    
    return headView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return topToMargin;

    }
    return leftToMargin;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    YCYMFormTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ce"];
    cell = [[YCYMFormTableViewCell alloc]initWithFrame:cell.bounds];
    vtSCell = cell;
    if (self.vtPerIndex == 0) {
        if (indexPath.section == 0) {
            cell.titleLabel.text = self.projectTitleAry[indexPath.row];
            cell.selectLabel.text = self.projectSLabAry[indexPath.row];
        }
        else{
            AddTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ci"];
            cell = [[AddTableViewCell alloc]initWithFrame:cell.bounds];
            cell.addLabel.text = @"添加融资历史" ;
            cell.addLabel.textColor = blueC;
            cell.addImage.image = [UIImage imageNamed:@"bPlusIcon"];
            vtSCell = cell;
        }
    }
    else{
        cell.titleLabel.text = self.tclyTitleAry[indexPath.row];
        cell.selectLabel.text = self.tclySLabAry[indexPath.row];
    }
    
    return vtSCell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (self.vtPerIndex == 0) {
        EditingController *editVC = [EditingController new];
        editVC.selectIndex = indexPath.row;
        editVC.kindTitle = self.projectTitleAry[indexPath.row];
        editVC.delegate = self;
        
        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVC];
        if (indexPath.section == 0) {
            if (indexPath.row==0||indexPath.row==4||indexPath.row==6||indexPath.row==7) {
                [self presentViewController:vc animated:YES completion:nil];
            }
            else{
                NSArray *filedAry = @[@"移动互联网",@"金融",@"企业服务",@"教育",@"医疗健康",@"旅游"];
                NSArray *zoneAry = @[@"西安",@"杭州",@"北京",@"上海",@"深圳",@"厦门"];
                NSArray *roundAry = @[@"种子轮",@"天使轮",@"A轮",@"B轮"];
                NSArray *typeAry = @[@"已运营",@"未运营"];
                
                NSMutableArray *array = [NSMutableArray arrayWithObjects:@[],filedAry,zoneAry,roundAry,@[],typeAry, nil];
                
                SingleSelectView *single = [[SingleSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectTtitle:self.projectTitleAry[indexPath.row] TitleArr:array[indexPath.row]];
                [single showView:^(NSString *singleStr) {
                    
                    [self.projectSLabAry replaceObjectAtIndex:indexPath.row withObject:singleStr];
                    [self.tableView reloadData];
                    
                }];
            }
        }
        if (indexPath.section == 1) {
            FundHistoryViewController *vc = [FundHistoryViewController new];
            MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:vc];
            [self presentViewController:nav animated:YES completion:^{
                
            }];
        }
    }
    else{
        EditingController *editVC = [EditingController new];
        editVC.kindTitle = self.tclyTitleAry[indexPath.row];
        editVC.selectIndex = indexPath.row;
        editVC.delegate = self;
        
        MainNavigationController *vc = [[MainNavigationController alloc]initWithRootViewController:editVC];
        if (indexPath.row==0||indexPath.row==2||indexPath.row==5||indexPath.row==6) {
            [self presentViewController:vc animated:YES completion:nil];
        }
        if (indexPath.row == 1) {
            AddressSelectView *address = [[AddressSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectCityTtitle:@"区域"];
            [address showCityView:^(NSString *proviceStr, NSString *cityStr, NSString *disStr) {
                [self.tclySLabAry replaceObjectAtIndex:1 withObject:[NSString stringWithFormat:@"%@",cityStr]];
                [self.tableView reloadData];
            }];
        }
        
        if (indexPath.row==3||indexPath.row==4) {
            DateSelectView *date = [[DateSelectView alloc]initWithFrame:SCREEN_BOUNDS SelectDateTtitle:@"时间"];
            [date showDateView:^(NSString *selectStr) {
                [self.tclySLabAry replaceObjectAtIndex:indexPath.row==3?3:4 withObject:selectStr];
                [self.tableView reloadData];
            }];
        }
        else{
            
        }
    }
}

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index{
//    if (self.vtPerIndex == 0) {
//        if (![editVc.editText isEqualToString:@""]) {
//            if (index == 0) {
//                [self.projectSLabAry replaceObjectAtIndex:index withObject:editVc.editText];
//                [self.tableView reloadData];
//            }
//            
//        }
//    }
//    else{
//        if (![editVc.editText isEqualToString:@""]) {
//            [self.tclySLabAry replaceObjectAtIndex:index withObject:editVc.editText];
//            [self.tableView reloadData];
//        }
//    }
//    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
