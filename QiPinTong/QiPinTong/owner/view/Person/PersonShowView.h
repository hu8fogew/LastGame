//
//  MemberShowView.h
//  QiPinTong
//
//  Created by taylor on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, ChildrenKindModel) {
    ChildrenKindModelCompany = 0,
    ChildrenKindModelPersonal = 1
};

@class PersonShowView;

//点击那个视图的代理
@protocol PersonShowViewDelegate <NSObject>

-(void)didSelectButton:(NSInteger)index;

@end


@interface PersonShowView : UIView

@property(nonatomic,assign) ChildrenKindModel *kindModel;
@property(nonatomic,assign)id <PersonShowViewDelegate> delegate;
@property(nonatomic,strong)NSArray *titleArr;

-(instancetype)initWithFrame:(CGRect)frame;

@end
