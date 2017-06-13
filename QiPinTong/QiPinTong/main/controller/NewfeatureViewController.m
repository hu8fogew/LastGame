//
//  NewfeatureViewController.m
//  家长界
//
//  Created by mac on 16/11/6.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import "NewfeatureViewController.h"
#define NewfeatureCount 4
@interface NewfeatureViewController ()<UIScrollViewDelegate>
@property(nonatomic,strong)UIPageControl *pageControl;
@property(nonatomic,strong)UIScrollView *scrollView;

@end

@implementation NewfeatureViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //1、创建一个scrollView：显示所有新特性的图片
    UIScrollView *scrollView = [[UIScrollView alloc]init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    
    //添加图片到ScrollView中
    CGFloat scrollWidth = scrollView.width;
    CGFloat scrollHeight = scrollView.height;
    for (int i = 0; i < NewfeatureCount; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.width = scrollWidth;
        imageView.height = scrollHeight;
        imageView.y = 0;
        imageView.x = i * scrollWidth;
        
        //显示图片
//#warning mark  未添加图片的名称
        NSString *name = [NSString stringWithFormat:@"%d",i+1];
        imageView.image = [UIImage imageNamed:name];
        
        [scrollView addSubview:imageView];
        
        //如果是最后一个imageView，就在里边添加一个跳转的按钮
        if (i == NewfeatureCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    
    //设置scrollview的其他属性
    scrollView.contentSize = CGSizeMake(NewfeatureCount *scrollWidth, 0);
    scrollView.bounces = NO;//取出弹簧效果
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.delegate = self;
    scrollView.userInteractionEnabled = YES;
    
    //设置pageControl：分页，展示第几页
    UIPageControl *pageControl = [[UIPageControl alloc]init];
    pageControl.numberOfPages = NewfeatureCount;
    pageControl.backgroundColor = [UIColor redColor];
    pageControl.currentPageIndicatorTintColor = HWColor(253, 98, 42);
    pageControl.pageIndicatorTintColor = HWColor(189, 189, 189);
    pageControl.centerX = scrollWidth * 0.5;
    pageControl.centerY = scrollHeight -50;
    [self.view addSubview:pageControl];
    self.pageControl = pageControl;
    pageControl.userInteractionEnabled = NO;
    

}



/**
 *  scrollViewDelegate
 */

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    double page = scrollView.contentOffset.x/scrollView.width;
    self.pageControl.currentPage = (int)(page + 0.5);
}

/**
 *  设置当ScrollView滚动到最后一张的时候添加按钮的设置
 */

-(void)setupLastImageView:(UIImageView *)imageView
{
    //开启imageView的用户交互功能
    imageView.userInteractionEnabled = YES;
    
    // 1.分享给大家（checkbox）
    UIButton *shareBtn = [[UIButton alloc] init];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareBtn setImage:[UIImage imageNamed:@"new_feature_share_true"] forState:UIControlStateSelected];
    [shareBtn setTitle:@"分享给大家" forState:UIControlStateNormal];
    [shareBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    shareBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    shareBtn.width = 200;
    shareBtn.height = 30;
    shareBtn.centerX = imageView.width * 0.5;
    shareBtn.centerY = imageView.height * 0.65;
    [shareBtn addTarget:self action:@selector(shareClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:shareBtn];
    
    
    
    //开始微博
    UIButton *startBtn = [[UIButton alloc]init];
    [startBtn setBackgroundImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    
    [startBtn setImage:[UIImage imageNamed:@""] forState:UIControlStateHighlighted];
    
    startBtn.size = startBtn.currentBackgroundImage.size;
    
    startBtn.centerX = shareBtn.centerX;
    startBtn.centerY = imageView.height * 0.75;
    [startBtn setTitle:@"开始体验" forState:UIControlStateNormal];
    [startBtn addTarget:self action:@selector(startClick) forControlEvents:UIControlEventTouchUpInside];
    
    [imageView addSubview:startBtn];
    
}

-(void)shareClick:(UIButton *)shareBtn
{
    //状态取反
    shareBtn.selected = !shareBtn.isSelected;
    KEYWINDOW.rootViewController = [[MainTabBarController alloc]init];
}

-(void)startClick
{
    //切换控制器
    KEYWINDOW.rootViewController = [[MainTabBarController alloc]init];
    
}
/*
-(void)dealloc
{
    
    HWLog(@"NewFeatureViewController已经dealloc");
}
*/
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
