//
//  TeamDetailViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/26.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "TeamListViewController.h"

@interface TeamListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong,nonatomic) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray *sectionAry;
@property (nonatomic,strong)NSMutableArray *dataAry;
@property (nonatomic, strong) NSMutableArray *btnArr;

@property (strong,nonatomic) UIImageView *arrow;
@end

@implementation TeamListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = self.titleStr;
    
    self.sectionAry = [NSMutableArray arrayWithObjects:@"",@"",@"",@"",@"",@"", nil];
    
    [self.view addSubview:self.tableView];
}

#pragma mark /---------按钮数组---------/
- (NSMutableArray *)btnArr{
    if (!_btnArr) {
        _btnArr = [[NSMutableArray alloc]init];
    }
    return _btnArr;
}

#pragma mark /------cell数据源---------/
- (NSMutableArray *)dataAry
{
    if (!_dataAry) {
        _dataAry = [[NSMutableArray alloc]init];
        for (NSInteger i  = 0 ; i < self.sectionAry.count ; i ++ ) {
            NSArray *arr = [[NSArray alloc]initWithObjects:@"",@"",@"",@"", nil];
            [_dataAry addObject:arr];
        }
    }
    return _dataAry;
}

#pragma mark /--------tableView---------/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = grayC;
        _tableView.sectionFooterHeight = 0;
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.sectionAry.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if ([self.btnArr containsObject:[NSNumber numberWithInteger:section]]){
        //包含 展开的
        return [self.dataAry[section] count];
    }
    else{
        return 0;
    }
}

//展开分组头
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60)];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(0, topToMargin, SCREEN_WIDTH, formCellHeight)];
    btn.backgroundColor = whiteC;
    [btn setTitleColor:MainColor forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClcik:) forControlEvents:UIControlEventTouchUpInside];
    btn.tag = section;
    [header addSubview:btn];
    
    UILabel *title = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:btn];
    if (section==0||section==1||section==2) {
        NSString *str = [[NSString stringWithFormat:@"%ld  ",section+1] stringByAppendingString:@"苏州市"];
        NSMutableAttributedString *attributed = [[NSMutableAttributedString alloc]initWithString:str];
        NSArray *arr = @[redC,blueC,orangeC];
        [attributed addAttribute:NSForegroundColorAttributeName value:arr[section] range:NSMakeRange(0, 1)];
        title.attributedText = attributed;
    }else{
        title.text = [[NSString stringWithFormat:@"%ld  ",section+1] stringByAppendingString:@"西安市"];
    }
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(leftToMargin);
        make.centerY.equalTo(btn);
    }];
    
    self.arrow = [UIImageView new];
    self.arrow.image = [UIImage imageNamed:@"downArrowIcon"];
    [btn addSubview:self.arrow];
    [self.arrow mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-leftToMargin);
        make.centerY.equalTo(btn);
        make.size.mas_equalTo(CGSizeMake(MTitleSize, MTitleSize));
    }];
    
    UILabel *num = [UILabel labelWithTextColor:MainColor FontSize:MTitleSize Sview:btn];
    num.text = @"23";
    [num mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.arrow.mas_left).offset(-5);
        make.centerY.equalTo(btn);
    }];
    
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 60;
}

- (void)btnClcik:(UIButton *)btn{
    if ([self.btnArr containsObject:[NSNumber numberWithInteger:btn.tag]]){
        [self.btnArr removeObject:[NSNumber numberWithInteger:btn.tag]];
        self.arrow.image = [UIImage imageNamed:@"upArrowIcon"];
    }
    else{
        [self.btnArr addObject:[NSNumber numberWithInteger:btn.tag]];
        self.arrow.image = [UIImage imageNamed:@"downArrowIcon"];
    }
    [self.tableView reloadSections:[NSIndexSet indexSetWithIndex:btn.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return DeCellHeight;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TeamListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[TeamListTableViewCell alloc]initWithFrame:cell.bounds];
        [cell.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"classics.jpg"]];
        cell.nameLab.text = @"小青蛙";
        cell.postLab.text = @"部长";
        cell.departmentLab.text = @"运营管理部";
        cell.addressLab.text = @"西安市";
        cell.dateLab.text = @"05-12 10:50:23";
    }
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TeamDetailViewController *vc = [TeamDetailViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
