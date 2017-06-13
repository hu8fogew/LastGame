//
//  VentureProjectTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class VtProjectCellLayout,VtProjectTableViewCell;

@protocol VentureBtnClickDelegate <NSObject>

-(void)clickVtEditBtn:(VtProjectTableViewCell *)cell;
-(void)clickVtDeleteBtn:(VtProjectTableViewCell *)cell;

@end

@interface VtProjectTableViewCell : UITableViewCell

@property (strong,nonatomic) VtProjectCellLayout *vtProjectLayout;

@property (assign,nonatomic) id<VentureBtnClickDelegate>delegate;

@end
