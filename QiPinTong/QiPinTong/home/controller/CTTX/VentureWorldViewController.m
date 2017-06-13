//
//  VentureWorldViewController.m
//  家长界
//
//  Created by taylor on 2016/12/12.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "VentureWorldViewController.h"

@interface VentureWorldViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,BtnViewDidSelectDelegate,SDCycleScrollViewDelegate>

@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,strong) UIView *headerView;


/**选择按钮视图*/
@property (nonatomic,strong) UIView *selectBtnView;
@property (nonatomic,strong) NSMutableArray *seleArr;

/**推荐视图*/
@property (nonatomic,strong) UIView *commendView;

/**列表标题视图*/
@property (nonatomic,strong) UIView *listView;

/**滚动视图*/
@property (nonatomic,strong) UICollectionView *collectionView;
@property (nonatomic,strong) UIView *moreView;


@end

@implementation VentureWorldViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"创孵天下";
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.cycleView];
    [self.headerView addSubview:self.selectBtnView];
    [self.headerView addSubview:self.commendView];
    [self.headerView addSubview:self.listView];
    
    [self.commendView addSubview:self.collectionView];
    

}

#pragma mark -----懒加载-------

/**选择按钮*/
-(NSMutableArray *)seleArr{
    if (!_seleArr) {
        _seleArr = [DataBase addCTTXSelectBarArr];
    }
    return _seleArr;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        _headerView.backgroundColor = grayC;
        
    }
    return _headerView;
}


#pragma mark --轮播代理

-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    HWLog(@"点击了第%ld张图片",index);
}

/*选择按钮视图*/
-(UIView *)selectBtnView
{
    if (!_selectBtnView) {
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0,lunBoheight, SCREEN_WIDTH, SCREEN_WIDTH*0.24)];
        _selectBtnView.backgroundColor = whiteC;
        
        [self creatSelectViewWith:_selectBtnView.bounds andselectArray:(NSMutableArray *)self.seleArr andSuperView:_selectBtnView];
    }
    return _selectBtnView;
}

#pragma mark /------选择按钮的创建-------/

/*选择器添加的手势实现方法*/
-(void)didselectViewAtIndex:(NSInteger)index{
    
    if (index == 0) {
        HWLog(@"0");
        GoodItemsViewController *goodVC = [GoodItemsViewController new];
        [self.navigationController pushViewController:goodVC animated:YES];
    }
    
    if (index == 1) {
        HWLog(@"1");
        PartnerViewController *parVC = [PartnerViewController new];
        [self.navigationController pushViewController:parVC animated:YES];
    }
    
    if (index == 2) {
        HWLog(@"2");
        InstitutionViewController *insVC = [InstitutionViewController new];
        [self.navigationController pushViewController:insVC animated:YES];
    }
    
    HWLog(@"%zd",index);
    

}

/*推荐视图*/
-(UIView *)commendView{
    if (!_commendView) {
        _commendView = [[UIView alloc]initWithFrame:CGRectMake(0, self.selectBtnView.y+self.selectBtnView.height+DistanceForCell, SCREEN_WIDTH, SCREEN_WIDTH*0.9)];
        _commendView.backgroundColor = whiteC;
        
        UILabel *commendLabel = [UILabel new];
        commendLabel.font = [UIFont systemFontOfSize:18];
        commendLabel.textColor = MainColor;
        commendLabel.text = @"项目推荐";
        [_commendView addSubview:commendLabel];
        [commendLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(_commendView).with.offset(20);
            make.centerX.equalTo(_commendView);
        }];
        
        UIView *hView = [UIView new];
        hView.backgroundColor = MainColor;
        [_commendView addSubview:hView];
        [hView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(commendLabel.mas_bottom).with.offset(13);
            make.centerX.equalTo(commendLabel);
            make.size.mas_equalTo(CGSizeMake(25, 1));
        }];
        
        UIImageView *arrowImg = [UIImageView new];
        arrowImg.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        [_commendView addSubview:arrowImg];
        [arrowImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(commendLabel);
            make.right.equalTo(self.commendView).with.offset(-10);
            make.width.mas_equalTo(15);
            make.height.mas_equalTo(15);
        }];
        
        UIButton *moreBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [moreBtn setTitle:@"查看更多" forState:UIControlStateNormal];
        moreBtn.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize];
        [moreBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
        [moreBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_commendView addSubview:moreBtn];
        [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(_commendView);
            make.bottom.equalTo(_commendView.mas_bottom).with.offset(-10);
        }];
        
        UIImageView *arrow= [UIImageView new];
        arrow.image = [UIImage imageNamed:@"rgrayArrowIcon"];
        [_commendView addSubview:arrow];
        [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(moreBtn.mas_right);
            make.centerY.equalTo(moreBtn);
            make.size.mas_equalTo(CGSizeMake(mainTitleSize, mainTitleSize));
        }];

    }
    return _commendView;
}


