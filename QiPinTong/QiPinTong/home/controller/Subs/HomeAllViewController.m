//
//  HomeAllViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/16.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "HomeAllViewController.h"
#import "WebViewController.h"

@interface HomeAllViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *collection;


@property (strong,nonatomic) NSMutableArray *imgAry;
@property (strong,nonatomic) NSMutableArray *tLabAry;


@property (strong,nonatomic) UIButton *delOrAddBtn;


@end

@implementation HomeAllViewController

id allCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"企聘通";
    
    [self.view addSubview:self.collection];
    
    self.imgAry = [NSMutableArray arrayWithObjects:@"jd_image",@"beauty_image",@"mtwm_image",@"dzdp_image",@"ddcx_image",@"tcly_image",@"tnlx_image", nil];
    self.tLabAry = [NSMutableArray arrayWithObjects:@"京东商城",@"美丽说",@"美团外卖",@"大众点评",@"滴滴出行",@"同城旅游",@"途牛旅行", nil];
    
}

#pragma mark /------collection----------/
-(UICollectionView *)collection{
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 40);
        layout.itemSize = CGSizeMake((SCREEN_WIDTH-3)/4, SCREEN_WIDTH/4);
        layout.minimumLineSpacing = 1;
        layout.minimumInteritemSpacing = 1;
        
        _collection = [[UICollectionView alloc]initWithFrame:SCREEN_BOUNDS collectionViewLayout:layout];
        _collection.backgroundColor = grayC;
        _collection.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [_collection registerClass:[LifeCircleCollectionViewCell class] forCellWithReuseIdentifier:@"LifeCircleCollectionViewCell"];
        
        [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusalbeView"];
        
        _collection.delegate = self;
        _collection.dataSource = self;
        
    }
    return _collection;
}


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section == 0) {
        return 8;
    }
    return self.imgAry.count;
}
#pragma mark --------//collectionView头部视图
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusalbeView" forIndexPath:indexPath];
        
        UILabel *lab = [UILabel new];
        lab.font = [UIFont systemFontOfSize:mainTitleSize+1];
        lab.textColor = SecondTitleColor;
        lab.text = indexPath.section==0? @"企聘通服务":@"第三方服务";
        [header addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(leftToMargin);
            make.centerY.equalTo(header);
        }];
        
        UIButton *editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [editBtn setImage:[UIImage imageNamed:indexPath.section==0?@"error_gray":@""]forState:UIControlStateNormal];
        [editBtn setTitle:indexPath.section==0?@"":@"编辑" forState:UIControlStateNormal];
        editBtn.tag = indexPath.section;
        [editBtn setTitle:@"完成" forState:UIControlStateSelected];
        editBtn.selected = NO;
        [editBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
        editBtn.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize+1];
        [header addSubview:editBtn];
        [editBtn addTarget:self action:@selector(editButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [editBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-topToMargin);
            make.centerY.equalTo(header);
        }];
        
        return header;
        
    } else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"reuseView" forIndexPath:indexPath];
        footer.backgroundColor = grayC;
        return footer;
    }
    return nil;
}

//cell
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LifeCircleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LifeCircleCollectionViewCell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        NSArray *imgArr = @[@"qzsp_image",@"jzdr_image",@"xy365_image",@"mqzx_image",@"ycym_image",@"cftx_image",@"ysyk_image",@"ytxy_image"];
        NSArray *titleArr = @[@"全职速聘",@"兼职达人",@"校园直聘",@"名企在线",@"有才有貌",@"创孵天下",@"有商有客",@"易通学院"];
        cell.imgView.image = [UIImage imageNamed:imgArr[indexPath.row]];
        cell.tLab.text = titleArr[indexPath.row];
    }
    if (indexPath.section == 1) {
        cell.imgView.image = [UIImage imageNamed:self.imgAry[indexPath.row]];
        cell.tLab.text = self.tLabAry[indexPath.row];
        
        [cell.delOrAddBtn addTarget:self action:@selector(btnDeleteClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    return cell;
}

#pragma mark--------//删除添加按钮
-(void)btnDeleteClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        
    }
    else{
        
    }
    
}

