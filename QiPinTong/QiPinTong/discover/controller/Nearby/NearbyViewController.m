//
//  NearbyViewController.m
//  QiPinTong
//
//  Created by taylor on 2017/3/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "NearbyViewController.h"
#import "FlipTableView.h"
#import "SegmentTapView.h"

@interface NearbyViewController ()<SegmentTapViewDelegate,FlipTableViewDelegate>
@property (nonatomic, strong)SegmentTapView *segment;
@property (nonatomic, strong)FlipTableView *flipView;
@property (strong, nonatomic) NSMutableArray *controllsArray;

@property (strong,nonatomic) UIView *bottomView;
@property (strong,nonatomic) JoinInView *joinView;

@end

@implementation NearbyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    [self initSegment];
    [self initFlipTableView];
}


//
-(void)initSegment{
    self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 20, SCREEN_WIDTH, 44) withDataArray:@[@"好工作",@"高颜值",@"名企",@"合伙人",@"生活圈"] withFont:mainTitleSize+1];
    self.segment.delegate = self;
    
    [self.navigationController.view addSubview:self.segment];
}

//
-(void)initFlipTableView{
    if (!self.controllsArray) {
        self.controllsArray = [NSMutableArray array];
    }
    
    NearJobViewController *jobVC = [NearJobViewController new];
    NearHighViewController *highVC = [NearHighViewController new];
    NearComViewController *comVC = [NearComViewController new];
    NearPartnerViewController *partVC = [NearPartnerViewController new];
    NearLifeViewController *lifeVC = [NearLifeViewController new];
    
    [self.controllsArray addObject:jobVC];
    [self.controllsArray addObject:highVC];
    [self.controllsArray addObject:comVC];
    [self.controllsArray addObject:partVC];
    [self.controllsArray addObject:lifeVC];
    
    self.flipView = [[FlipTableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) withArray:_controllsArray];
    self.flipView.delegate = self;
    [self.view addSubview:self.flipView];
    
    [self.view addSubview:self.bottomView];
}

//返回按钮跳转
-(void)backBtnClick{
    [self.segment removeFromSuperview];
    [self.navigationController popViewControllerAnimated:YES];
}

//底部视图
-(UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, SCREEN_HEIGHT-50-64, SCREEN_WIDTH, 50)];
        _bottomView.backgroundColor = [MainColor colorWithAlphaComponent:0.7];
        
        self.joinView = [[JoinInView alloc]initWithFrame:_bottomView.bounds];
        [self.joinView setPropertyWithLabText:@"企聘通•更轻松！好工作触手可及" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"jzdr_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        
        [_bottomView addSubview:self.joinView];
    }
    return _bottomView;
}

-(void)joinBtnClick:(UIButton *)btn{
    if (btn.tag==0) {
        HWLog(@"00");
        
    }
    else if (btn.tag==1){
        HWLog(@"01");
        
    }
    else if (btn.tag==2){
        HWLog(@"02");
        
    }
    else if (btn.tag==3){
        HWLog(@"03");
        
    }
    else{
        HWLog(@"04");
        
    }
    
}

//选中切换
-(void)selectedIndex:(NSInteger)index
{
    [self.view addSubview:self.bottomView];
    
    NSLog(@"%ld",index);
    [self.flipView selectIndex:index];
    if (index==0) {
        [self.joinView setPropertyWithLabText:@"企聘通•更轻松！好工作触手可及" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"jzdr_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 0;
        
    }
    else if (index==1) {
        [self.joinView setPropertyWithLabText:@"才貌双全让我们的人生更加精彩" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"ycym_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 1;
        
    }
    else if (index==2) {
        [self.joinView setPropertyWithLabText:@"名企在线资源共享，不仅仅是offer" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"mqzx_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 2;
        
    }
    else if (index==3) {
        [self.joinView setPropertyWithLabText:@"创业人缺的是合伙人脉" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"partner_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 3;
        
    }
    else {
        [self.joinView setPropertyWithLabText:@"免费入驻，客流多重共享" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"ysyk_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 4;
        
    }
}


//滑动切换
-(void)scrollChangeToIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.segment selectIndex:index];
    
    if (index==1) {
        [self.joinView setPropertyWithLabText:@"企聘通•更轻松！好工作触手可及" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"jzdr_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 0;
    }
    else if (index==2) {
        [self.joinView setPropertyWithLabText:@"才貌双全让我们的人生更加精彩" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"ycym_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 1;
        
    }
    else if (index==3) {
        [self.joinView setPropertyWithLabText:@"名企在线资源共享，不仅仅是offer" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"mqzx_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 2;
        
    }
    else if (index==4) {
        [self.joinView setPropertyWithLabText:@"创业人缺的是合伙人脉" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"partner_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 3;
        
    }
    else {
        [self.joinView setPropertyWithLabText:@"免费入驻，客流多重共享" andLabC:whiteC andBtnTitle:@"立即加入" andBtnTextC:whiteC andImage:[UIImage imageNamed:@"ysyk_image"] andTarget:self andAction:@selector(joinBtnClick:)];
        self.joinView.selBtn.tag = 4;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
