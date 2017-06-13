//
//  CompanyLayout.h
//  QiPinTong
//
//  Created by mac on 2017/1/5.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import "LWLayout.h"

@interface CompanyLayout : LWLayout<NSCopying>

//公司描述view高度
@property(nonatomic,assign) CGFloat descCompanyHeight;
//点赞按钮
@property(nonatomic,assign) CGRect enjoyPoint;

//commentHeight
@property(nonatomic,assign) CGFloat comentCellHeight;


//公司介绍
-(id)initDescCompanyView;


//评价
-(id)initCommentCell;

@end
