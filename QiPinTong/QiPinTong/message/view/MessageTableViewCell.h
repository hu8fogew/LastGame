//
//  MessageTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/8.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MessageLayout;
@interface MessageTableViewCell : UITableViewCell

@property(nonatomic,strong)MessageLayout *messageLayout;
/*图片*/
@property (strong,nonatomic) UIImageView *imgView;

/*姓名*/
@property (strong,nonatomic) UILabel *nameLabel;

/*信息*/
@property (strong,nonatomic) UILabel *titleLabel;

/*时间*/
@property (strong,nonatomic) UILabel *timeLabel;


@end
