//
//  YCJobDeViewController.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCComDeViewController.h"

@interface YCComDeViewController ()<UITableViewDelegate,UITableViewDataSource,SGSegmentedControlDelegate,CommentEnjoyDelegate,YCYMDeHeadViewDelegate,TableActionCellDelegate,UIScrollViewDelegate,BottomBtnViewDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headView;


@property (nonatomic,strong) NSArray* fakeDatasource;
@property (nonatomic,strong) NSMutableArray* dataSource;
@property (nonatomic,assign,getter = isNeedRefresh) BOOL needRefresh;

/*页面切换视图*/
@property (nonatomic,strong) UIView *seleBarView;
@property (nonatomic,strong) NSArray *seleBarArr;
@property (nonatomic,strong) SGSegmentedControl *segment;
@property (nonatomic,strong) NSString *segStr;
@property (nonatomic,strong) YCYMDeHeadView *vi;

/*公司简介视图*/
@property(nonatomic,strong) DescCompanyView *descCompanyView;

//加关注、好友等
@property (strong,nonatomic) UIView *bottomView;
@end

@implementation YCComDeViewController
const CGFloat kRefreshBoundCom = 170.0f;

id comPanyCell = nil;

- (NSMutableArray *)dataSource {
    if (_dataSource) {
        return _dataSource;
    }
    _dataSource = [[NSMutableArray alloc] init];
    return _dataSource;
}

- (NSArray *)fakeDatasource {
    if (_fakeDatasource) {
        return _fakeDatasource;
    }
    _fakeDatasource =
    @[@{@"type":@"image",
        @"name":@"型格志style",
        @"avatar":@"http://tp4.sinaimg.cn/5747171147/50/5741401933/0",
        @"content":@"春天卫衣的正确打开方式https://github.com/waynezxcv/Gallop",
        @"date":@"1459668442",
        @"imgs":@[@"http://ww2.sinaimg.cn/mw690/006gWxKPgw1f2jeloxwhnj30fu0g0ta5.jpg",
                  @"http://ww3.sinaimg.cn/mw690/006gWxKPgw1f2jelpn9bdj30b40gkgmh.jpg",
                  @"http://ww1.sinaimg.cn/mw690/006gWxKPgw1f2jelriw1bj30fz0g175g.jpg",
                  @"http://ww4.sinaimg.cn/mw690/006gWxKPgw1f2jem32ccrj30xm0sdwjt.jpg",
                  @"http://ww4.sinaimg.cn/mw690/006gWxKPgw1f2jelyhutwj30fz0fxwfr.jpg",],
        @"statusID":@"8"},
      
      @{@"type":@"image",
        @"name":@"SIZE潮流生活",
        @"avatar":@"http://tp2.sinaimg.cn/1829483361/50/5753078359/1",
        @"content":@"近日，adidas Originals😂为经典鞋款Stan Smith打造Primeknit版本，并带来全新的“OG”系列。简约的鞋身采用白色透气Primeknit针织材质制作，再将Stan Smith代表性的绿、红、深蓝三个元年色调融入到鞋舌和后跟点缀，最后搭载上米白色大底来保留其复古风味。据悉该鞋款将在今月登陆全球各大adidas Originals指定店舖。https://github.com/waynezxcv/Gallop <-",
        @"date":@"1459668442",
        @"imgs":@[@"http://ww2.sinaimg.cn/mw690/6d0bb361gw1f2jim2hgxij20lo0egwgc.jpg",
                  @"http://ww3.sinaimg.cn/mw690/6d0bb361gw1f2jim2hsg6j20lo0egwg2.jpg",
                  @"http://ww1.sinaimg.cn/mw690/6d0bb361gw1f2jim2d7nfj20lo0eg40q.jpg",
                  @"http://ww1.sinaimg.cn/mw690/6d0bb361gw1f2jim2hka3j20lo0egdhw.jpg",
                  @"http://ww2.sinaimg.cn/mw690/6d0bb361gw1f2jim2hq61j20lo0eg769.jpg"],
        @"statusID":@"1"},
      ];
    return _fakeDatasource;
}


