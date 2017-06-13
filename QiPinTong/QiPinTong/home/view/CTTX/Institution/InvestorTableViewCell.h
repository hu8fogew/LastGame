//
//  InvestorTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvestorTableViewCell : UITableViewCell

/**名称*/
@property (strong,nonatomic) UILabel *nameLabel;

/*图片*/
@property (strong,nonatomic) UIImageView *imgView;

/*标题*/
@property (strong,nonatomic) UILabel *titleLabel;

@property (strong,nonatomic) UIImageView *vIcon;

/*行业领域*/
@property (strong,nonatomic) UILabel *fieldLabel;

/**人数*/
@property (strong,nonatomic) UILabel *numberLabel;

/*右边箭头*/
@property (strong,nonatomic) UIButton *arrowIcon;


@end
