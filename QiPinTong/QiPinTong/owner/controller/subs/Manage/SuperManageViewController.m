//
//  SuperManageViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/3.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SuperManageViewController.h"
@interface SuperManageViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;

@property (strong,nonatomic) UILabel *cityLab;

@end

@implementation SuperManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"超级管理";
    
    [self.view addSubview:self.tableView];
    
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
}

-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count==1) {
        return NO;
    }
    return YES;
}

#pragma mark /--------懒加载--------/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.5)];
        _headerView.backgroundColor = blueC;
        
        //用户总量
        UILabel *title = [UILabel labelWithTextColor:whiteC FontSize:mainTitleSize Sview:_headerView];
        title.text = @"用户总量";
        [title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headerView);
            make.top.mas_equalTo(_headerView.height/8);
        }];
        UILabel *titleNum = [UILabel labelWithTextColor:whiteC FontSize:23 Sview:_headerView];
        titleNum.text = @"23";
        titleNum.font = [UIFont systemFontOfSize:30 weight:UIFontWeightBold];
        [titleNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_headerView);
            make.top.equalTo(title.mas_bottom).with.offset(_headerView.height/10);
        }];
        
        //第一条竖线
        UIView *vv = [UIView new];
        vv.backgroundColor = whiteC;
        [_headerView addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(titleNum.mas_bottom).with.offset(_headerView.height/8);
            make.left.mas_equalTo(SCREEN_WIDTH/3);
            make.size.mas_equalTo(CGSizeMake(1, _headerView.height/5));
        }];
        
        //商户
        UILabel *store = [UILabel labelWithTextColor:whiteC FontSize:mainTitleSize Sview:_headerView];
        store.text = @"商户";
        [store mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(vv).offset(-5);
            make.centerX.equalTo(_headerView.mas_centerX).offset(-SCREEN_WIDTH/3);;
        }];
        UILabel *storeNum = [UILabel labelWithTextColor:whiteC FontSize:mainTitleSize Sview:_headerView];
        storeNum.font = [UIFont systemFontOfSize:23 weight:UIFontWeightRegular];
        storeNum.text = @"0";
        [storeNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(store);
            make.top.equalTo(store.mas_bottom).offset(leftToMargin);
            
        }];
        
        //企业
        UILabel *company = [UILabel labelWithTextColor:whiteC FontSize:mainTitleSize Sview:_headerView];
        company.text = @"企业";
        [company mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(store);
            make.centerX.equalTo(_headerView);
        }];
        UILabel *companyNum = [UILabel labelWithTextColor:whiteC FontSize:mainTitleSize Sview:_headerView];
        companyNum.font = [UIFont systemFontOfSize:23 weight:UIFontWeightRegular];
        companyNum.text = @"0";
        [companyNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(storeNum);
            make.centerX.equalTo(company);
        }];
        
        //第二条竖线
        UIView *hv = [UIView new];
        hv.backgroundColor = whiteC;
        [_headerView addSubview:hv];
        [hv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(vv);
            make.left.mas_equalTo(SCREEN_WIDTH*2/3);
            make.size.mas_equalTo(CGSizeMake(1, _headerView.height/5));
        }];
        
        //个人
        UILabel *person = [UILabel labelWithTextColor:whiteC FontSize:mainTitleSize Sview:_headerView];
        person.text = @"个人";
        [person mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(company);
            make.centerX.equalTo(_headerView.mas_centerX).with.offset(SCREEN_WIDTH/3);
        }];
        UILabel *personNum = [UILabel labelWithTextColor:whiteC FontSize:mainTitleSize Sview:_headerView];
        personNum.font = [UIFont systemFontOfSize:23 weight:UIFontWeightRegular];
        personNum.text = @"0";
        [personNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(companyNum);
            make.centerX.equalTo(person);
        }];
        
    }
    return _headerView;
}


#pragma mark /--------tableView--------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = grayC;
        
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height;
        
        _tableView.sectionFooterHeight = 0;
        _tableView.rowHeight = formCellHeight;
        
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return leftToMargin;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSInteger rows = 0;
    switch (section) {
        case 0:
            rows = 3;
            break;
        case 1:
            rows = 1;
            break;
        case 2:
            rows = 1;
            break;
        default:
            rows = 1;
            break;
    }
    return rows;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    DiscoverTableViewCell *cell = [[DiscoverTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cc"];
    cell.selectionStyle = NO;
    switch (indexPath.section) {
        case 0:
            switch (indexPath.row) {
                case 0:
                    cell.icon.image = [UIImage imageNamed:@"jrsy_image"];
                    cell.title.text = @"今日新增";
                    cell.showLab.textColor = MainColor;
                    cell.showLab.text = @"3";
                    break;
                    
                case 1:
                    cell.icon.image = [UIImage imageNamed:@"jrsy_image"];
                    cell.title.text = @"用户明细";
                    break;
                    
                default:
                    cell.icon.image = [UIImage imageNamed:@"ljsy_image"];
                    cell.title.text = @"财务统计";
                    break;
            }
            break;
            
        case 1:
            cell.icon.image = [UIImage imageNamed:@"shtx_image"];
            cell.title.text = @"团队管理";
            cell.showLab.textColor = MainColor;
            cell.showLab.text = @"23";
            break;
            
        case 2:
            cell.icon.image = [UIImage imageNamed:@"jrph_image"];
            cell.title.text = @"今日排行";
            break;
            
        default:
            cell.icon.image = [UIImage imageNamed:@"csqh_image"];
            cell.title.text = @"城市切换";
            cell.showLab.textColor = MainColor;
            cell.showLab.text = @"西安";
            self.cityLab = cell.showLab;
            
            break;
    }
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TodayAddViewController *taVC = [TodayAddViewController new];
    FinanceViewController *financeVC = [FinanceViewController new];
    TeamManageViewController *teamVC = [TeamManageViewController new];
    TodayRankViewController *rankVC = [TodayRankViewController new];
    if (indexPath.section==0) {
        if (indexPath.row==0) {
            [self.navigationController pushViewController:taVC animated:YES];
        }
       else if (indexPath.row==1) {
            [self.navigationController pushViewController:taVC animated:YES];
        }
        else {
            [self.navigationController pushViewController:financeVC animated:YES];
        }
    }
    if (indexPath.section==1) {
        [self.navigationController pushViewController:teamVC animated:YES];
    }
    if (indexPath.section==2) {
        [self.navigationController pushViewController: rankVC animated:YES];
    }
    if (indexPath.section==3) {
        CityList *city = [[CityList alloc]init];
        city.selectCity = ^(NSString *cityName) {
            self.cityLab.text = cityName;
            HWLog(@"%@",cityName);
        };
        MainNavigationController *navi = [[MainNavigationController alloc]initWithRootViewController:city];
        [self presentViewController:navi animated:YES completion:nil];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
