//
//  SearchViewTool.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/11.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "SearchViewTool.h"

#import "CityCollectionCell.h"
#import "CityCollectionHeadView.h"
#import "ZYPinYinSearch.h"




@interface SearchViewTool ()<UITextFieldDelegate,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,CollectionViewDelegate>


{
    NSArray *unchangeArr;
    NSMutableArray *changeArr;
}

@property(nonatomic,strong)UITextField *textF;


@property (nonatomic,strong)UICollectionView *collectionVc;



@end

@implementation SearchViewTool

static NSString *colCellID = @"collectionVCellID";
static NSString *colHeadID = @"collectionVHeadID";


#pragma mark ------set

-(UICollectionView *)collectionVc
{
    if (!_collectionVc) {
        
        UICollectionViewFlowLayout *floLayout =[[UICollectionViewFlowLayout alloc]init];
        
        _collectionVc = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:floLayout];
        
        _collectionVc.delegate = self;
        
        _collectionVc.dataSource = self;
        
        _collectionVc.backgroundColor = HWColor(242, 242, 242);
        
        
    }
    return _collectionVc;
}








- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor= whiteC;
    [self setUpNavView];
    
    
    unchangeArr = [NSArray array];
    unchangeArr = @[@"工作",@"人才",@"项目",@"企业",@"合伙人"];
    
    changeArr = [NSMutableArray arrayWithObjects:@"有才有貌",@"兼职",nil];
    
    
    [self.view addSubview: self.collectionVc];
    
    //注册cell and sectionHeaderView;
    [self.collectionVc registerClass:[CityCollectionCell class] forCellWithReuseIdentifier:colCellID];
    [self.collectionVc registerClass:[CityCollectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:colHeadID];
    
}


#pragma mark ------*****setupView********

//  设置导航view
-(void)setUpNavView
{
    
    
    [self.navigationController.navigationBar setBarTintColor:blueC];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:whiteC}];
    
    
    UIView *searchVc = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH-60, 30)];
    
    searchVc.backgroundColor = whiteC;
    
    searchVc.layer.borderColor = [blueC CGColor];
    
    searchVc.layer.borderWidth = 1.0f;
    
    searchVc.layer.cornerRadius = 15;
    
    searchVc.layer.masksToBounds = YES;
    
    
    
    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(10, 0, SCREEN_WIDTH-90, 30)];
    
    textF.placeholder = @"工作／人才／企业／项目／合伙人";
    textF.backgroundColor = whiteC;
    textF.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    textF.leftViewMode = UITextFieldViewModeAlways;
    
    textF.clearButtonMode = UITextFieldViewModeAlways;
    
    UIImageView *imagev = [[UIImageView alloc]init];
    imagev.frame = CGRectMake(0, 0, 25, 25);
    imagev.image = [UIImage imageNamed:@"sousuo"];
    imagev.contentMode = UIViewContentModeCenter;
    
    textF.leftView = imagev;
    
    textF.delegate = self;
    
    self.textF = textF;
    
    [searchVc addSubview:textF];
    
    self.navigationItem.titleView = searchVc;
    
    
    
    UIButton *btn = [UIButton buttonWithType: UIButtonTypeCustom];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    btn.frame = CGRectMake(SCREEN_WIDTH-50, 0, 40, 40);
    [btn setTitle:@"取消" forState:UIControlStateNormal];
    
    [btn setTitleColor:whiteC forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(cancelNavClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *itemRight = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    self.navigationItem.rightBarButtonItem = itemRight;
    
    
    
    //
    
    
    
    
}


#pragma mark **********Action******

//取消（返回上一页面）
-(void)cancelNavClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

//删除历史记录
-(void)deleteChangeArr
{
    HWLog(@"删除历史记录");
    [self.textF resignFirstResponder];
    [LWAlertView shoWithMessage:@"删除历史记录"];
    
}



#pragma mark ------CollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section == 0) {
        return changeArr.count;
    }else
    {
        return unchangeArr.count;
    }
    
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CityCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:colCellID forIndexPath:indexPath];
    
    if (!cell) {
        cell = [[CityCollectionCell alloc]initWithFrame:CGRectZero];
        
    }
    
    if (indexPath.section == 0) {
        cell.titleLabel.text = changeArr[indexPath.row];
    }else
    {
        cell.titleLabel.text = unchangeArr[indexPath.row];
        
    }
    
    return cell;
}

//设置sectionHeader的文字
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    NSString *resuseIdentifier;
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        resuseIdentifier = colHeadID;
    }
    CityCollectionHeadView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:resuseIdentifier forIndexPath:indexPath];
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        if (indexPath.section == 0) {
            view.sectionTitleLabel.text = @"最近搜索记录";
            view.ishiddenDeleteImg = YES;
            view.delegate = self;
            
        }else
        {
            view.sectionTitleLabel.textAlignment = NSTextAlignmentCenter;
            view.sectionTitleLabel.text = @"搜索指定内容";
        }
    }
    
    return view;
    
}

//返回headerView 的大小

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    if (section == 0) {
        return CGSizeMake(SCREEN_WIDTH, 50);
    }else
    {
        return CGSizeMake(SCREEN_WIDTH, 70);
    }
    
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self.textF resignFirstResponder];
    
    
    if (indexPath.section == 0) {
        [LWAlertView shoWithMessage:changeArr[indexPath.row]];
    }else
    {
        [LWAlertView shoWithMessage:unchangeArr[indexPath.row]];
    }
    
}



#pragma mark ------UIColletionViewDelegateFlowLayout
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake((self.collectionVc.width-60)/3, 30);
}

-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    
    UICollectionViewFlowLayout *flowLayout = (UICollectionViewFlowLayout *)collectionViewLayout;
    
    flowLayout.minimumLineSpacing = 5;
    flowLayout.minimumInteritemSpacing = 5;
    
    
    return UIEdgeInsetsMake(5, 15, 5, 15);
    
}











#pragma mark -------页面将要进入和将要退出
-(void)viewWillAppear:(BOOL)animated
{
    [self.textF becomeFirstResponder];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [self.textF resignFirstResponder];
}


-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.textF resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
