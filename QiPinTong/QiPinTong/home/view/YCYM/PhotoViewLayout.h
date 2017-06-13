//
//  PhotoViewLayout.h
//  家长界
//
//  Created by mac on 2016/12/31.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import "LWLayout.h"
#define IMAGE_IDENTIFIER @"photo"
@interface PhotoViewLayout : LWLayout<NSCopying>

@property(nonatomic,assign) CGFloat photoCellHeight;
@property (nonatomic,copy) NSArray* photoPosition;
@property(nonatomic,strong) NSArray *imageArr;
-(id)initPhotoCellLayout;
@end