#pragma mark-------//编辑按钮
-(void)editButtonClick:(UIButton *)btn{
    btn.selected =!btn.selected;
    if (btn.tag == 0) {
        [self.navigationController popViewControllerAnimated:YES];
        
    }
    else{
        HWLog(@"edit");
        if (btn.selected == NO) {
            for (LifeCircleCollectionViewCell *cell in self.collection.visibleCells) {
                NSIndexPath *indexPath = [self.collection indexPathForCell:cell];
                if (indexPath.section==0) {
                    cell.delOrAddBtn.hidden = YES;
                }
                
                cell.delOrAddBtn.hidden = YES;
            }
        }
        else{
            for (LifeCircleCollectionViewCell *cell in self.collection.visibleCells) {
                NSIndexPath *indexPath = [self.collection indexPathForCell:cell];
                if (indexPath.section==1) {
                    cell.delOrAddBtn.hidden = NO;
                }
                
                
            }
        }
        
        
    }
}

#pragma mark---------//cell跳转
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    QZSPViewController *qzspVC = [QZSPViewController new];
    JZDRViewController *jzdrVC = [JZDRViewController new];
    Campus365ViewController *campusVC = [Campus365ViewController new];
    ComOnlineViewController *comVC = [ComOnlineViewController new];
    YCYMViewController *ycymVC = [YCYMViewController new];
    VentureWorldViewController *ventureVC = [VentureWorldViewController new];
    YSYKViewController *ysykVC = [YSYKViewController new];
    YTXYViewController *ytxyVC = [YTXYViewController new];
    
    
    
    
    if (indexPath.section == 0) {
        switch (indexPath.item) {
            case 0:
                [self.navigationController pushViewController:qzspVC animated:YES];
                break;
                
            case 1:
                [self.navigationController pushViewController:jzdrVC animated:YES];
                break;
                
            case 2:
                [self.navigationController pushViewController:campusVC animated:YES];
                break;
                
            case 3:
                [self.navigationController pushViewController:comVC animated:YES];
                break;
                
            case 4:
                [self.navigationController pushViewController:ycymVC animated:YES];
                break;
                
            case 5:
                [self.navigationController pushViewController:ventureVC animated:YES];
                break;
                
            case 6:
                [self.navigationController pushViewController:ysykVC animated:YES];
                break;
            default:
                [self.navigationController pushViewController:ytxyVC animated:YES];
                break;
        }
    }else
    {
        WebViewController *webVc = [[WebViewController alloc]init];
        switch (indexPath.item) {
            case 0:
                webVc.ctrlStr = @"京东商城";
                webVc.urlStr = [NSURL URLWithString:@"https://wqs.jd.com"];
                [self.navigationController pushViewController:webVc animated:YES];
                break;
                
            case 1:
                webVc.ctrlStr = @"美丽说";
                webVc.urlStr = [NSURL URLWithString:@"https://www.meilishuo.com"];
                [self.navigationController pushViewController:webVc animated:YES];
                break;
                
            case 2:
                webVc.ctrlStr = @"美团外卖";
                webVc.urlStr = [NSURL URLWithString:@"https://www.meituan.com"];
                [self.navigationController pushViewController:webVc animated:YES];
                break;
                
            case 3:
                webVc.ctrlStr = @"大众点评";
                webVc.urlStr = [NSURL URLWithString:@"https://www.dianping.com"];
                [self.navigationController pushViewController:webVc animated:YES];
                break;
                
            case 4:
                webVc.ctrlStr = @"滴滴出行";
                webVc.urlStr = [NSURL URLWithString:@"https://common.diditaxi.com.cn/general/webEntry?wx=true"];
                [self.navigationController pushViewController:webVc animated:YES];
                break;
                
            case 5:
                webVc.ctrlStr = @"同程旅游";
                webVc.urlStr = [NSURL URLWithString:@"https://www.ly.com"];
                [self.navigationController pushViewController:webVc animated:YES];
                break;
                
            case 6:
                webVc.ctrlStr = @"途牛旅行";
                webVc.urlStr = [NSURL URLWithString:@"https://m.tuniu.com"];
                [self.navigationController pushViewController:webVc animated:YES];
                break;
        }

    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
