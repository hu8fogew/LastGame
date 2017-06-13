//
//  YSYKListView.h
//  家长界
//
//  Created by taylor on 2016/12/5.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@class YSYKLayout,YSYKListView;


@protocol YSYKListViewDelegate <NSObject>

/**购买*/
-(void)buyAction;
/**导航*/
-(void)naviBtnAction;
/**领取优惠券*/
-(void)getBoon:(UIButton*)sender;

@end


@interface YSYKListView : UIView

@property(nonatomic,strong) YSYKLayout *listViewLayout;


@property(nonatomic,assign)id <YSYKListViewDelegate> delegate;

@end
