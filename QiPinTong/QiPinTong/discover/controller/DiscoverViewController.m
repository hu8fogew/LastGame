//
//  DiscoverViewController.m
//  家长界
//
//  Created by 张波 on 2016/11/7.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "DiscoverViewController.h"


@interface DiscoverViewController ()<UITableViewDataSource,UITableViewDelegate,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = whiteC;
    
    [self.view addSubview:self.tableView];
    
    //    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
    [self.navigationController.navigationBar setBarTintColor:blueC];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:whiteC,NSForegroundColorAttributeName : @"发现"}];
}


//-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
//    if (self.navigationController.viewControllers.count == 1) {
//        return NO;
//    }
//    else{
//        return YES;
//    }
//}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.sectionFooterHeight = 10;
    }
    
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    NSInteger rows =0;
    
    switch (section) {
        case 0:
            rows = 1;
            break;
        case 1:
            rows = 1;
            break;
        case 2:
            rows = 2;
            break;
        default:
            rows = 1;
            break;
    }
    
    return rows;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section==0) {
        return 15;
    }
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return formCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    DiscoverTableViewCell *cell = [[DiscoverTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"mycell"];
    cell.selectionStyle = NO;
    if (section == 0) {
        cell.icon.image = [UIImage imageNamed:@"friend_image"];
        cell.title.text = @"朋友动态";
    }
    else if (section == 1) {
        if (row == 0) {
            cell.icon.image = [UIImage imageNamed:@"near_image"];
            cell.title.text = @"附近";
        }
        
        
    }
    else if (section == 2) {
        if (indexPath.row == 0) {
            cell.icon.image = [UIImage imageNamed:@"jzj_image"];
            cell.title.text = @"家长界";
            
        }
        else{
            cell.icon.image = [UIImage imageNamed:@"life_image"];
            cell.title.text = @"生活圈";
        }
        
    }
    else{
        cell.icon.image = [UIImage imageNamed:@"drbhticon"];
        cell.title.text = @"达人帮";
    }
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger section = indexPath.section;
    NSInteger row = indexPath.row;
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    TalentGangViewController *coinVC = [TalentGangViewController new];
    
    //朋友圈
    MomentsViewController *circleVc = [MomentsViewController new];
    
    //附近
    NearbyViewController *nearVC = [NearbyViewController new];
    
    //生活圈
    LifeCircleViewController *lifeVC = [LifeCircleViewController new];
    switch (section) {
            //朋友圈
        case 0:
            [self loginAction];
            if (self.loginOrNot) {
                [self.navigationController pushViewController:circleVc animated:YES];
            }
            break;
            
        case 1:
            
            [self.navigationController pushViewController:nearVC animated:YES];
            
            break;
            
        case 2:
            switch (row) {
                case 0:
                    [LWAlertView shoWithMessage:@"还未开通，敬请期待！"];
                    break;
                    
                default:
                    [self.navigationController pushViewController:lifeVC animated:YES];
                    break;
            }
            break;
            
        default:
            switch (row) {
                case 0:
                    [self loginAction];
                    if (self.loginOrNot) {
                        [self.navigationController pushViewController:coinVC animated:YES];
                    }
                    break;
            }
            
            break;
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
