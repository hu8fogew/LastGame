




/********************* 有任何问题欢迎反馈给我 liuweiself@126.com ****************************************/
/***************  https://github.com/waynezxcv/Gallop 持续更新 ***************************/
/******************** 正在不断完善中，谢谢~  Enjoy ******************************************************/


#import "MomentsViewController.h"
#import "LWImageBrowser.h"
#import "DetailCommentCell.h"
#import "StatusModel.h"
#import "CellLayout.h"
#import "AwardView.h"
#import "LQImgPickerActionSheet.h"
#import "CCPActionSheetView.h"
#import "SelectPhotoViewController.h"
#import "CommentModel.h"
#import "CommentView.h"

#import "QPTKeyBoardViewTool.h"

@interface CommentViewController ()

<UITableViewDataSource,UITableViewDelegate,DetailCommentCellDelegate,UIScrollViewDelegate,LQImgPickerActionSheetDelegate,RCEmojiViewDelegate,ComentViewDelegate>

@property (nonatomic,strong) NSArray* fakeDatasource;
@property (nonatomic,strong) UITableView* tableView;
@property (nonatomic,strong) NSMutableArray* dataSource;
@property (nonatomic,assign,getter = isNeedRefresh) BOOL needRefresh;
@property (nonatomic ,strong) CCPActionSheetView *ccpView;
@property(nonatomic,assign) CGRect editFrame;
@property (nonatomic,strong) UIView *deleView;
@property (nonatomic,strong) CommentView* commentView;
@property (nonatomic,strong) CommentModel* postComment;
@property (nonatomic,strong) QPTKeyBoardViewTool *keyBoardView;
@property (nonatomic, assign) CGFloat animationDuration;  //动画时间
@property (nonatomic ,assign) CGFloat upViewHeight;
@end
@implementation CommentViewController

#pragma mark - ViewControllerLifeCycle

- (void)loadView {
    [super loadView];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.view addSubview:self.tableView];
    
    [self setup];
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidAppearNotifications:)
                                                 name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHidenNotifications:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
    
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidHideNotification
     
                                                  object:nil];
}

#pragma mark - Keyboard

- (void)tapView:(id)sender {
    [self.commentView endEditing:YES];
}

- (void)keyboardDidAppearNotifications:(NSNotification *)notifications {
    NSDictionary *userInfo = [notifications userInfo];
    CGSize keyboardSize = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue].size;
    CGFloat keyboardHeight = keyboardSize.height;
    
    //获取动画时长
    CGFloat keyboardAnimaitonDuration = [notifications.userInfo [UIKeyboardAnimationDurationUserInfoKey] integerValue];
    self.animationDuration = keyboardAnimaitonDuration;
    NSInteger option = [notifications.userInfo [UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    CGFloat upheight = 0;
    if ((keyboardHeight +self.upViewHeight+self.commentView.height-SCREEN_HEIGHT+64)<0) {
        upheight = -(keyboardHeight +self.upViewHeight+self.commentView.height-SCREEN_HEIGHT+64);
    }else{
        upheight = (keyboardHeight +self.upViewHeight+self.commentView.height-SCREEN_HEIGHT+64);
    }
    
    [UIView animateWithDuration:keyboardAnimaitonDuration delay:0 options:option animations:^{
        
        self.tableView.y = -64-upheight;
        
    } completion:nil];
    
}

- (void)keyboardDidHidenNotifications:(NSNotification *)notifications {
    [UIView animateWithDuration:self.animationDuration animations:^{
       
        self.tableView.y= -64;
        
    }];
}







- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (self.isNeedRefresh) {
        [self refreshBegin];
    }
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CellLayout* layout = self.dataSource[indexPath.row];
    self.upViewHeight = layout.cellHeight;
    return self.upViewHeight;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString* cellIdentifier = @"cellIdentifier";
    DetailCommentCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[DetailCommentCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.delegate = self;
    }
    [self confirgueCell:cell atIndexPath:indexPath];
    return cell;
}



- (void)confirgueCell:(DetailCommentCell *)cell atIndexPath:(NSIndexPath *)indexPath {
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.indexPath = indexPath;
    CellLayout* cellLayout = self.dataSource[indexPath.row];
    cell.cellLayout = cellLayout;
    
    [self callbackWithCell:cell];
    
}

