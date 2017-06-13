//
//  InvestorBackTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InvestorBackCellLayout,InvestorBackTableViewCell;

@protocol InvestorCellBtnClickDelegate <NSObject>

-(void)investorCellEditBtnClick:(InvestorBackTableViewCell *)cell;
-(void)investorCellDeleteBtnClick:(InvestorBackTableViewCell *)cell;


@end

@interface InvestorBackTableViewCell : UITableViewCell

@property (strong,nonatomic) InvestorBackCellLayout *investorBackLayout;


@property (assign,nonatomic) id<InvestorCellBtnClickDelegate>delegate;


@end
