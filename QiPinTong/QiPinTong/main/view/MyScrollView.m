//
//  CampusScrollView.m
//  家长界
//
//  Created by taylor on 2016/12/12.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "MyScrollView.h"

@implementation MyScrollView
-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = whiteC;
        
        [self createUIScrollView];
        [self createUIPageControl];
        
}
    return self;
}

#pragma mark 定义滚动视图

-(void)createUIScrollView{
    //定义滚动视图
    self.myScroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 10, SCREEN_WIDTH, SCREEN_WIDTH*0.45)];
    self.myScroll.backgroundColor = whiteC;
    self.myScroll.showsHorizontalScrollIndicator = NO;
    self.myScroll.tag = 10;
    self.myScroll.delegate = self;
    [self addSubview:self.myScroll];
    
    NSArray *imgViews = @[@"scroll3.jpg",@"scroll1.jpg",@"scroll2.jpg",@"scroll3.jpg"];
    NSArray *titles = @[@"我的招聘会",@"大型人才交流会",@"西安人才交流会",@"新年招聘会"];
    for (int i=0; i<imgViews.count; i++) {
        self.imgView = [[UIImageView alloc]init];
        self.imgView.frame = CGRectMake(10*(i+1)+i*(SCREEN_WIDTH-10), 0, SCREEN_WIDTH-20, SCREEN_WIDTH*0.35);
        
        self.imgView.image = [UIImage imageNamed:imgViews[i]];
        [self.myScroll addSubview:self.imgView];
        
        
        UILabel *tLab = [UILabel new];
        tLab.text = titles[i];
        tLab.textColor = whiteC;
        tLab.font = [UIFont systemFontOfSize:mainTitleSize];
        [self.imgView addSubview:tLab];
        [tLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imgView).with.offset(5);
            make.bottom.equalTo(self.imgView).with.offset(-5);
        }];
    }
    
    //设置属性
    //显示内容的大小
    self.myScroll.contentSize = CGSizeMake(4*SCREEN_WIDTH, 0);
    //显示内容的偏移量
    self.myScroll.contentOffset = CGPointMake(0, 0);
    //按页进行滑动
    self.myScroll.pagingEnabled = YES;
    
}

#pragma mark /------定义翻页控件------/
-(void)createUIPageControl{
    self.pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(0, SCREEN_WIDTH*0.4, SCREEN_WIDTH, 20)];
    [self addSubview:self.pageControl];
    self.pageControl.numberOfPages = 4;
    self.pageControl.currentPage = 0;
    self.pageControl.pageIndicatorTintColor = grayC;
    self.pageControl.currentPageIndicatorTintColor = SecondTitleColor;
    [self.pageControl addTarget:self action:@selector(onChange:) forControlEvents:UIControlEventValueChanged];
    self.pageControl.tag = 11;
    
}

//翻页控件出发方法
-(void)onChange:(UIPageControl *)page{
    HWLog(@"翻页控件响应");
    
    UIScrollView *myScroll = (id)[self viewWithTag:10];
    
    //设置偏移量   根据翻页控件的当前页 计算获取偏移量
    myScroll.contentOffset = CGPointMake(page.currentPage*SCREEN_WIDTH, 0);
}

//滚动视图已经完成滚动
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSLog(@"滚动视图完成滚动");
    
    UIPageControl *page = (id)[self viewWithTag:11];
    
    if (scrollView == self.myScroll) {
        //设置翻页控件的当前页  通过偏移量进行计算
        page.currentPage = scrollView.contentOffset.x/SCREEN_WIDTH;
    }else{
        
    }
    
}


@end
