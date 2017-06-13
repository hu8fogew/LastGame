//
//  YTXYViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "YTXYViewController.h"
#import "SearchViewTool.h"

#import "DDChannelModel.h"
#import "DDChannelLabel.h"
#import "DDChannelCell.h"
#import "DDSortView.h"


@interface YTXYViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

//频道数据模型
@property (nonatomic, strong) NSArray *channelList;

//当前要展示频道
@property (nonatomic, strong) NSMutableArray *list_now;

//频道条目视图
@property (strong,nonatomic) UIView *headerView;

//频道列表
@property (nonatomic, strong) UIScrollView *myScrollView;

//新闻视图
@property (nonatomic, strong) UICollectionView *myCollectionView;

//下划线
@property (nonatomic, strong) UIView *underline;

//右侧添加按钮
@property (nonatomic, strong) UIButton *sortButton;

//分类排序界面
@property (nonatomic, strong) DDSortView *sortView;


/**搜索框*/
@property (nonatomic,strong) UIButton *earaButton;
@property (strong,nonatomic) SearchViewTool *searchView;


@end

@implementation YTXYViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self setupNavigationVc];
    
    self.navigationItem.title = @"易通学院";
    
    [self.view addSubview:self.myCollectionView];
    
    [self.view addSubview:self.headerView];
}

