//
//  DataBase.h
//  家长界
//
//  Created by mac on 16/11/4.
//  Copyright © 2016年 haha😄. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataBase : NSObject
@property(nonatomic,copy)NSString *slecteImg;
@property(nonatomic,copy)NSString *labTiltle;
@property(nonatomic,copy)NSString *lunboImg;

+(NSMutableArray *)addArray;
/*首页选择按钮的数组*/
+(NSMutableArray *)addSelecteArray;

/*企聘通的首页选择按钮*/
+(NSMutableArray *)addQptSeleBarArray;

/*校园365的选择按钮*/
+(NSMutableArray *)addCampusSelectBarArray;

/*有商有客*/
+(NSMutableArray *)addYSYKSelectBarArr;

/**创投天下*/
+(NSMutableArray *)addCTTXSelectBarArr;


//广告
+(NSMutableArray *)addAdverArray;

@end
