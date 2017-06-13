//
//  YCJobFirstTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class JobDetialLayout;

@protocol YCJobCellDelegate <NSObject>

-(void)addFriend;

@end




@interface YCJobFirstTableViewCell : UITableViewCell

@property (strong,nonatomic) JobDetialLayout *jobLayout;

@property(nonatomic,assign) id <YCJobCellDelegate> delegate;


@end
