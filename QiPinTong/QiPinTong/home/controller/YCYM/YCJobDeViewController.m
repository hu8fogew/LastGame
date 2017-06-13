//
//  YCJobDeViewController.m
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YCJobDeViewController.h"

@interface YCJobDeViewController ()<UITableViewDelegate,UITableViewDataSource,YCYMDeHeadViewDelegate,BottomBtnViewDelegate,YCJobCellDelegate>

@property (strong,nonatomic) UITableView *tableView;

@property (strong,nonatomic) UIView *headView;

@property (strong,nonatomic) UIView *bottomView;

@end

@implementation YCJobDeViewController
id jobCell = nil;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"职位详情";

    [self.view addSubview:self.tableView];
    [self.view addSubview:self.bottomView];
}

#pragma mark ------懒加载------
-(UIView *)headView{
    if (!_headView) {
        _headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*0.46)];
        PersonalLayout *personLay = [[PersonalLayout alloc]initOwnerDetailWithSrtId:@"公司"];
        
        YCYMDeHeadView *vi = [[YCYMDeHeadView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, personLay.personViewHeight)];
        vi.backImageView.image = [UIImage imageNamed:@"deBackView"];
        vi.delegate = self;
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
    
    if(self.loginOrNot)
    {
        sender.selected = YES;
        [LWAlertView shoWithMessage: @"已收藏"];
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



-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-70-64, SCREEN_WIDTH, 70)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        BottomBtnView *btnVc = [[BottomBtnView alloc]init];
        btnVc.delegate = self;
        btnVc.frame = _bottomView.bounds;
        [btnVc setupViewWithStringId:@"公司"];
        [_bottomView addSubview:btnVc];
        
    }
    return _bottomView;
}

-(void)bottomActionWithNum:(NSInteger)num
{
    [self loginAction];
    
    if (self.loginOrNot) {
        if (num == 0) {
            [LWAlertView shoWithMessage:@"已关注"];
            HWLog(@"66666666");
        }
        else if (num == 1){
            [LWAlertView shoWithMessage:@"已邀请"];
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
        _tableView.tableHeaderView.height = self.headView.height;
        
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _tableView.allowsSelection = NO;
    }
    return _tableView;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    JobDetialLayout *lay = [[JobDetialLayout alloc]initJobDetialCell];
    
    return lay.jobDetialHeight;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    YCJobFirstTableViewCell *cell = [[YCJobFirstTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"jobDesc"];
    cell.delegate = self;
    
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

#pragma mark ------加好友
-(void)addFriend
{
    [LWAlertView shoWithMessage:@"加好友"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
