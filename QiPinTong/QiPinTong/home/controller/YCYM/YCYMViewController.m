//
//  YCYMViewController.m
//  家长界
//
//  Created by taylor on 2016/12/28.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCYMViewController.h"

@interface YCYMViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,SGSegmentedControlDelegate,SDCycleScrollViewDelegate>

@property (strong,nonatomic) UICollectionView *ycymCollect;

@property (strong,nonatomic) UICollectionView *gxzwCollect;

/*headerView的创建*/
@property(nonatomic,strong)UIView *headerView;

/**高薪职位**/
@property (nonatomic,strong) UIView *activityView;

/*选择条*/
@property(nonatomic,strong)UIView *selectButtonView;

/*创建筛选按钮*/

@property(nonatomic,strong)WJDropdownMenu *menuView;



@property (nonatomic,copy) NSString *segStr;

/*选择条目*/
@property (nonatomic,strong) SGSegmentedControl *segment;
@end

@implementation YCYMViewController

id ycymCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"有才有貌";
    
    self.view.backgroundColor = whiteC;

    [self.headerView addSubview:self.activityView];
    [self.headerView addSubview:self.selectButtonView];
    [self.headerView addSubview:self.cycleView];
    
    NSArray *arr = @[@"有才有貌",@"高薪职位"];
    [self createSeleBarViewWithArr:arr];
    
    self.segStr = @"有才有貌";
}

#pragma mark /**********懒加载************/

//头部视图
-(UIView *)headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.selectButtonView.y+self.selectButtonView.height)];
    }
    
    return _headerView;
    
}


/**高薪职位，加入**/
-(UIView *)activityView{
    if (!_activityView) {
        _activityView = [[UIView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, 50)];
        _activityView.backgroundColor = whiteC;
    
        JoinInView *vi = [[JoinInView alloc]initWithFrame:_activityView.bounds];
        [vi setPropertyWithLabText:@"高薪职位 , ”职“ 等你来" andLabC:MainColor andBtnTitle:@"我要加入" andBtnTextC:HWColor(114, 46, 68) andImage:[UIImage imageNamed:@"ycym_image"] andTarget:self andAction:@selector(ycymBtnAction)];
        
        [_activityView addSubview:vi];

    }
    return _activityView;
}

-(void)ycymBtnAction{
    HWLog(@"6668");
}

/*----选择条目----*/
-(UIView *)selectButtonView
{
    if (!_selectButtonView) {
        _selectButtonView = [[UIView alloc]initWithFrame:CGRectMake(0, self.activityView.y+self.activityView.height+DistanceForCell, SCREEN_WIDTH, 50)];
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49)];
        vi.backgroundColor = whiteC;
        [_selectButtonView addSubview:vi];
    }
    return _selectButtonView;
}

/*----筛选按钮的添加----*/
-(WJDropdownMenu *)menuView
{
    if (!_menuView) {
        _menuView = [[WJDropdownMenu alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, siftHeight)];
        _menuView.backgroundColor = whiteC;
        _menuView.CarverViewColor = [UIColor colorWithWhite:0 alpha:0.3];
        
        [self createAllMenuData];
        
    }
    return _menuView;
}

