//
//  YCYMDeHeadView.h
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersonalLayout;

@protocol YCYMDeHeadViewDelegate <NSObject>

-(void)enjoyButton:(UIButton *)sender;

@end

@interface YCYMDeHeadView : UIView
@property(nonatomic,strong)PersonalLayout *personLay;

@property(nonatomic,assign)id <YCYMDeHeadViewDelegate>delegate;
/**背景图片*/
@property (strong,nonatomic) UIImageView *backImageView;

@property (nonatomic,copy) void(^clickedImageCallback)(YCYMDeHeadView* descView,NSInteger imageIndex);


- (void)loadingViewAnimateWithScrollViewContentOffset:(CGFloat)offset;
- (void)refreshingAnimateBegin;
- (void)refreshingAnimateStop;
@end
