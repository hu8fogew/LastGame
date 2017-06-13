//
//  CompanyOnlineViewController.m
//  家长界
//
//  Created by taylor on 2016/11/29.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "ComOnlineViewController.h"

@interface ComOnlineViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,SDCycleScrollViewDelegate>

@property (strong,nonatomic) UICollectionView *collectionView;


/*头视图*/
@property (nonatomic,strong) UIView *headerView;

@end

@implementation ComOnlineViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"名企在线";
    
    [self.view addSubview:self.collectionView];
    [self.headerView addSubview:self.cycleView];
    
}
#pragma mark -----懒加载------
-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight+60)];
        _headerView.backgroundColor = grayC;
        
        JoinInView *vi = [[JoinInView alloc]initWithFrame:CGRectMake(0, lunBoheight, SCREEN_WIDTH, 50)];
        vi.backgroundColor = whiteC;
        [vi setPropertyWithLabText:@"年薪百万不是梦，高薪职位等你来" andLabC:MainColor andBtnTitle:@"我要加入" andBtnTextC:HWColor(238, 154, 98) andImage:[UIImage imageNamed:@"mqzx_image"]  andTarget:self andAction:@selector(clickBtn)];
        
        [_headerView addSubview:vi];
    }
    return _headerView;
}

-(void)clickBtn{
    HWLog(@"6668");
    [self loginAction];
    if (self.loginOrNot) {
        [LWAlertView shoWithMessage:@"企业入驻"];
    }
    
}


#pragma mark /*********轮播图的代理*******/
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HWLog(@"%zd",index);
}

#pragma mark ------创建collectionview-------
-(UICollectionView *)collectionView{
    if (!_collectionView) {
        
        //1.初始化layout
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        //设置headerView的尺寸大小
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, lunBoheight+60);
        //该方法也可以设置itemSize
        layout.itemSize =CGSizeMake(SCREEN_WIDTH*0.46, SCREEN_WIDTH*0.6);
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 5;
        
        //2.初始化collectionView
        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
        [self.view addSubview:_collectionView];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        //3.注册collectionViewCell
        [_collectionView registerClass:[ComOnlineCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
        
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
        
        //4.设置代理
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
    }
    return _collectionView;
}

#pragma mark collectionView代理方法

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.jobArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *identifier = @"cell";
    ComOnlineCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    [self collectionViewCell:cell configModelForIndexPath:indexPath];
    
    
    return cell;
}


-(void) collectionViewCell:(ComOnlineCollectionViewCell *)cell configModelForIndexPath:(NSIndexPath *)indexPath
{
    
    cell.indexPath = indexPath;

    Comlist *comModel = self.comArr[indexPath.row];
    cell.comModel = comModel;
    cell.jobArr = self.jobArr;
    
}






//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(20, 10, 10, 10);
}


//通过设置SupplementaryViewOfKind 来设置头部或者底部的view
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
    headerView.backgroundColor = grayC;
    [headerView addSubview:self.headerView];
    return headerView;
}

//点击item方法
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    YCComDeViewController *vc = [YCComDeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    HWLog(@"jdfldklskj");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