- (void)createAllMenuData{
    NSArray *threeMenuTitleArray =  @[@"菜单A",@"菜单B",@"菜单C"];
    //  创建第一个菜单的first数据second数据
    NSArray *firstArrOne = [NSArray arrayWithObjects:@"A一级菜单1",@"A一级菜单2",@"A一级菜单3", nil];
    NSArray *firstMenu = [NSArray arrayWithObject:firstArrOne];
    
    /*
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Address" ofType:@"plist"];
    NSDictionary *dict = [[NSDictionary alloc] initWithContentsOfFile:path];
    self.proviceArr =  [dict allKeys];
     */
    
    //  创建第二个菜单的first数据second数据
    NSArray *firstArrTwo = [NSArray arrayWithObjects:@"B一级菜单1",@"B一级菜单2", nil];
    
    
    NSArray *secondArrTwo = @[@[@"B二级菜单11",@"B二级菜单12"],@[@"B二级菜单21",@"B二级菜单22"]];
    
    NSArray *thirdArrTwo = @[@[@"B三级菜单11-1",@"B三级菜单11-2",@"B三级菜单11-3"],@[@"B三级菜单12-1",@"B三级菜单12-2"],@[@"B三级菜单21-1",@"B三级菜单21-2"],@[]];
    NSArray *secondMenu = [NSArray arrayWithObjects:firstArrTwo,secondArrTwo,thirdArrTwo, nil];
    
    //  创建第三个菜单的first数据second数据
    NSArray *firstArrThree = [NSArray arrayWithObjects:@"C一级菜单1",@"C一级菜单2", nil];
    NSArray *secondArrThree = @[@[@"C二级菜单11",@"C二级菜单12"],@[]];
    NSArray *threeMenu = [NSArray arrayWithObjects:firstArrThree,secondArrThree, nil];
    
    [self.menuView createThreeMenuTitleArray:threeMenuTitleArray FirstArr:firstMenu SecondArr:secondMenu threeArr:threeMenu];
}

#pragma mark /------滚动显示筛选条------/
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{

//        CGFloat offset = [self.segStr isEqualToString:@"有才有貌"] ? self.ycymCollect.contentOffset.y : self.gxzwCollect.contentOffset.y;
//        
//        if (offset > 260-64-self.menuView.height ) {
//            [self.view addSubview:self.menuView];
//        }
//        if (0<=offset && offset <260-64-self.menuView.height) {
//            [self.menuView removeFromSuperview];
//        }
}

#pragma mark /*********轮播图的代理实现*******/
/*轮播图跳转代理*/
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HWLog(@"---点击了第%ld张图片", (long)index);
    
}

#pragma mark /-----选择条目列表------/
-(void)createSeleBarViewWithArr:(NSArray *)arrTitle
{
    self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:arrTitle];
    self.segment.titleColorStateNormal = HWColor(102, 102, 102);
    self.segment.titleColorStateSelected = HWColor(51, 51, 51);
    self.segment.indicatorColor = HWColor(51, 51, 51);
    [self.selectButtonView addSubview:self.segment];
}

-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index
{
    if (index == 0) {
        HWLog(@"0");
        self.segStr = @"有才有貌";
        [self.view addSubview:self.ycymCollect];
        [self.gxzwCollect removeFromSuperview];
        [self.ycymCollect reloadData];

    }

    else {
        HWLog(@"1");
        self.segStr = @"高薪职位";
        [self.ycymCollect removeFromSuperview];
        [self.view addSubview:self.gxzwCollect];
        [self.gxzwCollect reloadData];
    }
}

#pragma mark ------创建ycymCollect-------
-(UICollectionView *)ycymCollect{
    if (!_ycymCollect) {
        
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];    
        //设置headerView的尺寸大小
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, self.headerView.height);
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH*0.46, SCREEN_WIDTH*0.6);
        
        //2.初始化collectionView
        _ycymCollect = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        _ycymCollect.backgroundColor = whiteC;
        _ycymCollect.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        //3.注册collectionViewCell
        [_ycymCollect registerClass:[YCYMCollectionViewCell class] forCellWithReuseIdentifier:@"YCYMCollectionViewCell"];
        
        [_ycymCollect registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
        
        //4.设置代理
        _ycymCollect.delegate = self;
        _ycymCollect.dataSource = self;
    }
    return _ycymCollect;
}

#pragma mark ------创建gxzwCollect-------
-(UICollectionView *)gxzwCollect{
    if (!_gxzwCollect) {
        
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        //设置headerView的尺寸大小
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH,self.headerView.height);
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH, MainCellHeight);
        
        //2.初始化collectionView
        _gxzwCollect = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:layout];
        _gxzwCollect.backgroundColor = whiteC;
        _gxzwCollect.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        //3.注册collectionViewCell
        [_gxzwCollect registerClass:[GXZWCollectionViewCell class] forCellWithReuseIdentifier:@"GXZWCollectionViewCell"];
        
        [_gxzwCollect registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseView"];
        
        //4.设置代理
        _gxzwCollect.delegate = self;
        _gxzwCollect.dataSource = self;
    }
    return _gxzwCollect;
}