- (void)callbackWithCell:(DetailCommentCell *)cell {
    
    __weak typeof(self) weakSelf = self;
    cell.clickedLikeButtonCallback = ^(DetailCommentCell* cell,BOOL isLike) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself tableViewCell:cell didClickedLikeButtonWithIsLike:isLike];
    };
    
    cell.clickedOpenCellCallback = ^(DetailCommentCell* cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself openTableViewCell:cell];
    };
    
    cell.clickedAvatarCallback = ^(DetailCommentCell* cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself showAvatarWithCell:cell];
    };
    
    cell.clickedImageCallback = ^(DetailCommentCell* cell,NSInteger imageIndex) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself tableViewCell:cell showImageBrowserWithImageIndex:imageIndex];
    };
    cell.clickedCommentButtonCallback = ^(DetailCommentCell* cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself onCommentInCell:cell];
    };
    
    cell.clickedReCommentCallback = ^(DetailCommentCell* cell,CommentModel* model) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself reCommentWithCell:cell commentModel:model];
    };
    
    cell.clickedCheckOutAwardCellCallback = ^(DetailCommentCell *cell) {
        __strong typeof(weakSelf) sself = weakSelf;
        [sself checkAwardRecord:cell];
    };
    
}

#pragma mark - Actions


- (void)onCommentInCell:(DetailCommentCell *)cell{
    
    HWLog(@"评论");
    self.postComment.from = @"Waynezxcv的粉丝";
    self.postComment.to = @"";
    self.postComment.index = cell.indexPath.row;
//    self.commentView.placeHolder = @"  评论";
    [self.keyBoardView becomeFirstResponder];
    
}

-(void)beginChangeComment:(UITextView *)textView
{
    self.postComment.from = @"Waynezxcv的粉丝";
    self.postComment.to = @"";
    self.postComment.index = 0;
//    self.commentView.placeHolder = @"  评论";
    if (![self.commentView.textView isFirstResponder]) {
        [self.commentView becomeFirstResponser];
    }
}

//打赏
-(void)onAwardIncell:(DetailCommentCell *)cell
{
    [self awardOtherPeopleCoinWithImageStr:cell.cellLayout.statusModel.avatar name:cell.cellLayout.statusModel.name];
    //    }
    
}
#pragma mark ---打赏

-(void)didAwardCoinNum:(CGFloat)num
{
    [self.awardVc dismiss];
    [LWAlertView shoWithMessage:[NSString stringWithFormat:@"已打赏%f通币",num]];
}

//开始回复评论
- (void)reCommentWithCell:(DetailCommentCell *)cell commentModel:(CommentModel *)commentModel {
    self.postComment.from = @"waynezxcv的粉丝";
    self.postComment.to = commentModel.to;
    self.postComment.index = commentModel.index;
    self.commentView.placeHolder = [NSString stringWithFormat:@"回复%@:",commentModel.to];
    if (![self.commentView.textView isFirstResponder]) {
        [self.commentView becomeFirstResponser];
    }
}


- (void)onShareInCell:(DetailCommentCell *)cell{
    
    AwardView *award = [[AwardView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/6, SCREEN_HEIGHT/4, SCREEN_WIDTH*3/4, SCREEN_WIDTH*2/3)];
    
    CCPActionSheetView *sheet =[[CCPActionSheetView alloc]initWithAlertView:award];
    
    sheet.viewAnimateStyle = ViewAnimateFromRight;
    
    HWLog(@"转发");
}

