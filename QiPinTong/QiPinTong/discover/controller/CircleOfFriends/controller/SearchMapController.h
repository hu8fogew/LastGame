//
//  SearchMapController.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/23.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SearchResultViewDelegate <NSObject>

@optional

-(void)didSelectRowIndexPath:(NSIndexPath *)indexPath andAreaText:(NSString *)area;


-(void)closeSearchState;

@end

@interface SearchMapController : UITableViewController

@property (nonatomic ,strong) NSMutableArray *mapArray;

@property (nonatomic ,copy) NSString *keyWords;//关键字

@property (nonatomic ,copy) NSString *currentCity;

@property (nonatomic ,assign) id <SearchResultViewDelegate> delegate;


-(void)loadSearchMapDataWith:(NSString *)keyWord andCity:(NSString *)city;

@end
