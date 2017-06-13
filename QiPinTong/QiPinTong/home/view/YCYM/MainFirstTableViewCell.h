//
//  MainFirstTableViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/19.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
@class PersonalLayout,MainFirstTableViewCell;

@protocol ChectNumberDelegate <NSObject>

/**
 点击查看电话
 1、传入cell
 2、传入点击按钮，以便于修改button内容和字体颜色
 */
- (void)onChectOutInCell:(MainFirstTableViewCell *)cell andBtn:(UIButton *)sender;

@end

@interface MainFirstTableViewCell : UITableViewCell




@property(nonatomic,strong)PersonalLayout *perDescLayout;
@property(nonatomic,assign)id<ChectNumberDelegate> delegate;
@end
