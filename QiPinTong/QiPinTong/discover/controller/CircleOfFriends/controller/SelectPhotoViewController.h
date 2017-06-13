//
//  SelectPhotoViewController.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/4/27.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol  SelectPhotoDelegate <NSObject>

-(void)getImage:(UIImage *)image;

@end

@interface SelectPhotoViewController : UIViewController
@property (nonatomic,assign) id <SelectPhotoDelegate> delegate;
@end
