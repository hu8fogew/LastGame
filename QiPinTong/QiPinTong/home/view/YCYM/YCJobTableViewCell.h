//
//  YCJobTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/27.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YCJobTableViewCell : UITableViewCell

/*职位*/
@property (strong,nonatomic) UILabel *postLabel;

/**薪资*/
@property (strong,nonatomic) UILabel *salaryLabel;

/*学历*/
@property (strong,nonatomic) UIImageView *eduIcon;
@property (strong,nonatomic) UILabel *eduLabel;

/*年限*/
@property (strong,nonatomic) UIImageView *ageIcon;
@property (strong,nonatomic) UILabel *ageLabel;

/*地址*/
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLabel;

/**数量*/
@property (strong,nonatomic) UILabel *numberLabel;
@property (strong,nonatomic) UIImageView *numberIcon;


@end
