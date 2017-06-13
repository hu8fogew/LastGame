//
//  InstiDetailViewController.m
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "InstiDetailViewController.h"

@interface InstiDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

/**tableview的headerview*/
@property (strong,nonatomic) UIView *headerView;

/**tableview*/
@property (strong,nonatomic) UITableView *tableView;

/*底部按钮视图*/
@property (strong,nonatomic) UIView *bottomView;

/**详情视图*/
@property (strong,nonatomic) UIView *detailView;

/**列表视图*/
@property (strong,nonatomic) UIView *firstListView;
@property (strong,nonatomic) UIView *secondListView;

/**按钮视图*/
@property (strong,nonatomic) UIView *selectBtnView;
@property (strong,nonatomic) UIButton *btn1;
@property (strong,nonatomic) UIButton *btn2;

@property (strong,nonatomic) NSString *segStr;

@end


@implementation InstiDetailViewController

id inCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
    
    [self.headerView addSubview:self.detailView];
    [self.headerView addSubview:self.firstListView];
    [self.headerView addSubview:self.secondListView];
    [self.headerView addSubview:self.selectBtnView];
    
    
    self.segStr = self.btn1.titleLabel.text;

}

#pragma mark -----懒加载------
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        InstituHeadView *vi = [InstituHeadView new];
        vi.backImageView.image = [UIImage imageNamed:@"backImage.jpg"];
        vi.imgView.image = [UIImage imageNamed:@"icon"];
        vi.titleLabel.text = @"经纬中国";
        vi.subLabel.text = @"成功投资 : 423个";
        vi.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
        vi.addressLabel.text = @"西安";
        [_headerView addSubview:vi];
    }
    return _headerView;
}

-(UIView *)detailView{
    if (!_detailView) {
        _detailView = [[UIView alloc]initWithFrame:CGRectMake(0, self.headerView.y+self.headerView.height, SCREEN_WIDTH, SCREEN_WIDTH*0.29)];
        _detailView.backgroundColor = HWColor(241, 241, 241);
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.29-5)];
        vi.backgroundColor = [UIColor whiteColor];
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.font = [UIFont systemFontOfSize:14];
        titleLabel.text = @"机构简介";
        titleLabel.textColor = HWColor(51, 51, 51);
        [vi addSubview:titleLabel];
        [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vi).with.offset(10);
            make.top.equalTo(vi).with.offset(SCREEN_WIDTH*0.29/6);
        }];
        
        UILabel *detailLabel = [UILabel new];
        detailLabel.font = [UIFont systemFontOfSize:12];
        detailLabel.text = @"星球大战系列电影是由卢卡斯电影公司出品的科幻电影。卢卡斯电影公司首先于1977年推出了《星球大战》，之后又分别在1980年和1983年推出了《星球大战2》和《星球大战3》。之后又推出了《星球大战前》传系列，1、2、3分别于1999年、2002年和2005年上映";
        detailLabel.textColor = HWColor(153, 153, 153);
        detailLabel.numberOfLines = 0;
        [vi addSubview:detailLabel];
        [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(titleLabel);
            make.top.equalTo(titleLabel.mas_bottom).with.offset(SCREEN_WIDTH*0.29/12);
            make.right.and.bottom.equalTo(vi).with.offset(-SCREEN_WIDTH*0.29/12);
        }];
        
        [_detailView addSubview:vi];
        
    }
    return _detailView;
}

-(UIView *)firstListView{
    if (!_firstListView) {
        _firstListView = [[UIView alloc]initWithFrame:CGRectMake(0, self.detailView.y+self.detailView.height, SCREEN_WIDTH, SCREEN_WIDTH*0.18)];
        GoodDeSecondTableViewCell *vi = [GoodDeSecondTableViewCell new];
        vi.titleLabel.text = @"投资阶段";
        vi.dateLabel.text = @"种子轮 / 天使轮 / A轮dd / B轮";
        [_firstListView addSubview:vi];

    }
    return _firstListView;
}

-(UIView *)secondListView{
    if (!_secondListView) {
        _secondListView = [[UIView alloc]initWithFrame:CGRectMake(0, self.firstListView.y+self.firstListView.height, SCREEN_WIDTH, SCREEN_WIDTH*0.18)];
        GoodDeSecondTableViewCell *vi = [GoodDeSecondTableViewCell new];
        vi.titleLabel.text = @"投资领域";
        vi.dateLabel.text = @"移动互联网 / 媒体资讯 / 移动互联网 / 媒体资讯";
        [_secondListView addSubview:vi];

    }
    
    return _secondListView;
}