#pragma mark -------设置导航---------
-(void)setupNavigationVc
{
    
    [self.navigationController.navigationBar setBarTintColor:blueC];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:whiteC}];
    
    //左按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"西安" forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:mainTitleSize+1];
    leftBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    //............................                                             上 左 下 右
    leftBtn.titleEdgeInsets = UIEdgeInsetsMake(5, -30, 5, 15);
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(12, 28, 10, -2);
    [leftBtn setImage:[UIImage imageNamed:@"down_jt_icon"] forState:UIControlStateNormal];
    [leftBtn setTitleColor:whiteC forState:UIControlStateNormal];
    leftBtn.frame = CGRectMake(10, 0, 40, 40);
    [leftBtn addTarget:self action:@selector(mapLocationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.earaButton = leftBtn;
    UIBarButtonItem *leftBar = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftBar;
    
    
    //右按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"sousuo_white"] forState:UIControlStateNormal];
    rightBtn.size = CGSizeMake(20, 20);
    [rightBtn addTarget:self action:@selector(searchBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    
    self.navigationItem.rightBarButtonItem = rightBar;
    
}

#pragma mark --------搜索----------
-(void)searchBtnClick{
    
    SearchViewTool *vc = [[SearchViewTool alloc]init];
    MainNavigationController *nvc = [[MainNavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nvc animated:YES completion:nil];
}

#pragma mark ----------定位----------
-(void)mapLocationBtnClick{
    
    CityList *cvc = [[CityList alloc]init];
    
    cvc.selectCity = ^(NSString *cityName){
        
        CGSize size = [cityName sizeWithFont:[UIFont systemFontOfSize:mainTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        
        if (size.width < 30.6 && size.width >0) {
            self.earaButton.frame = CGRectMake(10, 0, 40, 40);
            self.earaButton.titleEdgeInsets = UIEdgeInsetsMake(5, -30, 5, 15);
            self.earaButton.imageEdgeInsets = UIEdgeInsetsMake(12, 28, 10, -2);
        }
        if (size.width < 46 && size.width >30.6) {
            self.earaButton.frame = CGRectMake(10, 0, 55, 40);
            self.earaButton.titleEdgeInsets = UIEdgeInsetsMake(5, -35, 5, 15);
            self.earaButton.imageEdgeInsets = UIEdgeInsetsMake(12, 40, 10, 0);
        }
        if (size.width >46) {
            self.earaButton.frame = CGRectMake(10, 0, 70, 40);
            self.earaButton.titleEdgeInsets = UIEdgeInsetsMake(5, -35, 5, 10);
            self.earaButton.imageEdgeInsets = UIEdgeInsetsMake(12, 59, 10, -3);
        }
        
        
        [self.earaButton setTitle:cityName forState:UIControlStateNormal];
        
        
        //       HWLog(@"++++++++++++%f",size.width);
        
        HWLog(@"%@",cityName);
        
    };
    MainNavigationController *navi = [[MainNavigationController alloc]initWithRootViewController:cvc];
    [self presentViewController:navi animated:YES completion:nil];
    
}


#pragma mark - /--------懒加载---------/
- (NSArray *)channelList
{
    if (!_channelList) {
        _channelList = [DDChannelModel channels];
    }
    return _channelList;
}

-(UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _headerView.backgroundColor = grayC;
        
        
        [_headerView addSubview:self.myScrollView];
        [_headerView addSubview:self.sortButton];
        
        
    }
    
    return _headerView;
}

- (UIScrollView *)myScrollView
{
    if (!_myScrollView) {
        _myScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 48)];
        _myScrollView.backgroundColor = whiteC;
        _myScrollView.showsHorizontalScrollIndicator = NO;
        
        // 设置频道
        _list_now = self.channelList.mutableCopy;
        [self setupChannelLabel];
        
        // 设置下划线
        [_myScrollView addSubview:({
            DDChannelLabel *label = [self getLabelArrayFromSubviews][0];
            label.textColor = blueC;
            
            _underline = [[UIView alloc] initWithFrame:CGRectMake(0, 46, label.textWidth, 2)];
            _underline.centerX = label.centerX;
            _underline.backgroundColor = blueC;
            _underline;
        })];
        
        
    }
    return _myScrollView;
}

- (UICollectionView *)myCollectionView
{
    if (!_myCollectionView) {
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        _myCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, self.headerView.height, SCREEN_WIDTH, SCREEN_HEIGHT-self.headerView.height-64) collectionViewLayout:flowLayout];
        _myCollectionView.backgroundColor = whiteC;
        _myCollectionView.delegate = self;
        _myCollectionView.dataSource = self;
        [_myCollectionView registerClass:[DDChannelCell class] forCellWithReuseIdentifier:@"DDChannelCell"];
        
        // 设置cell的大小和细节
        flowLayout.itemSize = _myCollectionView.bounds.size;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.minimumLineSpacing = 0;
        _myCollectionView.pagingEnabled = YES;
        _myCollectionView.showsHorizontalScrollIndicator = NO;
    }
    return _myCollectionView;
}

- (UIButton *)sortButton
{
    if (!_sortButton) {
        _sortButton = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-50, 0, 50, 48)];
        [_sortButton setImage:[UIImage imageNamed:@"bPlusIcon"] forState:UIControlStateNormal];
        _sortButton.backgroundColor = whiteC;
        
        //设置阴影
        _sortButton.layer.shadowRadius = 5;
        _sortButton.layer.shadowOpacity = 1;
        _sortButton.layer.shadowOffset = CGSizeMake(-10, 0);
        _sortButton.layer.shadowColor = whiteC.CGColor;
        
        [_sortButton addTarget:self action:@selector(sortButtonClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sortButton;
}

- (DDSortView *)sortView
{
    if (!_sortView) {
        _sortView = [[DDSortView alloc] initWithFrame:CGRectMake(_myScrollView.x,_myScrollView.y,SCREEN_WIDTH,_headerView.height + _myCollectionView.height) channelList:_list_now];
        
        WeakSelf;
        // 箭头点击回调
        _sortView.arrowBtnClickBlock = ^{
            [UIView animateWithDuration:0.5 animations:^{
                weakSelf.sortView.y = -SCREEN_HEIGHT;
            } completion:^(BOOL finished) {
                [weakSelf.sortView removeFromSuperview];
            }];
        };
        // 排序完成回调
        _sortView.sortCompletedBlock = ^(NSMutableArray *channelList){
            weakSelf.list_now = channelList;
            // 去除旧的排序
            for (DDChannelLabel *label in [weakSelf getLabelArrayFromSubviews]) {
                [label removeFromSuperview];
            }
            // 加入新的排序
            [weakSelf setupChannelLabel];
            // 滚到第一个频道！
            DDChannelLabel *label = [weakSelf getLabelArrayFromSubviews][0];
            UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
            [tap setValue:label forKey:@"view"];
            [weakSelf labelClick:tap];
        };
        // cell按钮点击回调
        _sortView.cellButtonClick = ^(UIButton *button){
            for (DDChannelLabel *label in [weakSelf getLabelArrayFromSubviews]) {
                if ([label.text isEqualToString:button.titleLabel.text]) {
                    weakSelf.sortView.arrowBtnClickBlock(); // 关闭sortView
                    UITapGestureRecognizer *tap = [UITapGestureRecognizer new];
                    [tap setValue:label forKey:@"view"];
                    [weakSelf labelClick:tap];
                }
            }
        };
        
    }
    return _sortView;
}


#pragma mark -/** 设置频道标题 */
- (void)setupChannelLabel
{
    CGFloat margin = 30.0;
    CGFloat x = 0;
    CGFloat h = _myScrollView.bounds.size.height;
    int i = 0;
    for (DDChannelModel *channel in _list_now) {
        DDChannelLabel *label = [DDChannelLabel channelLabelWithTitle:channel.tname];
        label.frame = CGRectMake(x, 0, label.width+margin, h);
        [_myScrollView addSubview:label];
        
        x += label.bounds.size.width;
        label.tag = i++;
        [label addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(labelClick:)]];
    }
    _myScrollView.contentSize = CGSizeMake(x + margin + self.sortButton.width, 0);
}

/** 频道Label点击事件 */
- (void)labelClick:(UITapGestureRecognizer *)recognizer
{
    DDChannelLabel *label = (DDChannelLabel *)recognizer.view;
    // 点击label后，让myCollectionView滚到对应位置。
    [_myCollectionView setContentOffset:CGPointMake(label.tag * _myCollectionView.frame.size.width, 0)];
    // 重新调用一下滚定停止方法，让label的着色和下划线到正确的位置。
    [self scrollViewDidEndScrollingAnimation:self.myCollectionView];
}

/** 获取myScrollView中所有的DDChannelLabel，合成一个数组，因为myScrollView.subViews中有其他非Label元素 */
- (NSArray *)getLabelArrayFromSubviews
{
    NSMutableArray *arrayM = [NSMutableArray array];
    for (DDChannelLabel *label in _myScrollView.subviews) {
        if ([label isKindOfClass:[DDChannelLabel class]]) {
            [arrayM addObject:label];
        }
    }
    return arrayM.copy;
}

/** 排序按钮点击事件 */
- (void)sortButtonClick
{
    [self.view addSubview:self.sortView];
    _sortView.y = -SCREEN_HEIGHT;
    [UIView animateWithDuration:0.5 animations:^{
        self.tabBarController.tabBar.y += 49;
        _sortView.y = _myScrollView.y;
    }];
}


#pragma mark - /--------UImyCollectionViewDataSource--------/
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _list_now.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    DDChannelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"DDChannelCell" forIndexPath:indexPath];
    DDChannelModel *channel = _list_now[indexPath.row];
    cell.urlString = channel.urlString;
    
    // 如果不加入响应者链，则无法利用NavController进行Push/Pop等操作。
    [self addChildViewController:(UIViewController *)cell.newsTVC];
    return cell;
}