- (void)loadView {
    [super loadView];
    [self setup];
}


- (void)setup {
    self.needRefresh = YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"公司主页";

    [self.view addSubview:self.tableView];
    [self.headView addSubview:self.seleBarView];
    [self.view addSubview:self.bottomView];
    self.seleBarArr = @[@"主页",@"职位",@"动态"];
    [self.headView addSubview:self.descCompanyView];
    [self createSeleBarView];
}


- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.isNeedRefresh) {
        [self refreshBegin];
    }
}

#pragma mark ------懒加载------
-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        _headView.backgroundColor = grayC;
        PersonalLayout *personLay = [[PersonalLayout alloc]initOwnerDetailWithSrtId:@""];
        
        YCYMDeHeadView *vi = [[YCYMDeHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, personLay.personViewHeight)];
        vi.backImageView.image = [UIImage imageNamed:@"deBackView"];
        vi.delegate = self;
        self.vi = vi;
        [self callBackWithDescPersonView:vi];
        [_headView addSubview:vi];
    }
    return _headView;
}



/*收藏*/
-(void)enjoyButton:(UIButton *)sender
{
    [self loginAction];
    HWLog(@"enjoy");
    if (self.loginOrNot) {
        sender.selected = YES;
        [LWAlertView shoWithMessage:@"已收藏"];
    }
    
}


-(void)callBackWithDescPersonView:(YCYMDeHeadView *)personView
{
    __weak typeof(self) weakSelf = self;
    personView.clickedImageCallback = ^(YCYMDeHeadView* descView,NSInteger imageIndex){
        __strong typeof(weakSelf) sself = weakSelf;
        [sself personalView:descView showImageBrowserWithImageIndex:imageIndex];
    };
    
}
-(void)personalView:(YCYMDeHeadView *)view showImageBrowserWithImageIndex:(NSInteger)index
{
    NSMutableArray* tmps = [[NSMutableArray alloc] init];
    LWImageBrowserModel *model = [[LWImageBrowserModel alloc]initWithplaceholder:[UIImage imageNamed:@"perImage.jpg"] thumbnailURL:nil HDURL:nil containerView:view positionInContainer:view.personLay.photoPosition index:index];
    [tmps addObject:model];
    LWImageBrowser* browser = [[LWImageBrowser alloc] initWithImageBrowserModels:tmps
                                                                    currentIndex:index];
    [browser show];
}

/*页面切换视图*/
-(UIView *)seleBarView{
    if (!_seleBarView) {
        _seleBarView = [[UIView alloc]initWithFrame:CGRectMake(0, self.headView.y+self.headView.height, SCREEN_WIDTH, siftHeight)];
        _seleBarView.backgroundColor = grayC;
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1)];
        view.backgroundColor = whiteC;
        [_seleBarView addSubview:view];
        
    }
    return _seleBarView;
}

#pragma mark /*-----添加选项栏-----*/
-(void)createSeleBarView
{
    _segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, siftHeight-1) delegate:self segmentedControlType:SGSegmentedControlTypeStatic titleArr:self.seleBarArr];
    _segment.titleColorStateSelected = HWColor(96, 136, 186);
    _segment.indicatorColor = HWColor(96, 136, 186);
    [self.seleBarView addSubview:_segment];
}


-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    
    if (index == 0) {
        self.segStr = @"主页";
        
        [self.headView addSubview:self.descCompanyView];
        self.tableView.tableHeaderView.height = self.descCompanyView.botoom;
        
        
        [self.tableView reloadData];
    }
    else if (index == 1){
        self.segStr = @"职位";
        
        [self.descCompanyView removeFromSuperview];
        self.tableView.tableHeaderView.height = self.seleBarView.botoom;
        [self.tableView reloadData];
    }
    else if (index == 2){
        self.segStr = @"动态";
        [self.descCompanyView removeFromSuperview];
        self.tableView.tableHeaderView.height = self.seleBarView.botoom;
        [self.tableView reloadData];
    }
    
    
}

