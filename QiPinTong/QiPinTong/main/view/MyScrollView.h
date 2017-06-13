//
//  CampusScrollView.h
//  家长界
//
//  Created by taylor on 2016/12/12.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ESRootClass.h"


@class Midbanners;



@interface MyScrollView : UIView<UIScrollViewDelegate>

@property (strong,nonatomic) UIScrollView *myScroll;

@property (strong,nonatomic) UIPageControl *pageControl;

@property (strong,nonatomic) UIImageView *imgView;




@property (nonatomic,strong) Midbanners *midBanner;



@end
