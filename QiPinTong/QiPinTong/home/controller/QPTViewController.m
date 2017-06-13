//
//  QPTViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/5/16.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "QPTViewController.h"
#import "QRCodeScanningVC.h"
#import "SearchViewTool.h"
#import "ESRootClass.h"
#import "Fjoblist.h"
#import "Memlist.h"
#import "Comlist.h"

@interface QPTViewController ()<UITableViewDelegate,UITableViewDataSource,BtnViewDidSelectDelegate,SDCycleScrollViewDelegate,UIGestureRecognizerDelegate,UITextFieldDelegate,SGSegmentedControlDelegate>

//tableView
@property (strong,nonatomic) UITableView *tableView;

//headerView
@property (strong,nonatomic) UIView *headerView;

/**搜索框*/
@property(nonatomic,strong) UIView *searchBar;
@property (nonatomic,strong) UITextField *textF;
@property (nonatomic,strong) UIButton *earaButton;
@property(nonatomic,copy) NSString *earaText;


//选择按钮视图
@property (strong,nonatomic) UIView *selectBtnView;
@property (strong,nonatomic) NSMutableArray *selectAry;

//加入视图
@property (strong,nonatomic) UIView *joinView;

//切换视图
@property (strong,nonatomic) UIView *segmentView;
@property (strong,nonatomic) SGSegmentedControl *segment;

@property (copy,nonatomic) NSString *segStr;

@property (strong,nonatomic) UIView *backView;

@end

@implementation QPTViewController

id qptCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.earaText = @"西安";
    [self addAllView];
    
    //上拉加载
    [QPTUtils addLoadMoreForScrollView:self.tableView loadMoreCallBack:^{
        
//        [self loadData];
        
    }];
    
    
}


#pragma mark -------//设置导航&&UI----------
-(void)addAllView
{
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.cycleView];//添加轮播
    [self.headerView addSubview:self.selectBtnView];//添加选择按钮
    [self.headerView addSubview:self.joinView];//立即加入
    [self.headerView addSubview:self.segmentView];//添加切换条目
    
    [self setupNavigationVc];//设置导航试图
    //添加轻扫手势
    self.navigationController.interactivePopGestureRecognizer.delegate = self;
    
}