-(DescCompanyView *)descCompanyView
{
    if (!_descCompanyView) {
        CompanyLayout *lay = [[CompanyLayout alloc]initDescCompanyView];
        _descCompanyView = [[DescCompanyView alloc]initWithFrame:CGRectMake(0, self.seleBarView.botoom, SCREEN_WIDTH, lay.descCompanyHeight)];
    }
    return _descCompanyView;
}


-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-70-64, SCREEN_WIDTH, 70)];
        _bottomView.backgroundColor = whiteC;
        BottomBtnView *btnVc = [[BottomBtnView alloc]init];
        btnVc.frame = _bottomView.bounds;
        btnVc.delegate =self;
        [btnVc setupViewWithStringId:@"公司"];
        
        [_bottomView addSubview:btnVc];
    }
    return _bottomView;
}

#pragma mark -----底部按钮实现动作
-(void)bottomActionWithNum:(NSInteger)num{
    
    
    [self loginAction];
    
    if (self.loginOrNot) {
        
        if (num == 0) {
            HWLog(@"66666666");
            [LWAlertView shoWithMessage:@"已关注"];
        }
        else if (num == 1){
            [LWAlertView shoWithMessage: @"已邀请"];
        }
    }
    
}

#pragma mark ------tableview及方法---------
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-70)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headView;
        _tableView.tableHeaderView.height = self.descCompanyView.botoom;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.allowsSelection = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([self.segStr isEqualToString:@"主页"]) {
        return 5;
    }else if ([self.segStr isEqualToString:@"职位"])
    {
        return 3;
    }else if ([self.segStr isEqualToString:@"动态"])
    {
        return self.dataSource.count;
    }
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.segStr isEqualToString:@"主页"]){
        CompanyLayout *lay = [[CompanyLayout alloc]initCommentCell];
        return lay.comentCellHeight;
    }
    else if ([self.segStr isEqualToString:@"职位"]){
        return SCREEN_WIDTH*0.2;
    }
    else if ([self.segStr isEqualToString:@"动态"])
    {
        CellLayout* layout = self.dataSource[indexPath.row];
        return layout.cellHeight;
    }
    return 0;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        
    if ([self.segStr isEqualToString:@"主页"]) {
            YCJobHomeTableViewCell *Homecell = [[YCJobHomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"commentCell"];
        Homecell.delegate = self;
            comPanyCell = Homecell;
    }
    
    else if ([self.segStr isEqualToString:@"职位"]){
        YCJobTableViewCell *jobCell = [[YCJobTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"jobKind"];
        jobCell.backgroundColor = HWColor(241, 241, 241);
        comPanyCell = jobCell;
        jobCell.postLabel.text = @"中级UI设计师";
        jobCell.salaryLabel.text = @"5-8K";
        jobCell.eduIcon.image = [UIImage imageNamed:@"education"];
        jobCell.eduLabel.text = @"本科";
        jobCell.ageIcon.image = [UIImage imageNamed:@"time_image"];
        jobCell.ageLabel.text = @"3-5年";
        jobCell.addressIcon.image = [UIImage imageNamed:@"qpt_map_image"];
        jobCell.addressLabel.text = @"西安";
        jobCell.numberLabel.text = @"3228";
        jobCell.numberIcon.image = [UIImage imageNamed:@"eyeImage"];
    }
    
    else if ([self.segStr isEqualToString:@"动态"])
    {
        TableViewCell*cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"DtIdentifier"];
        comPanyCell = cell;
        cell.delegate = self;
        [self confirgueCell:cell atIndexPath:indexPath];
    }
    
    return comPanyCell;
}

#pragma mark -------主页

-(void)onEnjoyBtnInCell:(YCJobHomeTableViewCell *)cell
{
    [self loginAction];
    HWLog(@"点赞喽====");
}





