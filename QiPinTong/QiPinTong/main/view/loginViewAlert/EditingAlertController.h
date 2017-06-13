//
//  EditingAlertController.h
//  测试001
//
//  Created by mac on 2017/1/14.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>


@class EditingLoginView;
@protocol EditingAlertControllerDelegate <NSObject>

-(void)ownerLogin;
-(void)ownerSign;
-(void)ownerFindSecretNum;

@end

@interface EditingAlertController : UIViewController

@property(nonatomic,assign)id <EditingAlertControllerDelegate> delegate;

@property (nonatomic, assign) BOOL isEdit;


@end