#pragma mark /------collectionView代理方法-------/

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    BOOL isright = @(indexPath.row).intValue%2 == 0;
    
    if ([self.segStr isEqualToString:@"有才有貌"]) {
        if ([collectionView isEqual:self.ycymCollect]) {
            
            static NSString *identifier = @"YCYMCollectionViewCell";
            YCYMCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
            ycymCell = cell;
            
            if (indexPath.row<2) {
                cell.imgView.image = [UIImage imageNamed: isright ? @"perImage.jpg":@"ycymHeaderImage"];
                cell.titleLabel.text = isright ? @"张婷":@"苗裔";
                cell.jobLabel.text = isright ? @"资深设计师":@"高级UI设计";
            }else
            {
                cell.imgView.image = [UIImage imageNamed: isright ? @"MF":@"MS"];
                cell.titleLabel.text = isright ? @"孙晓曦":@"胡苗";
                cell.jobLabel.text = isright ? @"ios软件开发":@"平面设计";
            }   
            cell.vIcon.image = [UIImage imageNamed:@"vipIcon"];
            cell.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
            cell.addressLabel.text = isright ? @"西安":@"北京";
            cell.ageIcon.image = [UIImage imageNamed:@"timeIcon"];
            cell.ageLabel.text = @"3年";
            cell.educaLabel.text = @"本科";
            cell.educaIcon.image = [UIImage imageNamed:@"academicIcon"];
            cell.salaryLabel.text = @"7K";
            cell.numberLabel.text = @"3224";
            cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
        }
    }
    
    if ([self.segStr isEqualToString:@"高薪职位"]) {
        if ([collectionView isEqual:self.gxzwCollect]) {
            
            static NSString *identifier = @"GXZWCollectionViewCell";
            GXZWCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
            ycymCell = cell;
            
            if (indexPath.row<2) {
                cell.imgView.image = [UIImage imageNamed: isright ? @"zwListImage.jpg":@"logoF_icon"];
                cell.postLab.text = isright ? @"中级UI设计师":@"产品经理";
            }else
            {
                cell.imgView.image = [UIImage imageNamed: isright ? @"comImage.jpg":@"Qpt_icon"];
                cell.postLab.text = isright ? @"ios软件开发":@"PHP开发";
            }
            
            cell.salaryLab.text = @"5-8k";
            cell.companyLab.text = isright ? @"西部家联教育有限公司":@"陕西科技";
            cell.vipIcon.image = [UIImage imageNamed:@"vipIcon"];
            cell.typeLab.text = @"软件/互联网";
            cell.academicIcon.image = [UIImage imageNamed:@"academicIcon"];
            cell.academicLab.text = @"本科";
            cell.timeIcon.image = [UIImage imageNamed:@"timeIcon"];
            cell.timeLab.text = @"3年";
            cell.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
            cell.addressLab.text = isright ? @"西安高新产业园逸翠园i都会":@"西安浐灞生态园128号";
            cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
            cell.numLab.text = @"3288";
        }
    }
    
    return ycymCell;
}

//通过设置SupplementaryViewOfKind 来设置头部或者底部的view
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    if ([collectionView isEqual:self.ycymCollect]) {
        UICollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
        headView.backgroundColor = HWColor(241, 241, 241);
        [headView addSubview:self.headerView];
        
        return headView;

    }
    
    else{
        
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseView" forIndexPath:indexPath];
        headerView.backgroundColor = HWColor(241, 241, 241);
        [headerView addSubview:self.headerView];
                
        return headerView;
    }

}

//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    if ([collectionView isEqual:self.ycymCollect]) {
        return UIEdgeInsetsMake(15, 10, 10, 10);

    }
    
    else{
        return UIEdgeInsetsMake(0, 0, 0, 0);

    }
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    HWLog(@"xxff");
    
    if ([collectionView isEqual:self.ycymCollect]) {
        YCPersonDeViewController *vc = [YCPersonDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else{
        YCJobDeViewController *vc = [YCJobDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
}


-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
