//
//  GoodItemsTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodItemsTableViewCell : UITableViewCell

/**图片*/
@property (strong,nonatomic) UIImageView *imgView;

/**名称*/
@property (strong,nonatomic) UILabel *titleLabel;

/**数额*/
@property (strong,nonatomic) UILabel *amountLabel;

/**副标题*/
@property (strong,nonatomic) UILabel *subLabel;

/**地址*/
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLabel;

/**数量*/
@property (strong,nonatomic) UIImageView *numberIcon;
@property (strong,nonatomic) UILabel *numberLabel;

/**点赞*/
@property (strong,nonatomic) UIImageView *praiseIcon;
@property (strong,nonatomic) UILabel *praiseLabel;


@property (strong,nonatomic) UILabel *label;

@end