-(void)onDeleteInCell:(DetailCommentCell *)cell
{
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH/6, SCREEN_HEIGHT/4, SCREEN_WIDTH*3/4, SCREEN_WIDTH*1/3-10)];
    vi.backgroundColor = whiteC;
    
    vi.layer.cornerRadius = 6;
    vi.layer.masksToBounds = YES;
    
    UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 20, SCREEN_WIDTH*3/4-30, 30) andTextColor:MainColor andTextFont:mainTitleSize];
    lab.backgroundColor = clearC;
    lab.text = @"您确定要删除这条动态吗？";
    lab.font = [UIFont fontWithName:@"AmericanTypewriter" size:mainTitleSize+2];
    [vi addSubview:lab];
    
    UIButton *cancelB = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelB.frame = CGRectMake(vi.width-120, vi.height-30, 45, 20);
    [cancelB setTitle:@"取消" forState:UIControlStateNormal];
    cancelB.backgroundColor = clearC;
    [cancelB setTitleColor:SecondTitleColor forState:UIControlStateNormal];
    [cancelB addTarget:self action:@selector(cancelDeleteClick) forControlEvents:UIControlEventTouchUpInside];
    [vi addSubview:cancelB];
    
    UIButton *okB = [UIButton buttonWithType:UIButtonTypeCustom];
    okB.frame = CGRectMake(cancelB.right+20, vi.height-30, 45, 20);
    [okB setTitle:@"确定" forState:UIControlStateNormal];
    okB.backgroundColor = clearC;
    [okB setTitleColor:blueC forState:UIControlStateNormal];
    [okB addTarget:self action:@selector(okDeleteClick) forControlEvents:UIControlEventTouchUpInside];
    [vi addSubview:okB];
    
    CCPActionSheetView *sheet =[[CCPActionSheetView alloc]initWithAlertView:vi];
    self.ccpView = sheet;
    
    sheet.viewAnimateStyle = ViewAnimateScale;
    
}


-(void)okDeleteClick
{
    [self.ccpView removeFromSuperview];
    self.ccpView = nil;
}
-(void)cancelDeleteClick
{
    //0、147、221
    [self.ccpView removeFromSuperview];
    self.ccpView = nil;
    //    self.ccpView.isBGClose = YES;
}


//-----发布朋友圈编辑跳转
//-(void)editClickBtn:(UITapGestureRecognizer *)tap
//{
//    HWLog(@"我来编辑");
//    
//    SendLifeController *vc = [SendLifeController new];
//    
//    vc.editingType = @"compose";
//    
//    MainNavigationController *nav = [[MainNavigationController alloc]initWithRootViewController:vc];
//    [self.navigationController presentViewController:nav animated:YES completion:nil];
//    
//}


//点击查看大图
- (void)tableViewCell:(DetailCommentCell *)cell showImageBrowserWithImageIndex:(NSInteger)imageIndex {
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
- (void)showAvatarWithCell:(DetailCommentCell *)cell {
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
- (void)tableViewCell:(DetailCommentCell *)cell didClickedLikeButtonWithIsLike:(BOOL)isLike {
    
    
    CellLayout* layout = [self.dataSource objectAtIndex:cell.indexPath.row];
    NSMutableArray* newLikeList = [[NSMutableArray alloc] initWithArray:layout.statusModel.likeList];
    if (isLike) {
        [newLikeList addObject:@"waynezxcv的粉丝"];
    } else {
        [newLikeList removeObject:@"waynezxcv的粉丝"];
    }
    
    StatusModel* statusModel = layout.statusModel;
    statusModel.likeList = newLikeList;
    statusModel.isLike = isLike;
    layout = [self layoutWithStatusModel:statusModel index:cell.indexPath.row];
    
    [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:layout.cellHeight];
    
    [self.dataSource replaceObjectAtIndex:cell.indexPath.row withObject:layout];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:cell.indexPath.row inSection:0]]
                          withRowAnimation:UITableViewRowAnimationNone];
}

//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return DistanceForCell;
//}



//展开Cell
- (void)openTableViewCell:(DetailCommentCell *)cell {
    CellLayout* layout =  [self.dataSource objectAtIndex:cell.indexPath.row];
    StatusModel* model = layout.statusModel;
    CellLayout *newLayout = [[CellLayout alloc]initCommentLayoutWithStatusModel:model index:cell.indexPath.row dateFormatter:self.dateFormatter];
    
    [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:newLayout.cellHeight];
    
    [self.dataSource replaceObjectAtIndex:cell.indexPath.row withObject:newLayout];
    [self.tableView reloadRowsAtIndexPaths:@[cell.indexPath]
                          withRowAnimation:UITableViewRowAnimationNone];
}



//发表评论
- (void)postCommentWithCommentModel:(CommentModel *)model {
    
    CellLayout* layout = [self.dataSource objectAtIndex:model.index];
    NSMutableArray* newCommentLists = [[NSMutableArray alloc] initWithArray:layout.statusModel.commentList];
    NSDictionary* newComment = @{@"from":model.from,
                                 @"to":model.to,
                                 @"content":model.content};
    [newCommentLists addObject:newComment];
    StatusModel* statusModel = layout.statusModel;
    statusModel.commentList = newCommentLists;
    CellLayout* newLayout = [self layoutWithStatusModel:statusModel index:model.index];
    
    
    UITableViewCell* cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:model.index inSection:0]];
    [self coverScreenshotAndDelayRemoveWithCell:cell cellHeight:newLayout.cellHeight];
    
    [self.dataSource replaceObjectAtIndex:model.index withObject:newLayout];
    [self.tableView reloadRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:model.index inSection:0]]
                          withRowAnimation:UITableViewRowAnimationNone];
}