#pragma mark ---------动态
- (void)confirgueCell:(TableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indexPath = indexPath;
    CellLayout* cellLayout = self.dataSource[indexPath.row];
    cell.cellLayout = cellLayout;
    [self callbackWithDTCell:cell];
}

- (void)callbackWithDTCell:(TableViewCell *)cell {
    __weak typeof(self) weakSelf = self;
    cell.clickedLikeButtonCallback = ^(TableViewCell* cell,BOOL isLike) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself tableViewCell:cell didClickedLikeButtonWithIsLike:isLike];
    };
    
    cell.clickedOpenCellCallback = ^(TableViewCell* cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself openTableViewCell:cell];
    };
    
    cell.clickedAvatarCallback = ^(TableViewCell* cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself showAvatarWithCell:cell];
    };
    
    cell.clickedImageCallback = ^(TableViewCell* cell,NSInteger imageIndex) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself dtTableViewCell:cell showImageBrowserWithImageIndex:imageIndex];
    };
    cell.clickedCheckOutAwardCellCallback = ^(TableViewCell *cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself chectAwardRecodeWith:cell];
    };
    
}


/*时间*/
- (NSDateFormatter *)dateFormatter {
    static NSDateFormatter* dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月dd日 hh:mm"];
    });
    return dateFormatter;
}

/**/
//cell的样式
- (CellLayout *)layoutWithStatusModel:(StatusModel *)statusModel index:(NSInteger)index {
    
    CellLayout *layout = [[CellLayout alloc]initContentOpendLayoutWithStatusModel:statusModel index:index dateFormatter:self.dateFormatter];
    
    return layout;
}

//模拟下载数据
- (void)fakeDownload {
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        if (self.needRefresh) {
            [self.dataSource removeAllObjects];
            for (NSInteger i = 0; i < self.fakeDatasource.count; i ++) {
                LWLayout* layout = [self layoutWithStatusModel:
                                    [[StatusModel alloc] initWithDict:self.fakeDatasource[i]]
                                                         index:i];
                [self.dataSource addObject:layout];
            }
        }
        dispatch_sync(dispatch_get_main_queue(), ^{
            [self refreshComplete];
        });
    });
}

//模拟刷新完成
- (void)refreshComplete {
    [self.vi refreshingAnimateStop];

    [self.tableView reloadData];
    [UIView animateWithDuration:0.35f animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, 0.0f, 0.0f);
    } completion:^(BOOL finished) {
        self.needRefresh = NO;
    }];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

    CGFloat offset = scrollView.contentOffset.y;
    [self.vi loadingViewAnimateWithScrollViewContentOffset:offset];
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {
    CGFloat offset = scrollView.contentOffset.y;
    if (offset <= -kRefreshBoundCom) {
        [self refreshBegin];
    }
}

#pragma mark - Data

//模拟下拉刷新
- (void)refreshBegin {
    [UIView animateWithDuration:0.2f animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(kRefreshBoundCom, 0.0f, 0.0f, 0.0f);
    } completion:^(BOOL finished) {
//        [self.vi refreshingAnimateBegin];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5f * NSEC_PER_SEC)),
                       dispatch_get_main_queue(), ^{
                           [self fakeDownload];
                       });
    }];
}



