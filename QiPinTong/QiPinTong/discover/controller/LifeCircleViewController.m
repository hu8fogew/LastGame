//
//  LifeViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/4/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LifeCircleViewController.h"
#import "WebViewController.h"

@interface LifeCircleViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *collection;

@property (strong,nonatomic) NSMutableArray *imgAry;
@property (strong,nonatomic) NSMutableArray *tLabAry;

@end

@implementation LifeCircleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"生活圈";
    
    [self.view addSubview:self.collection];
    
    self.imgAry = [NSMutableArray arrayWithObjects:@"ysyk_image",@"jd_image",@"beauty_image",@"mtwm_image",@"dzdp_image",@"ddcx_image",@"tcly_image",@"tnlx_image", nil];
    self.tLabAry = [NSMutableArray arrayWithObjects:@"有商有客",@"京东商城",@"美丽说",@"美团外卖",@"大众点评",@"滴滴出行",@"同城旅游",@"途牛旅行", nil];
}

-(UICollectionView *)collection{
    if (!_collection) {
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 35);
        layout.footerReferenceSize = CGSizeMake(SCREEN_WIDTH, 1);
        layout.itemSize = CGSizeMake(SCREEN_WIDTH/4, SCREEN_WIDTH*0.25);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        
        _collection = [[UICollectionView alloc]initWithFrame:SCREEN_BOUNDS collectionViewLayout:layout];
        _collection.backgroundColor = whiteC;
        _collection.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [_collection registerClass:[LifeCircleCollectionViewCell class] forCellWithReuseIdentifier:@"LifeCircleCollectionViewCell"];
        
        [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusalbeView"];
        
        [_collection registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"reuseView"];
        
        _collection.delegate = self;
        _collection.dataSource = self;
    }
    return _collection;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 2;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 8;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusalbeView" forIndexPath:indexPath];
        
        UIView *vv = [UIView new];
        vv.backgroundColor = blueC;
        [header addSubview:vv];
        [vv mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(header);
            make.left.mas_equalTo(leftToMargin);
            make.size.mas_equalTo(CGSizeMake(4, 15));
        }];
        
        UILabel *lab = [UILabel new];
        lab.font = [UIFont systemFontOfSize:mainTitleSize];
        lab.textColor = SecondTitleColor;
        lab.text = indexPath.section==1? @"为你推荐":@"最近";
        [header addSubview:lab];
        [lab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(vv.mas_right).offset(5);
            make.centerY.equalTo(vv);
        }];
        
        //        for (UIView *view in header.subviews) {
        //            [view removeFromSuperview];
        //        } // 防止复用分区头
        return header;
    } else {
        UICollectionReusableView *footer = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"reuseView" forIndexPath:indexPath];
        footer.backgroundColor = grayC;
        return footer;
    }
    return nil;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    LifeCircleCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"LifeCircleCollectionViewCell" forIndexPath:indexPath];
    
    cell.imgView.image = [UIImage imageNamed:self.imgAry[indexPath.row]];
    cell.tLab.text = self.tLabAry[indexPath.row];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSInteger row = indexPath.item;
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
    YSYKViewController *ysykVC = [[YSYKViewController alloc]init];
    
    
    if (indexPath.section == 1) {
        if (row == 0) {
            
            [self.navigationController pushViewController:ysykVC animated:YES];
            
            
        }else if (row > 0){
            WebViewController *webVc = [[WebViewController alloc]init];
            if (row == 1){
                webVc.ctrlStr = @"京东商城";
                webVc.urlStr = [NSURL URLWithString:@"https://www.jd.com"];
                [self.navigationController pushViewController:webVc animated:YES];
            }else if (row == 2){
                webVc.ctrlStr = @"美丽说";
                webVc.urlStr = [NSURL URLWithString:@"https://www.meilishuo.com"];
                [self.navigationController pushViewController:webVc animated:YES];
            }else if (row == 3){
                webVc.ctrlStr = @"美团外卖";
                webVc.urlStr = [NSURL URLWithString:@"https://www.meituan.com"];
                [self.navigationController pushViewController:webVc animated:YES];
            }else if (row == 4){
                webVc.ctrlStr = @"大众点评";
                webVc.urlStr = [NSURL URLWithString:@"https://www.dianping.com"];
                [self.navigationController pushViewController:webVc animated:YES];
            }else if (row == 5){
                webVc.ctrlStr = @"滴滴出行";
                webVc.urlStr = [NSURL URLWithString:@"https://www.xiaojukeji.com"];
                [self.navigationController pushViewController:webVc animated:YES];
            }else if (row == 6){
                webVc.ctrlStr = @"同程旅游";
                webVc.urlStr = [NSURL URLWithString:@"https://www.ly.com"];
                [self.navigationController pushViewController:webVc animated:YES];
            }else if (row == 7){
                webVc.ctrlStr = @"途牛旅行";
                webVc.urlStr = [NSURL URLWithString:@"https://www.tuniu.com"];
                [self.navigationController pushViewController:webVc animated:YES];
            }
        }
         else
        {
            return;
        }
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