//查看打赏
-(void)checkAwardRecord:(DetailCommentCell *)cell
{
    AwardCoinController *vc = [[AwardCoinController alloc]init];
    
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [self.commentView endEditing:YES];
    [self.keyBoardView resignFirstResponder];
//    CGFloat offset = scrollView.contentOffset.y;
    
}





- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView {

}

#pragma mark - Data

//模拟下拉刷新
- (void)refreshBegin {
    [self fakeDownload];

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
    [self.tableView reloadData];
    [UIView animateWithDuration:0.35f animations:^{
        self.tableView.contentInset = UIEdgeInsetsMake(64.0f, 0.0f, 0.0f, 0.0f);
    } completion:^(BOOL finished) {
        self.needRefresh = NO;
    }];
}

//cell的样式
- (CellLayout *)layoutWithStatusModel:(StatusModel *)statusModel index:(NSInteger)index {
    
    CellLayout *layout = [[CellLayout alloc]initCommentLayoutWithStatusModel:statusModel index:index dateFormatter:self.dateFormatter];
    
    return layout;
}

#pragma mark - Getter

- (void)setup {
    self.needRefresh = YES;
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"详情";
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.keyBoardView];
    

    
    
}

-(QPTKeyBoardViewTool *)keyBoardView
{
    if (!_keyBoardView) {
        
        __weak typeof(self) weakSelf = self;
        _keyBoardView = [QPTKeyBoardViewTool showKeyBoardWithConfigToolBarHeight:50 sendTextCompletion:^(NSString *commentString) {
            
            weakSelf.postComment.content = commentString;
            [weakSelf postCommentWithCommentModel:weakSelf.postComment];
            
        }];
        
        [_keyBoardView setInputViewPlaceHolderText:@"评论"];
        
    }
    
    return _keyBoardView;
}



- (CommentView *)commentView {
    if (_commentView) {
        return _commentView;
    }
    __weak typeof(self) wself = self;
    _commentView = [[CommentView alloc]
                    initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50.0f-64.0f, SCREEN_WIDTH, 50.0f)
                    sendBlock:^(NSString *content) {
                        __strong  typeof(wself) swself = wself;
                        swself.postComment.content = content;
                        [swself postCommentWithCommentModel:swself.postComment];
                    }];
//    _commentView.placeHolder = @"  评论";
    _commentView.delegate = self;
    return _commentView;
}






- (UITableView *)tableView {
    if (_tableView) {
        return _tableView;
    }
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, -64, SCREEN_WIDTH, SCREEN_HEIGHT)
                                              style:UITableViewStyleGrouped];
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.sectionFooterHeight = 0;
    return _tableView;
}

- (NSMutableArray *)dataSource {
    if (_dataSource) {
        return _dataSource;
    }
    _dataSource = [[NSMutableArray alloc] init];
    return _dataSource;
}


- (NSDateFormatter *)dateFormatter {
    static NSDateFormatter* dateFormatter;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"MM月dd日 hh:mm"];
    });
    return dateFormatter;
}


- (CommentModel *)postComment {
    if (_postComment) {
        return _postComment;
    }
    _postComment = [[CommentModel alloc] init];
    return _postComment;
}

- (NSArray *)fakeDatasource {
    if (_fakeDatasource) {
        return _fakeDatasource;
    }
    _fakeDatasource =
    @[
      
      @{@"type":@"image",
        @"name":@"G-SHOCK",
        @"avatar":@"http://tp3.sinaimg.cn/1595142730/50/5691224157/1",
        @"content":@"就算平时没有时间，周末也要带着G-SHOCK到户外走走，感受大自然的满满正能量！",
        @"date":@"1459668442",
        @"imgs":@[@"http://ww2.sinaimg.cn/mw690/5f13f24ajw1f2hc1r6j47j20dc0dc0t4.jpg"],
        @"statusID":@"7"},
      
      ];
    return _fakeDatasource;
}

@end
