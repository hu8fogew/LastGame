//
//  GoodDetialHeadView.h
//  家长界
//
//  Created by taylor on 2016/12/13.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodDetialHeadView : UIView

/**背景图片*/
@property (strong,nonatomic) UIImageView *backImageView;

/*人物图像*/
@property (strong,nonatomic) UIImageView *imgView;

/**姓名*/
@property (strong,nonatomic) UILabel *nameLabel;

/*标题*/
@property (strong,nonatomic) UILabel *titleLabel;

/**状态*/
@property (strong,nonatomic) UILabel *typeLabel;

/**地址*/
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLabel;

/**融资*/
@property (strong,nonatomic) UILabel *financingLabel;

/*金额*/
@property (strong,nonatomic) UILabel *financeNoLabel;


@end
