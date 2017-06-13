//
//  SendMessageCell.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/22.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SendMessageCell;

@protocol SendMessageDelegate <NSObject>

-(void)sendMessageWith:(SendMessageCell *)cell;

@end


@interface SendMessageCell : UITableViewCell



@property (nonatomic ,copy) NSString *buttonStyleString;//按钮类型


@property (nonatomic ,assign) id <SendMessageDelegate> delegate;

@end
