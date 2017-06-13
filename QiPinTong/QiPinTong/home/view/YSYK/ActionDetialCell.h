//
//  ActionDetialCell.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/6/1.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YSYKLayout.h"
@class ActionDetialCell;
@protocol ActionDetialCellDelegate <NSObject>

-(void)enterPersonDetialViewFrom:(ActionDetialCell *)cell andIndexPath:(NSIndexPath *)indexPath;

@end


@interface ActionDetialCell : UITableViewCell

@property (nonatomic ,strong) YSYKLayout *detialAction;


@property (nonatomic ,strong) NSIndexPath *indexPath;

@property (nonatomic,copy) void(^clickedImageCall)(ActionDetialCell *cell,NSInteger imageIndex);

@property (nonatomic,assign) id<ActionDetialCellDelegate> delegate;

@end
