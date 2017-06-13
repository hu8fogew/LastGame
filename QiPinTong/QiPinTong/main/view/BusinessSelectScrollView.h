//
//  BusinessSelectScrollView.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/19.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectView.h"


@protocol BusinessSelectDelegate <NSObject>

@optional
/**
 轮播图点击回调代理方法
 */
-(void) onTapSelectView:(UITapGestureRecognizer *)tap;

@end

@interface BusinessSelectScrollView : UIView





/**UIPageController*/
@property (nonatomic,strong)UIPageControl *pageControl;

/**图标数组*/
@property (nonatomic,copy)NSMutableArray *selectMenuArray;

@property (nonatomic,assign)id<BusinessSelectDelegate> delegate;


-(id)initWithArray:(NSMutableArray *)menuArray;

@end
