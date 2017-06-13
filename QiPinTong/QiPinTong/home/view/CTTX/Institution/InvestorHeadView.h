//
//  InvestorHeadView.h
//  家长界
//
//  Created by taylor on 2016/12/15.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InvestorHeadView : UIView

/**背景图片*/
@property (strong,nonatomic) UIImageView *backImageView;

/*人物图像*/
@property (strong,nonatomic) UIImageView *imgView;

/*名字*/
@property (strong,nonatomic) UILabel *nameLabel;

/***/
@property (strong,nonatomic) UILabel *fundLabel;
@property (strong,nonatomic) UILabel *jobLabel;

/**地址*/
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLabel;


@end