-(void)commendArrowBtnClick{
    HWLog(@"where");
}

-(void)moreBtnClick{
    HWLog(@"more");
    
    ComOnlineViewController *vc = [ComOnlineViewController new];
    [self.navigationController pushViewController:vc animated:YES];

}

/*同城路演*/
-(UIView *)listView{
    if (!_listView) {
        _listView = [[UIView alloc]initWithFrame:CGRectMake(0, self.commendView.y+self.commendView.height+DistanceForCell, SCREEN_WIDTH, 70)];
        _listView.backgroundColor = whiteC;
        
        UILabel *listLabel = [UILabel new];
        listLabel.font = [UIFont systemFontOfSize:18];
        listLabel.textColor = MainColor;
        listLabel.text = @"同城路演";
        [_listView addSubview:listLabel];
        [listLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_listView);
        }];
        
        UIView *hView = [UIView new];
        hView.backgroundColor = MainColor;
        [_listView addSubview:hView];
        [hView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(listLabel.mas_bottom).with.offset(13);
            make.centerX.equalTo(listLabel);
            make.width.mas_equalTo(25);
            make.height.mas_equalTo(1);
        }];
        
    }
    return _listView;
}

#pragma mark ------创建collectionview--------
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH*0.41, SCREEN_WIDTH*0.54);
        layout.minimumInteritemSpacing = 10;
        
        //2.初始化collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(10, SCREEN_WIDTH*0.22, SCREEN_WIDTH-20, SCREEN_WIDTH*0.54) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        //3.注册collectionViewCell
        [_collectionView registerClass:[QPTHomeCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        //4.设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        
        
        [_collectionView addSubview:self.moreView];
    }
    return _collectionView;
}

#pragma mark /------滚动查看更多------/
-(UIView *)moreView{
    if (!_moreView) {
        _moreView = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH*0.41*5+50, 0, SCREEN_WIDTH*0.42, SCREEN_WIDTH*0.54)];
        _moreView.backgroundColor = grayC;
        
        UIButton *checkBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [checkBtn setTitle:@"查看更多" forState:UIControlStateNormal];
        checkBtn.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize];
        [checkBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
        [checkBtn addTarget:self action:@selector(moreBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_moreView addSubview:checkBtn];
        [checkBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(_moreView);
        }];
        
        UIImageView *arrow= [UIImageView new];
        arrow.image = [UIImage imageNamed:@"roundArrowIcon"];
        [_moreView addSubview:arrow];
        [arrow mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(checkBtn.mas_right);
            make.centerY.equalTo(checkBtn);
            make.size.mas_equalTo(CGSizeMake(mainTitleSize, mainTitleSize));
        }];
    }
    
    return _moreView;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 6;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"cell";
    QPTHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
        cell.imgView.image = [UIImage imageNamed:@"comImage.jpg"];
        cell.titleLabel.text = @"动漫秀";
        cell.vIcon.image = [UIImage imageNamed:@"vipIcon"];
        cell.postLabel.text = @"150W";
        cell.subTitle.text = @"儿童动漫电影平台";
        cell.locaIcon.image = [UIImage imageNamed:@"locationIcon"];
        cell.locaLabel.text = @"西安";
        cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
        cell.numLabel.text = @"3223";
        cell.praiseIcon.image = [UIImage imageNamed:@"praiseNIcon"];
        cell.praiseLabel.text = @"23";
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    HWLog(@"66666600004");
    
    YCComDeViewController *vc = [YCComDeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}

#pragma mark -----tableview及方法------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.listView.y+self.listView.height;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 6;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    VentureCellLayout *layout = [[VentureCellLayout alloc]initWithVentureCell];
    
    return layout.ventureCellHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    VentureTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"v"];
    cell = [[VentureTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"v"];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
