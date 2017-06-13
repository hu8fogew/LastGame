//
//  InstiPersonTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstiPersonTableViewCell : UITableViewCell

/**图片*/
@property (strong,nonatomic) UIImageView *imgView;

/**姓名*/
@property (strong,nonatomic) UILabel *nameLabel;
@property (strong,nonatomic) UIImageView *vIcon;

/**领域*/
@property (strong,nonatomic) UILabel *fieldLabel;

/**状况*/
@property (strong,nonatomic) UILabel *stageLabel;

/**资金*/
@property (strong,nonatomic) UILabel *fundLabel;

/***/
@property (strong,nonatomic) UILabel *titleLabel;


@end
