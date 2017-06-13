//
//  InstituHeadView.h
//  家长界
//
//  Created by taylor on 2016/12/14.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InstituHeadView : UIView

/**背景图片*/
@property (strong,nonatomic) UIImageView *backImageView;

/*人物图像*/
@property (strong,nonatomic) UIImageView *imgView;

/*标题*/
@property (strong,nonatomic) UILabel *titleLabel;

/**状态*/
@property (strong,nonatomic) UILabel *subLabel;

/**地址*/
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLabel;


@end
