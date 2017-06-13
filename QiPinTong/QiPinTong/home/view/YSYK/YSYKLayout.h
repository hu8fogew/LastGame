//
//  YSYKLayout.h
//  QiPinTong
//
//  Created by mac on 2017/1/9.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface YSYKLayout : LWLayout<NSCopying>


//商家详情列表高度
@property(nonatomic,assign) CGFloat listViewHeight;
@property(nonatomic,assign) CGRect buyButton;
@property(nonatomic,assign) CGRect taxiFrame;
@property(nonatomic,assign) CGRect telephoneFrame;

@property (nonatomic ,assign) CGFloat businessActionCellHeight;


@property (nonatomic,assign) CGRect getMoneyFrame;
/**商家详情页面的列表*/
-(id)initListViewDetialView;



@property(nonatomic ,assign) CGFloat businessCellHeight;
/**商家列表*/
-(id)initYsykListCell;


/**商家活动*/
-(id)initBusinessAcion;


/**商家活动详情*/
-(id)initDetailAction;
@property(nonatomic ,assign) CGFloat detailActionHeight;

@property (nonatomic,copy) NSArray* photoPosition;

@property (nonatomic,assign) CGRect enterFrame;
@property(nonatomic,strong) NSArray *imageArr;
@end
