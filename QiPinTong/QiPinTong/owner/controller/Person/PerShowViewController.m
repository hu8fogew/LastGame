//
//  PersonShowViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/8.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "PerShowViewController.h"

@interface PerShowViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate>

@property (strong,nonatomic) UITableView *tableView;

@end

@implementation PerShowViewController

id inviteCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if (self.selectIndex==100) {
        self.navigationItem.title = @"投递记录";
    }
    if (self.selectIndex==101) {
        self.navigationItem.title = @"待面试";
    }
    if (self.selectIndex==102) {
        self.navigationItem.title = @"我的收藏";
    }
    
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
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CGFloat cellHeight = 0;
    if (self.selectIndex == 100) {
        
        cellHeight = DeCellHeight;
    }
    else if (self.selectIndex == 101)
    {
        InviteCellLayout *lay = [[InviteCellLayout alloc]initInviteCell];
        cellHeight = lay.inviteCellHeight;
        
    }
    else if (self.selectIndex == 102)
    {
        cellHeight = DeCellHeight;
    }

    return cellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.selectIndex == 100) {
        SendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
        cell = [[SendTableViewCell alloc]initWithFrame:cell.bounds];
        cell.imgView.image = [UIImage imageNamed:@"comImage.jpg"];
        cell.postLab.text = @"UI设计师";
        cell.comLab.text = @"陕西金阳光商贸有限公司";
        cell.timeLab.text = @"刚刚";
        cell.salaryLab.text = @"5-8k";
        
        inviteCell = cell;
    }
    else if (self.selectIndex == 101)
    {
        InviteTableViewCell *cell = [[InviteTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"resumeCell"];
        inviteCell = cell;
        
    }else if (self.selectIndex == 102)
    {
        SendTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
        cell = [[SendTableViewCell alloc]initWithFrame:cell.bounds];
        cell.imgView.image = [UIImage imageNamed:@"zwListImage.jpg"];
        cell.postLab.text = @"优蓝网";
        cell.comLab.text = @"公司：西安灞河新区管理委员会国有资产管理有限公司";
        cell.timeLab.text = @"2017-03-30";
        
        inviteCell = cell;
    }
    
    return inviteCell;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