#pragma mark - UICollectionViewDelegate
/** 正在滚动 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat value = scrollView.contentOffset.x / scrollView.frame.size.width;
    if (value < 0) {
        return;
    } // 防止在最左侧的时候，再滑，下划线位置会偏移，颜色渐变会混乱。
    
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    if (rightIndex >= [self getLabelArrayFromSubviews].count) {  // 防止滑到最右，再滑，数组越界，从而崩溃
        rightIndex = [self getLabelArrayFromSubviews].count - 1;
    }
    
    CGFloat scaleRight = value - leftIndex;
    CGFloat scaleLeft  = 1 - scaleRight;
    
    DDChannelLabel *labelLeft  = [self getLabelArrayFromSubviews][leftIndex];
    DDChannelLabel *labelRight = [self getLabelArrayFromSubviews][rightIndex];
    
    labelLeft.scale  = scaleLeft;
    labelRight.scale = scaleRight;
    
    if (scaleLeft == 1 && scaleRight == 0) {
        return;
    }
    
    // 下划线动态跟随滚动 ••••••••••••••••••••
    _underline.centerX = labelLeft.centerX   + (labelRight.centerX   - labelLeft.centerX)   * scaleRight;
    _underline.width   = labelLeft.textWidth + (labelRight.textWidth - labelLeft.textWidth) * scaleRight;
}

/** 手指滑动myCollectionView，滑动结束后调用 */
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    if ([scrollView isEqual:self.myCollectionView]) {
        [self scrollViewDidEndScrollingAnimation:scrollView];
    }
}

/** 手指点击myScrollView */
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.myCollectionView.width;
    // 滚动标题栏到中间位置
    DDChannelLabel *titleLable = [self getLabelArrayFromSubviews][index];
    CGFloat offsetx   =  titleLable.center.x - _myScrollView.width * 0.5;
    CGFloat offsetMax = _myScrollView.contentSize.width - _myScrollView.width;
    // 在最左和最右时，标签没必要滚动到中间位置。
    if (offsetx < 0){
        offsetx = 0;
    }
    if (offsetx > offsetMax){
        offsetx = offsetMax;
    }
    [_myScrollView setContentOffset:CGPointMake(offsetx, 0) animated:YES];
    
    // 先把之前着色的去色
    for (DDChannelLabel *label in [self getLabelArrayFromSubviews]) {
        label.textColor = MainColor;
    }
    // 下划线滚动并着色
    [UIView animateWithDuration:0.5 animations:^{
        _underline.width = titleLable.textWidth;
        _underline.centerX = titleLable.centerX;
        titleLable.textColor = blueC;
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
