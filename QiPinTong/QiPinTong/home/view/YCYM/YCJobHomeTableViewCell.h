//
//  YCListTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CompanyLayout,YCJobHomeTableViewCell;
@protocol CommentEnjoyDelegate <NSObject>

- (void)onEnjoyBtnInCell:(YCJobHomeTableViewCell *)cell;

@end
@interface YCJobHomeTableViewCell : UITableViewCell
@property(nonatomic,strong)CompanyLayout *comCellLay;

@property(nonatomic,assign)id<CommentEnjoyDelegate> delegate;
@end
