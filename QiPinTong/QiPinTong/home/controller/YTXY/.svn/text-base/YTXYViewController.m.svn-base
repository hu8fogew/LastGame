//
//  YTXYViewController.m
//  家长界
//
//  Created by taylor on 2016/12/8.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "YTXYViewController.h"
#import "SegmentTapView.h"
#import "FlipTableView.h"

@interface YTXYViewController ()<SegmentTapViewDelegate,FlipTableViewDelegate>

@property (nonatomic, strong)SegmentTapView *segment;
@property (nonatomic, strong)FlipTableView *flipView;
@property (strong, nonatomic) NSMutableArray *controllsArray;

@end

@implementation YTXYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"易通学院";
    
    [self initSegment];
    [self initFlipTableView];
    
}

#pragma mark ------创建顶部滑动按钮------
-(void)initSegment{
    self.segment = [[SegmentTapView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 40) withDataArray:[NSArray arrayWithObjects:@"要闻",@"视频",@"纪实",@"招聘",@"体育",@"娱乐", nil] withFont:15];
    self.segment.delegate = self;
    [self.view addSubview:self.segment];
}

-(void)initFlipTableView{
    if (!self.controllsArray) {
        self.controllsArray = [[NSMutableArray alloc] init];
    }
    
    NewsViewController *newsVC = [NewsViewController new];
    VideoViewController *videoVC = [VideoViewController new];
    RecordViewController *recordVC = [RecordViewController new];
    JobViewController *jobVC = [JobViewController new];
    SportsViewController *sportsVC = [SportsViewController new];
    RelaxViewController *relaxVC = [RelaxViewController new];
    
    [self.controllsArray addObject:newsVC];
    [self.controllsArray addObject:videoVC];
    [self.controllsArray addObject:recordVC];
    [self.controllsArray addObject:jobVC];
    [self.controllsArray addObject:sportsVC];
    [self.controllsArray addObject:relaxVC];
    
    self.flipView = [[FlipTableView alloc] initWithFrame:CGRectMake(0, 104, SCREEN_WIDTH, self.view.frame.size.height) withArray:_controllsArray];
    self.flipView.delegate = self;
    [self.view addSubview:self.flipView];
}


#pragma mark -------- select Index
-(void)selectedIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.flipView selectIndex:index];
    
}
-(void)scrollChangeToIndex:(NSInteger)index
{
    NSLog(@"%ld",index);
    [self.segment selectIndex:index];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
