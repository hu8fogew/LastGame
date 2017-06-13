//
//  DetailCommentCell.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/28.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellLayout.h"


@class DetailCommentCell,CommentModel;

@protocol DetailCommentCellDelegate <NSObject>

@required


@optional
- (void)onAvatarInCell:(DetailCommentCell *)cell;
- (void)onMoreInCell:(DetailCommentCell *)cell;
- (void)onDeleteInCell:(DetailCommentCell *)cell;
- (void)onAwardIncell:(DetailCommentCell *)cell;

@end



@interface DetailCommentCell : UITableViewCell

@property (nonatomic,strong) CellLayout* cellLayout;
@property (nonatomic,strong) NSIndexPath* indexPath;
@property (nonatomic,assign) id <DetailCommentCellDelegate> delegate;

/**
 点击图片
 */
@property (nonatomic,copy) void(^clickedImageCallback)(DetailCommentCell* cell,NSInteger imageIndex);

/**
 点赞
 */
@property (nonatomic,copy) void(^clickedLikeButtonCallback)(DetailCommentCell* cell,BOOL isLike);

/**
点击头像
 */

@property (nonatomic,copy) void(^clickedAvatarCallback)(DetailCommentCell* cell);

/**
 点击评论
 */
@property (nonatomic,copy) void(^clickedReCommentCallback)(DetailCommentCell* cell,CommentModel* model);

/**
 点击评论
 */
@property (nonatomic,copy) void(^clickedCommentButtonCallback)(DetailCommentCell* cell);


@property (nonatomic,copy) void(^clickedOpenCellCallback)(DetailCommentCell* cell);

/**
 查看打赏记录
 */
@property (nonatomic,copy) void(^clickedCheckOutAwardCellCallback)(DetailCommentCell* cell);

@end
