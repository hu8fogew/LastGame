//
//  BusinessSelectScrollView.m
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/19.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "BusinessSelectScrollView.h"

@interface BusinessSelectScrollView ()<UIScrollViewDelegate>

@property(nonatomic ,strong) UIView *viewF;

@property(nonatomic ,strong) UIView *viewS;

@end
@implementation BusinessSelectScrollView

//初始化方法
-(id)initWithArray:(NSMutableArray *)menuArray
{
    self = [super init];
    if (self) {
        self.backgroundColor = whiteC;
        
        self.frame = CGRectMake(0, 0, SCREEN_WIDTH, businessSelectViewHeight);
        
        [self setSelectViewWithArray:menuArray];
    }
    return self;
}


//设置视图
-(void) setSelectViewWithArray:(NSMutableArray *)array
{
    //轮播第一页
    UIView *firstVc = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 160)];
    self.viewF = firstVc;
    //轮播第二页
    UIView *secondVc = [[UIView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH, 0, SCREEN_WIDTH, 160)];
    self.viewS = secondVc;
    //scrollView
    UIScrollView *scrollVc = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 180)];
    scrollVc.contentSize = CGSizeMake(2*SCREEN_WIDTH, 180);
    
    scrollVc.pagingEnabled = YES;
    scrollVc.delegate = self;
    
    scrollVc.showsHorizontalScrollIndicator = NO;
    [scrollVc addSubview:firstVc];
    [scrollVc addSubview:secondVc];
    
    [self addSubview:scrollVc];
    
    //创建8个
    
    int i = 0;
    for (NSDictionary *dic in array) {
        if (i<5) {
            
            SelectView *selectVc = [self creatSelectViewWith:dic andTag:i];
            
            selectVc.frame = CGRectMake(i*SCREEN_WIDTH/5, 0, SCREEN_WIDTH/5, businessSelectButtonHeight);
            
            [firstVc addSubview:selectVc];
            
            // 点击手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneView:)];
            [selectVc addGestureRecognizer:tap];
            
            
        }else if (i<10){
            
            SelectView *selectVc = [self creatSelectViewWith:dic andTag:i];
            
            selectVc.frame = CGRectMake((i-5)*SCREEN_WIDTH/5, businessSelectButtonHeight, SCREEN_WIDTH/5, businessSelectButtonHeight);
            
            [firstVc addSubview:selectVc];
            
            // 点击手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneView:)];
            [selectVc addGestureRecognizer:tap];
        } else if (i<15){
            
            SelectView *selectVc = [self creatSelectViewWith:dic andTag:i];
            
            selectVc.frame = CGRectMake((i-10)*SCREEN_WIDTH/5, 0, SCREEN_WIDTH/5, businessSelectButtonHeight);
            
            [secondVc addSubview:selectVc];
            
            // 点击手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneView:)];
            [selectVc addGestureRecognizer:tap];
            
        }else{
            
            SelectView *selectVc = [self creatSelectViewWith:dic andTag:i];
            
            selectVc.frame = CGRectMake((i-15)*SCREEN_WIDTH/5, businessSelectButtonHeight, SCREEN_WIDTH/5, businessSelectButtonHeight);
            
            [secondVc addSubview:selectVc];
            
            // 点击手势
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOneView:)];
            [selectVc addGestureRecognizer:tap];
            
            
        }
        
        i++;
    }
    
    self.pageControl = [[UIPageControl alloc]init];
    
    self.pageControl.currentPage = 0;
    
    self.pageControl.numberOfPages = 2;
    
    [self addSubview:self.pageControl];
    
    [self.pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.viewF).with.offset(40);
        make.height.mas_equalTo(20);
        
    }];
    
    
    [self.pageControl setCurrentPageIndicatorTintColor:redC];
    
    [self.pageControl setPageIndicatorTintColor:grayC];
    
    
}


-(SelectView *)creatSelectViewWith:(NSDictionary *)dic andTag:(NSInteger)tag
{
    SelectView *vi = [[SelectView alloc]initWithFrame:CGRectZero title:dic[@"labTitle"] imageStr:dic[@"slecteImg"]];
    vi.tag = tag;
    return vi;
}

#pragma mark -手势点击事件

-(void)tapOneView:(UITapGestureRecognizer *)sender{
    
    
    if (_delegate && [_delegate respondsToSelector:@selector(onTapSelectView:)]) {
        
        [_delegate onTapSelectView:sender];
    }
    
}

#pragma mark ----scrollerViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat scrollViewW = scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollViewW/2)/scrollViewW;
    self.pageControl.currentPage = page;
}


@end
