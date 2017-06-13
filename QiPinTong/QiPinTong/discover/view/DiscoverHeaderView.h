//
//  DiscoverHeaderView.h
//  QiPinTong
//
//  Created by mac on 2017/3/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersonalLayout;

@protocol DiscoverHeaderViewDelegate <NSObject>
@optional
-(void)changeBackViewImage;

-(void)clickHeaderImageAction;


@end

@interface DiscoverHeaderView : UIView

@property(nonatomic,assign)id <DiscoverHeaderViewDelegate>delegate;
/**背景图片*/
@property (nonatomic,strong) UIImageView *bgImageVc;

@property (nonatomic,copy) void(^clickedImageCallback)(DiscoverHeaderView* descView,NSInteger imageIndex);


- (void)loadingViewAnimateWithScrollViewContentOffset:(CGFloat)offset;
- (void)refreshingAnimateBegin;
- (void)refreshingAnimateStop;
@end