-(void)chectAwardRecodeWith:(TableViewCell *)cell
{
    [self loginAction];
    if (self.loginOrNot) {
        AwardCoinController *vc = [[AwardCoinController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
}


- (void)onCommentInCell:(TableViewCell *)cell{
    
    HWLog(@"评论");
    [self loginAction];
    if (self.loginOrNot) {
        CommentViewController *vc = [[CommentViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

- (void)onLikeInCell:(TableViewCell *)cell{
    
    [self loginAction];
    
    HWLog(@"点赞");
}

- (void)onShareInCell:(TableViewCell *)cell{
    [self loginAction];
    HWLog(@"转发");
    if (self.loginOrNot) {
        [self awardOtherPeopleCoinWithImageStr:cell.cellLayout.statusModel.avatar name:cell.cellLayout.statusModel.name];
    }
    
    
}

////-----编辑问题
//-(void)editClickBtn:(UITapGestureRecognizer *)tap
//{
//    HWLog(@"我来编辑");
//    
//    
//
//    
////    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:vc];
////    [self.navigationController presentViewController:nav animated:YES completion:nil];
//    
//}


//点击查看大图
- (void)dtTableViewCell:(TableViewCell *)cell showImageBrowserWithImageIndex:(NSInteger)imageIndex {
    NSMutableArray* tmps = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < cell.cellLayout.imagePostions.count; i ++) {
        LWImageBrowserModel* model = [[LWImageBrowserModel alloc]
                                      initWithplaceholder:nil
                                      thumbnailURL:[NSURL URLWithString:[cell.cellLayout.statusModel.imgs objectAtIndex:i]]
                                      HDURL:[NSURL URLWithString:[cell.cellLayout.statusModel.imgs objectAtIndex:i]]
                                      containerView:cell.contentView
                                      positionInContainer:CGRectFromString(cell.cellLayout.imagePostions[i])
                                      index:i];
        [tmps addObject:model];
    }
    LWImageBrowser* browser = [[LWImageBrowser alloc] initWithImageBrowserModels:tmps
                                                                    currentIndex:imageIndex];
    [browser show];
}

//查看头像
- (void)showAvatarWithCell:(TableViewCell *)cell {
    [LWAlertView shoWithMessage:[NSString stringWithFormat:@"点击了头像:%@",cell.cellLayout.statusModel.name]];
}


/* 由于是异步绘制，而且为了减少View的层级，整个显示内容都是在同一个UIView上面，所以会在刷新的时候闪一下，这里可以先把原先Cell的内容截图覆盖在Cell上，
 延迟0.25s后待刷新完成后，再将这个截图从Cell上移除 */
- (void)coverScreenshotAndDelayRemoveWithCell:(UITableViewCell *)cell cellHeight:(CGFloat)cellHeight {
    
    UIImage* screenshot = [GallopUtils screenshotFromView:cell];
    
    UIImageView* imgView = [[UIImageView alloc] initWithFrame:[self.tableView convertRect:cell.frame toView:self.tableView]];
    
    imgView.frame = CGRectMake(imgView.frame.origin.x,
                               imgView.frame.origin.y,
                               imgView.frame.size.width,
                               cellHeight);
    
    imgView.contentMode = UIViewContentModeTop;
    imgView.backgroundColor = [UIColor whiteColor];
    imgView.image = screenshot;
    [self.tableView addSubview:imgView];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [imgView removeFromSuperview];
    });
    
}


//点赞
- (void)tableViewCell:(TableViewCell *)cell didClickedLikeButtonWithIsLike:(BOOL)isLike {
    
    
    CellLayout* layout = [self.dataSource objectAtIndex:cell.indexPath.row];
    
    StatusModel* statusModel = layout.statusModel;
    layout = [self layoutWithStatusModel:statusModel index:cell.indexPath.row];
    
    [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:layout.cellHeight];
    
    [self.dataSource replaceObjectAtIndex:cell.indexPath.row withObject:layout];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:cell.indexPath.row inSection:0]]
                          withRowAnimation:UITableViewRowAnimationNone];
}


//展开Cell
- (void)openTableViewCell:(TableViewCell *)cell {
    CellLayout* layout =  [self.dataSource objectAtIndex:cell.indexPath.row];
    StatusModel* model = layout.statusModel;
    CellLayout* newLayout = [[CellLayout alloc] initContentOpendLayoutWithStatusModel:model
                                                                                index:cell.indexPath.row
                                                                        dateFormatter:self.dateFormatter];
    [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:newLayout.cellHeight];
    
    [self.dataSource replaceObjectAtIndex:cell.indexPath.row withObject:newLayout];
    [self.tableView reloadRowsAtIndexPaths:@[cell.indexPath]
                          withRowAnimation:UITableViewRowAnimationNone];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
