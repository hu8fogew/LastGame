//
//  DDSortView.m
//  DDNews
//
//  Created by Dvel on 16/4/15.
//  Copyright © 2016年 Dvel. All rights reserved.
//

#import "DDSortView.h"
#import "DDChannelModel.h"
#import "DDSortCell.h"

//#import "LXReorderableCollectionViewFlowLayout.h"
#import "UIView+Extension.h"


@interface DDSortView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property (strong,nonatomic) UICollectionView *collectionView;

@property (nonatomic, strong) NSMutableArray *channelList;

@property (strong,nonatomic) NSMutableArray *imgViewAry;

@end

@implementation DDSortView

- (instancetype)initWithFrame:(CGRect)frame channelList:(NSMutableArray *)channelList
{
    self.channelList = channelList.mutableCopy;
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = grayC;
        
        // 中间的排序collectionView,
        UICollectionViewFlowLayout *flowLayout = [UICollectionViewFlowLayout new];
        self.collectionView = [[UICollectionView alloc] initWithFrame:SCREEN_BOUNDS collectionViewLayout:flowLayout];
        self.collectionView.backgroundColor = grayC;
        self.collectionView.dataSource = self;
        self.collectionView.delegate = self;
        
        [self.collectionView registerClass:[DDSortCell class] forCellWithReuseIdentifier:@"DDSortCell"];
        [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseView"];
        
        [self addSubview:self.collectionView];
        
        // 设置cell的大小和细节,每排4个
        flowLayout.headerReferenceSize = CGSizeMake(SCREEN_WIDTH, 40);
        flowLayout.itemSize = CGSizeMake((SCREEN_WIDTH-3)/4, SCREEN_WIDTH/4);
        flowLayout.minimumLineSpacing = 1;
        flowLayout.minimumInteritemSpacing = 1;
        
    }
    return self;
}

-(NSMutableArray *)imgViewAry{
    if (!_imgViewAry) {
        _imgViewAry = [DataBase addQptSeleBarArray];
        
    }
    return _imgViewAry;
}

#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.channelList.count;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reuseView" forIndexPath:indexPath];
    
    UILabel *lab = [UILabel new];
    lab.font = [UIFont systemFontOfSize:mainTitleSize+1];
    lab.textColor = SecondTitleColor;
    lab.text = indexPath.section==0? @"企聘通服务":@"第三方服务";
    [header addSubview:lab];
    [lab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(topToMargin);
        make.centerY.equalTo(header);
    }];
    
    UIButton *closeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [closeBtn setImage:[UIImage imageNamed:indexPath.section==0?@"error_gray":@""]forState:UIControlStateNormal];
    [closeBtn setTitle:indexPath.section==0?@"":@"编辑" forState:UIControlStateNormal];
    [closeBtn setTitleColor:SecondTitleColor forState:UIControlStateNormal];
    closeBtn.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize+1];
    closeBtn.tag = indexPath.section;
    [closeBtn addTarget:self action:@selector(arrowButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-topToMargin);
        make.centerY.equalTo(header);
    }];
    
    return header;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        DDSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DDSortCell" forIndexPath:indexPath];
        DDChannelModel *first = self.channelList[0];
        [cell.button setTitle:first.tname forState:UIControlStateNormal];
        [cell.button setTitleColor:redC forState:UIControlStateNormal];
        [cell.button setImage:[UIImage imageNamed:@"qzsp_image"] forState:UIControlStateNormal];
        [cell.button addTarget:self action:@selector(cellButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [cell.delOrAddBtn addTarget:self action:@selector(btnDeleteClick:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    } else {
        DDSortCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DDSortCell" forIndexPath:indexPath];
        [cell.button setTitleColor:MainColor forState:UIControlStateNormal];
        [cell.button setTitle:[self.channelList[indexPath.row] valueForKey:@"tname"] forState:UIControlStateNormal];
        
        NSDictionary *dict = [self.imgViewAry objectAtIndex:indexPath.row];
        [cell.button setImage:[UIImage imageNamed:dict[@"slecteImg"]] forState:UIControlStateNormal];
        
        [cell.button addTarget:self action:@selector(cellButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [cell.delOrAddBtn addTarget:self action:@selector(btnDeleteClick:) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
}

//删除添加按钮
-(void)btnDeleteClick:(UIButton *)btn{
    btn.selected = !btn.selected;
    if (btn.selected) {
        
    }
    else{
        
    }
    
}

/** 箭头按钮点击事件 */
- (void)arrowButtonClick:(UIButton *)btn
{
    if (btn.tag == 0) {
        self.arrowBtnClickBlock();

    }
    else{
        HWLog(@"edit");
        btn.selected =!btn.selected;
        if (btn.selected == NO) {
            for (DDSortCell *cell in self.collectionView.visibleCells) {
                NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
                if (indexPath.section==1) {
                    cell.delOrAddBtn.hidden = YES;
                }
            }
        }
        else{
            for (DDSortCell *cell in self.collectionView.visibleCells) {
                NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
                if (indexPath.section==1) {
                    cell.delOrAddBtn.hidden = NO;
                }
            }
        }

    }
}

/** cell按钮点击事件 */
- (void)cellButtonClick:(UIButton *)button
{
    if (self.cellButtonClick) {
        self.cellButtonClick(button);
    }
    
    HWLog(@"click");
}

@end
