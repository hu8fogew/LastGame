//
//  InvestCaseTableViewCell.h
//  QiPinTong
//
//  Created by taylor on 2017/1/17.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@class InvestCaseCellLayout,InvestCaseTableViewCell;

@protocol InvestCaseCellBtnClick <NSObject>

-(void)investCaseEditBtnClick:(InvestCaseTableViewCell *)cell;
-(void)investCaseDeleteBtnClick:(InvestCaseTableViewCell *)cell;

@end

@interface InvestCaseTableViewCell : UITableViewCell

@property (strong,nonatomic) InvestCaseCellLayout *investCaseLayout;

@property (assign,nonatomic)id<InvestCaseCellBtnClick>delegate;

@end
