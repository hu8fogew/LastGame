//
//  VtTCLYTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VtTCLYCellLayout,VtTCLYTableViewCell;

@protocol VtTCLYCellBtnClickDelegate <NSObject>

-(void)clickVtCLYCEditBtn:(VtTCLYTableViewCell *)cell;
-(void)clickVtCLYCDeleteBtn:(VtTCLYTableViewCell *)cell;


@end

@interface VtTCLYTableViewCell : UITableViewCell

@property (strong,nonatomic) VtTCLYCellLayout *vtShowLayout;

@property (assign,nonatomic) id<VtTCLYCellBtnClickDelegate> delegate;

@end
