//
//  RobCoinViewController.m
//  家长界
//
//  Created by taylor on 2016/12/30.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "TalentGangViewController.h"

@interface TalentGangViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headerView;
@property (strong,nonatomic) UIView *joinView;

@end

@implementation TalentGangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"达人帮";
    
    [self.view addSubview:self.tableView];
    [self.headerView addSubview:self.cycleView];
    [self.headerView addSubview:self.joinView];
    
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

#pragma mark /*-----headerView------*/
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        
    }
    return _headerView;
}

-(UIView *)joinView{
    if (!_joinView) {
        _joinView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, 60)];
        _joinView.backgroundColor = grayC;
        
        JoinInView *vi = [[JoinInView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_WIDTH , 50)];
        vi.backgroundColor = whiteC;
        [vi setPropertyWithLabText:@"自由人职业时代来袭，兼职创业轻松赚米~" andLabC:MainColor andBtnTitle:@"我要加入" andBtnTextC:orangeC andImage:[UIImage imageNamed:@"drbhticon"] andTarget:self andAction:@selector(joinBtnClick)];
        [_joinView addSubview:vi];
    }
    return _joinView;
}

-(void)joinBtnClick{
    TalentFormViewController *vc = [TalentFormViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark /*------tableView及方法------*/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO ;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.joinView.botoom;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TalentGangTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[TalentGangTableViewCell alloc]initWithFrame:cell.bounds];
        [cell.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"classics.jpg"]];
        cell.nameLab.text = @"叶冬梅";
        cell.sexIcon.image = [UIImage imageNamed:@"femaleIcon"];
        cell.addressLab.text = @"西安市";
        cell.numIcon.image = [UIImage imageNamed:@"gFans"];
        cell.numLab.text = @"30";
        
        [cell.shareBtn setTitle:@"共享" forState:UIControlStateNormal];
        [cell.shareBtn setTitleColor:orangeC forState:UIControlStateNormal];
        cell.shareBtn.layer.borderColor = orangeC.CGColor;
        cell.shareBtn.layer.borderWidth = 1;
        [cell.shareBtn addTarget:self action:@selector(shareBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return cell;

}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return DeCellHeight;
}

-(void)shareBtnClick{
    TalentFormViewController *vc = [TalentFormViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