-(UIView *)selectBtnView{
    if (!_selectBtnView) {
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, self.secondListView.y+self.secondListView.height, SCREEN_WIDTH, 40)];
        _selectBtnView.backgroundColor = HWColor(241, 241, 241);
       
        UIView *vi1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH/2, 39)];
        vi1.backgroundColor = [UIColor whiteColor];
        [_selectBtnView addSubview:vi1];
        
        UIView *vi2 = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/2+1, 0, SCREEN_WIDTH/2-1, 39)];
        vi2.backgroundColor = [UIColor whiteColor];
        [_selectBtnView addSubview:vi2];
        
        self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn1 setTitle:@"投资人" forState:UIControlStateNormal];
        [self.btn1 setTitleColor:HWColor(51, 51, 51) forState:UIControlStateNormal];
        self.btn1.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.btn1 addTarget:self action:@selector(targetAction1) forControlEvents:UIControlEventTouchUpInside];
        [vi1 addSubview:self.btn1];
        [self.btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(vi1);
        }];
        
        UILabel *noLabel1 = [UILabel new];
        noLabel1.font = [UIFont systemFontOfSize:14];
        noLabel1.textColor = HWColor(41, 177, 225);
        noLabel1.text = @"18";
        [vi1 addSubview:noLabel1];
        [noLabel1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btn1.mas_right);
            make.centerY.equalTo(self.btn1);
        }];
        
        self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.btn2 setTitle:@"投资案例" forState:UIControlStateNormal];
        [self.btn2 setTitleColor:HWColor(51, 51, 51) forState:UIControlStateNormal];
        self.btn2.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.btn2 addTarget:self action:@selector(targetAction2) forControlEvents:UIControlEventTouchUpInside];
        [vi2 addSubview:self.btn2];
        [self.btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(vi2);
            
        }];
        
        UILabel *noLabel2 = [UILabel new];
        noLabel2.font = [UIFont systemFontOfSize:14];
        noLabel2.textColor = HWColor(41, 177, 225);
        noLabel2.text = @"108";
        [vi2 addSubview:noLabel2];
        [noLabel2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.btn2.mas_right);
            make.centerY.equalTo(self.btn2);
        }];
        
    }
    return _selectBtnView;
}

-(void)targetAction1{
    
    self.segStr = self.btn1.titleLabel.text;
    [self.tableView reloadData];
    
    HWLog(@"0000000");

}

-(void)targetAction2{
    
   self.segStr = self.btn2.titleLabel.text;
    [self.tableView reloadData];
    
    HWLog(@"1111111");

}

-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-60, SCREEN_HEIGHT, 60)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        NSArray *icon = @[@"关注",@"好友",@"咨询"];
        NSArray *title = @[@"加关注",@"加好友",@"立即咨询"];
        NSArray *color = @[@"blue",@"green",@"orange"];
        for (int i = 0; i < 3; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(10+i*(SCREEN_WIDTH-40)/3+i*10, 15, (SCREEN_WIDTH-40)/3, 30);
            btn.layer.masksToBounds = YES;
            btn.layer.cornerRadius = 3;
            btn.titleLabel.font = [UIFont systemFontOfSize:15];
            btn.imageView.size = CGSizeMake(16, 16);
            [btn setTitle:title[i] forState:UIControlStateNormal];
            btn.imageEdgeInsets = UIEdgeInsetsMake(0, -3, 0, 3);
            btn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
            [btn setImage:[UIImage imageNamed:icon[i]] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage imageNamed:color[i]] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
            
            [_bottomView addSubview:btn];
        }
        
    }
    return _bottomView;
}

-(void)clickBtn:(UIButton *)sender{
    if (sender.tag == 0) {
        
    }
    else if (sender.tag == 1){
        
    }
    else{
        
    }
}

#pragma mark ------tableview及方法------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-60)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.headerView.height+self.detailView.height+self.firstListView.height+self.secondListView.height+self.selectBtnView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:self.btn1.titleLabel.text]){
          return SCREEN_WIDTH*0.22;
    }
    return SCREEN_WIDTH*0.14;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"identifier";
    if ([self.segStr isEqualToString:self.btn1.titleLabel.text]) {
        InstiPersonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [[InstiPersonTableViewCell alloc]initWithFrame:cell.bounds];
            inCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"mq_image.jpeg"];
            cell.nameLabel.text = @"胡歌";
            cell.vIcon.image = [UIImage imageNamed:@"vip"];
            cell.fieldLabel.text = @"领域 : 健康管理,医疗平台";
            cell.stageLabel.text = @"阶段 : 天使轮";
            cell.titleLabel.text = @"投资经理";
            cell.fundLabel.text = @"银江资本";
        }
    }
    
    else{
    InstiCaseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[InstiCaseTableViewCell alloc]initWithFrame:cell.bounds];
        inCell = cell;
        cell.dateLabel.text = @"2016.12";
        cell.titleLabel.text = @"东家-有朋网络";
        cell.subLabel.text = @"800万人民币A轮投资";
        
    }
       return cell;
    }
    return inCell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
