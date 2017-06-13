//
//  EditingController.h
//  QiPinTong
//
//  Created by mac on 2017/2/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^GetWriteText)(NSString *WriteText);


@class EditingController;


@protocol EditingControllerBackStringDelegate <NSObject>

-(void)backStringToComeViewWith:(EditingController *)editVc andTag:(NSInteger)index;

@end

@interface EditingController : UIViewController

@property(nonatomic,copy)NSString *kindTitle;
@property(nonatomic,copy)NSString *editText;
@property(nonatomic,assign)NSInteger selectIndex;
@property(nonatomic,assign) id <EditingControllerBackStringDelegate> delegate;

@property (nonatomic ,copy) GetWriteText writeText;

@end