-(void)setupNavigationVc
{
    self.navigationItem.title = @"";
    
    [self.navigationController.navigationBar setBarTintColor:blueC];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:whiteC}];
    
    //左按钮
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setTitle:@"西安" forState:UIControlStateNormal];
    leftBtn.titleLabel.font = [UIFont systemFontOfSize:MTitleSize];
    leftBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    //............................                                             上 左 下 右
    
    leftBtn.titleEdgeInsets = UIEdgeInsetsMake(5, -23, 5, 7);
    leftBtn.imageEdgeInsets = UIEdgeInsetsMake(14, 42, 12, -4);
    [leftBtn setImage:[UIImage imageNamed:@"down_jt_icon"] forState:UIControlStateNormal];
    [leftBtn setTitleColor:whiteC forState:UIControlStateNormal];
    leftBtn.size = CGSizeMake(50, 40);
    [leftBtn addTarget:self action:@selector(mapLocationBtnClick) forControlEvents:UIControlEventTouchUpInside];
    self.earaButton = leftBtn;
    UIBarButtonItem *itemLeftBar = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = itemLeftBar;
    
    
    //右按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn setImage:[UIImage imageNamed:@"navigationbar_pop_clear"] forState:UIControlStateNormal];
    rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 5, 0, -5);
    rightBtn.size = CGSizeMake(23, 23);
    
    [rightBtn addTarget:self action:@selector(saosaoClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *itemRightBar = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = itemRightBar;
    
    
    //设置搜索条
    UIView *searVi = [[UIView alloc]initWithFrame:CGRectMake(60, 30, SCREEN_WIDTH-130, 24)];
    
    searVi.backgroundColor = deepBlueC;
    searVi.layer.cornerRadius = 12;
    searVi.layer.masksToBounds = YES;
    searVi.layer.borderColor = [blueC CGColor];
    searVi.layer.borderWidth = 1.0f;
    
    UITextField *textF = [[UITextField alloc]initWithFrame:CGRectMake(13, 0, searVi.width-10, 24)];
    
    textF.attributedPlaceholder = [[NSAttributedString alloc]initWithString:@" 工作／人才／企业／项目／合伙人" attributes:@{NSForegroundColorAttributeName: whiteC}];
    
    //textF.placeholder = @"工作／人才／企业／项目／合伙人";
    textF.tintColor = whiteC;
    textF.backgroundColor = clearC;
    textF.font = [UIFont systemFontOfSize:subTitleSize];
    textF.textColor = MainColor;
    textF.textAlignment = NSTextAlignmentLeft;
    self.textF = textF;
    UIImageView *imagev = [[UIImageView alloc]init];
    imagev.frame = CGRectMake(-3, 0, 15, 15);
    imagev.image = [UIImage imageNamed:@"search_image_icon"];
    imagev.contentMode = UIViewContentModeCenter;
    //    始终显示搜索图标
    textF.leftViewMode = UITextFieldViewModeAlways;
    
    //右边删除所有图标
    textF.clearButtonMode = UITextFieldViewModeAlways;
    
    textF.leftView = imagev;
    textF.delegate = self;
    [searVi addSubview:textF];
    
    self.navigationItem.titleView = searVi;
    
}

#pragma mark ----------定位---------
-(void)mapLocationBtnClick{
    
    CityList *cvc = [[CityList alloc]init];
    cvc.selectCity = ^(NSString *cityName){
        
        CGSize size = [cityName sizeWithFont:[UIFont systemFontOfSize:MTitleSize] maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        
        HWLog(@"%f",size.width);
        if (size.width < 35 && size.width >0) {
            self.earaButton.size = CGSizeMake(50, 40);
            self.earaButton.titleEdgeInsets = UIEdgeInsetsMake(5, -23, 5, 7);
            self.earaButton.imageEdgeInsets = UIEdgeInsetsMake(14, 42, 12, -4);
            self.searchBar.frame = CGRectMake(60, 30, SCREEN_WIDTH-130, 24);
            self.textF.frame = CGRectMake(13, 0, SCREEN_WIDTH-130-10, 24);
        }
        if (size.width < 50 && size.width >35) {
            
            self.earaButton.size = CGSizeMake(65, 40);
            self.earaButton.titleEdgeInsets = UIEdgeInsetsMake(5, -28, 5, 15);
            self.earaButton.imageEdgeInsets = UIEdgeInsetsMake(14, 50, 12, 4);
            self.searchBar.frame = CGRectMake(80, 30, SCREEN_WIDTH-152, 24);
            self.textF.frame = CGRectMake(13, 0, SCREEN_WIDTH-152-10, 24);
        }
        if (size.width >50) {
            //self.earaButton.frame = CGRectMake(10, 0, 70, 40);
            self.earaButton.size = CGSizeMake(83, 40);
            self.earaButton.titleEdgeInsets = UIEdgeInsetsMake(5, -28, 5, 10);
            self.earaButton.imageEdgeInsets = UIEdgeInsetsMake(14, 69, 12, 2);
            self.searchBar.frame = CGRectMake(85, 30, SCREEN_WIDTH-167, 24);
            self.textF.frame = CGRectMake(13, 0, SCREEN_WIDTH-167-10, 24);
        }
        
        
        
        [self.earaButton setTitle:cityName forState:UIControlStateNormal];
        
        
        HWLog(@"%@",cityName);
        
    };
    MainNavigationController *navi = [[MainNavigationController alloc]initWithRootViewController:cvc];
    [self presentViewController:navi animated:YES completion:nil];
    
}

#pragma mark -----//TextFieldDelegate方法-----
-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    SearchViewTool *vc = [[SearchViewTool alloc]init];
    MainNavigationController *nvc = [[MainNavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:nvc animated:YES completion:nil];
    
}


#pragma mark --------扫一扫----------
-(void)saosaoClick
{
    [self scanOtherPeoplesCode];
}


#pragma mark --------/*Action*/-------

/**轮播图的代理方法*/
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    HWLog(@"---点击了第%ld张图片", (long)index);
    
}

/**选择器添加的实现方法*/
-(void)didselectViewAtIndex:(NSInteger)index{
    if (index == 0) {//全职速聘
        
        QZSPViewController *vc = [[QZSPViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == 1) { //兼职达人
        JZDRViewController *vc = [JZDRViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == 2) {//校园直聘
        Campus365ViewController *vc = [Campus365ViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == 3) {//有才有貌
        YCYMViewController *vc = [YCYMViewController new];
        [self.navigationController pushViewController:vc animated:YES];
        
    }
    else if (index == 4) {//有商有客
        YSYKViewController *vc = [YSYKViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == 5) {//创孵天下
        VentureWorldViewController *vc = [VentureWorldViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else if (index == 6) {//名气在线
        ComOnlineViewController *vc = [ComOnlineViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    else {//全部
        HWLog(@"2");
        HomeAllViewController *vc = [HomeAllViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
    HWLog(@"%zd",index);
    
}

#pragma mark -----/**立即加入*/-----
-(void)joinBtnClick{//立即加入
    HWLog(@"66666");
    
    [self loginAction];
    if (self.loginOrNot) {
        [LWAlertView shoWithMessage:@"立即加入"];
    }
    
}
#pragma mark /--------切换视图--------//
-(void)SGSegmentedControl:(SGSegmentedControl *)segmentedControl didSelectBtnAtIndex:(NSInteger)index{
    if (index == 0) {
        self.segStr = @"职位";
        [self.tableView reloadData];
    }
    else if (index == 1){
        self.segStr = @"高颜值";
        [self.tableView reloadData];
    }
    else if (index == 2){
        self.segStr = @"企业";
        [self.tableView reloadData];
    }
    else if (index == 3){
        self.segStr = @"商家";
        [self.tableView reloadData];
    }
    else if (index == 4) {
        self.segStr = @"项目";
        [self.tableView reloadData];
    }
    else {
        self.segStr = @"合伙人";
        [self.tableView reloadData];
    }
}

#pragma mark //---------*加载数据*--------//
-(void)loadData
{
    [QPTRequestManager POST:QPTHomeSevericeAPI parameters:nil responseSeializerType:QPTResponseSeializerTypeJSON success:^(id responseObject) {
        
        ESRootClass *rootClass = [ESRootClass new];
        
        [rootClass getResponseObjectWith:responseObject];
        
        
        //顶部轮播
        NSMutableArray *arrLB = [NSMutableArray array];
        
        for (NSDictionary *dic in rootClass.topBanners) {
            
            
            NSString *str = [QPTSevericeHeaderAPI stringByAppendingFormat:@"%@",dic[@"imgUrl"]];
            
            
            [arrLB addObject:str];
            
        }
        self.cycleView.imageURLStringsGroup = arrLB;
        
        
    } failure:^(NSError *error) {
        
        HWLog(@"%@",error);
        
    }];
}

#pragma mark  /++++++tableView的代理方法++++++/
//行数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat cellH;
    if ([self.segStr isEqualToString:@"职位"]) {
        cellH = MainCellHeight;
    }
    else if ([self.segStr isEqualToString:@"合伙人"]) {
        PartnerLayout *layout = [[PartnerLayout alloc]initWithPartnerCell];
        
        cellH = layout.partnerCellH;
    }
    else{
        cellH = SubCellHeight;
    }
    
    return cellH;
}

//cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.segStr isEqualToString:@"职位"]) {
        HotZWTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"aa"];
        if (cell == nil) {
            cell = [[HotZWTableViewCell alloc]initWithFrame:cell.bounds];
            qptCell = cell;
            [cell.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"zwListImage.jpg"]];
            cell.postLab.text = @"新媒体主编";
            cell.salaryLab.text = @"5-8k";
            cell.companyLab.text = @"沃趣互动";
            //            cell.vipIcon.image = [UIImage imageNamed:@"vipIcon"];
            cell.typeLab.text = @"互联网/电子商务";
            cell.academicIcon.image = [UIImage imageNamed:@"academicIcon"];
            cell.academicLab.text = @"大专";
            cell.timeIcon.image = [UIImage imageNamed:@"timeIcon"];
            cell.timeLab.text = @"3年";
            cell.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
            cell.addressLab.text = @"西安市";
            cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
            cell.numLab.text = @"23";
        }
    }
    else if ([self.segStr isEqualToString:@"高颜值"]) {
        NearHighTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"bb"];
        if (cell == nil) {
            cell = [[NearHighTableViewCell alloc]initWithFrame:cell.bounds];
            qptCell = cell;
            [cell.imgView sd_setImageWithURL:nil placeholderImage:[UIImage imageNamed:@"perImage.jpg"]];
            cell.nameLab.text = @"韩雪冬";
            cell.postLab.text = @"资深网页设计师";
            cell.salaryLab.text = @"5-8k";
            cell.academicIcon.image = [UIImage imageNamed:@"academicIcon"];
            cell.academicLab.text = @"大专";
            cell.experIcon.image = [UIImage imageNamed:@"timeIcon"];
            cell.experLab.text = @"3年";
            cell.addressIcon.image= [UIImage imageNamed:@"locationIcon"];
            cell.addressLab.text = @"西安市";
            cell.eyeLab.text = @"3228";
            cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
            
        }
    }
    else if ([self.segStr isEqualToString:@"企业"]) {
        NearComTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cc"];
        if (cell == nil) {
            cell = [[NearComTableViewCell alloc]initWithFrame:cell.bounds];
            qptCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"comImage.jpg"];
            cell.nameLab.text = @"康威通信国际";
            cell.industryLab.text = @"移动互联网,O2O";
            cell.addressIcon.image= [UIImage imageNamed:@"locationIcon"];
            cell.addressLab.text = @"西安市";
            cell.eyeLab.text = @"3228";
            cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
        }
    }
    else if ([self.segStr isEqualToString:@"商家"]) {
        NearComTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"dd"];
        if (cell == nil) {
            cell = [[NearComTableViewCell alloc]initWithFrame:cell.bounds];
            qptCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"zwListImage.jpg"];
            cell.nameLab.text = @"小肥羊";
            cell.industryLab.text = @"移动互联网,O2O";
            cell.addressIcon.image= [UIImage imageNamed:@"locationIcon"];
            cell.addressLab.text = @"西安市";
            cell.eyeLab.text = @"3228";
            cell.eyeIcon.image = [UIImage imageNamed:@"eyeIcon"];
        }
    }
    else if ([self.segStr isEqualToString:@"项目"]) {
        GoodItemsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ee"];
        if (cell == nil) {
            cell = [[GoodItemsTableViewCell alloc]initWithFrame:cell.bounds];
            qptCell = cell;
            cell.imgView.image = [UIImage imageNamed:@"classics.jpg"];
            cell.titleLabel.text = @"大话西游";
            cell.amountLabel.text = @"150W";
            cell.amountLabel.textColor = orangeC;
            cell.subLabel.text = @"儿童动漫电影平台";
            cell.addressIcon.image = [UIImage imageNamed:@"locationIcon"];
            cell.addressLabel.text = @"西安";
            cell.praiseLabel.text = @"23";
            cell.praiseIcon.image = [UIImage imageNamed:@"praiseNIcon"];
            cell.numberLabel.text = @"2345";
            cell.numberIcon.image = [UIImage imageNamed:@"eyeIcon"];
            
            cell.label.text = @"种子轮";
            cell.label.layer.borderWidth = 1;
            cell.label.layer.cornerRadius = 2;
        }
    }
    else {
        PartnerTableViewCell *cell = [[PartnerTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cia"];
        qptCell = cell;
    }
    
    return qptCell;
}

//cell
-(void)cellConfigWith:(HotZWTableViewCell *)cell cellForRowIndexPath:(NSIndexPath *)indexPath
{
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    Fjoblist *jonModel = self.qzspArr[indexPath.row];
    //    cell.jobList = jonModel;
    //
    //    cell.indePath = indexPath;
    //    cell.modelArr = self.qzspComArr;
    
    
}

//tableView的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HWLog(@"%zd",@(indexPath.row).intValue);
    
    if ([self.segStr isEqualToString:@"高颜值"]) {
        
        YCPersonDeViewController *vc = [[YCPersonDeViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
    }else if ([self.segStr isEqualToString:@"企业"]){
        
        YCComDeViewController *vc = [[YCComDeViewController alloc]init];
        
        [self.navigationController pushViewController:vc animated:YES];
    }else if ([self.segStr isEqualToString:@"商家"]) {
        
        YSYKDetailViewController *vc = [[YSYKDetailViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
        
        
    }else {
        YCJobDeViewController *vc = [YCJobDeViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }
    
}

#pragma mark --------滚动切换条目悬浮-------------
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat offset = self.tableView.contentOffset.y;
    if (offset>self.joinView.y+self.joinView.height) {
        
        [self.view addSubview:self.backView];
        [self.backView addSubview:self.segmentView];
        self.segmentView.y = 0;
    }
    else{
        [self.backView removeFromSuperview];
        [self.headerView addSubview:self.segmentView];
        self.segmentView.y = self.joinView.botoom+5;
    }
}

//滚动取消第一响应者
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    [self.searchBar resignFirstResponder];
}

//左滑返回手势
-(BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if (self.navigationController.viewControllers.count == 1) {
        return NO;
    }
    else{
        return YES;
    }
}

#pragma mark -----Lazy(懒加载)
/**      试图       */
-(UIView *)headerView//headerView
{
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, lunBoheight)];
        _headerView.backgroundColor = grayC;
        
    }
    return _headerView;
}


-(UITableView *)tableView//tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableHeaderView = self.headerView;
        _tableView.tableHeaderView.height = self.segmentView.y+self.segmentView.height;
        
        _tableView.separatorStyle = NO;
    }
    return _tableView;
}


//按钮视图
-(UIView *)selectBtnView
{
    if (!_selectBtnView) {
        _selectBtnView = [[UIView alloc]initWithFrame:CGRectMake(0, self.cycleView.botoom, SCREEN_WIDTH, SCREEN_WIDTH*0.28+SCREEN_WIDTH*0.22)];
        _selectBtnView.backgroundColor = whiteC;
        
        [self creatSelectViewWith:_selectBtnView.bounds andselectArray:(NSMutableArray *)self.selectAry andSuperView:_selectBtnView];
    }
    return _selectBtnView;
}

//立即加入
-(UIView *)joinView{
    if (!_joinView) {
        _joinView = [[UIView alloc]initWithFrame:CGRectMake(0, self.selectBtnView.botoom+DistanceForCell, SCREEN_WIDTH, 50)];
        _joinView.backgroundColor = whiteC;
        
        JoinInView *join = [[JoinInView alloc]initWithFrame:_joinView.bounds];
        
        [join setPropertyWithLabText:@"万物共享，所见即所得" andLabC:MainColor andBtnTitle:@"立即加入" andBtnTextC:blueC andImage:[UIImage imageNamed:@"friend_image"] andTarget:self andAction:@selector(joinBtnClick)];
        [_joinView addSubview:join];
        
    }
    return _joinView;
}

//切换试图
-(UIView *)segmentView{
    if (!_segmentView) {
        _segmentView = [[UIView alloc]initWithFrame:CGRectMake(0, self.joinView.botoom + 5, SCREEN_WIDTH, 50)];
        _segmentView.backgroundColor = grayC;
        
        NSArray *arr = @[@"职位",@"高颜值",@"企业",@"商家",@"项目",@"合伙人"];
        
        self.segment = [SGSegmentedControl segmentedControlWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 49) delegate:self segmentedControlType:SGSegmentedControlTypeScroll titleArr:arr];
        self.segment.backgroundColor = whiteC;
        self.segment.titleColorStateNormal = MainColor;
        self.segment.titleColorStateSelected = MainColor;
        self.segment.indicatorColor = blueC;
        [_segmentView addSubview:self.segment];
    }
    return _segmentView;
}

//悬浮视图
-(UIView *)backView{
    if (!_backView) {
        _backView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 50)];
        _backView.backgroundColor = redC;
    }
    return _backView;
}

/** 数据加载  */
//选择按钮数组
-(NSMutableArray *)selectAry//选择按钮
{
    if (!_selectAry) {
        _selectAry = [DataBase addQptSeleBarArray];
    }
    return _selectAry;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
