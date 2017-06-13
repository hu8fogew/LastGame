//
//  POIMapViewController.h
//  QiPinTong
//
//  Created by 企聘通 on 2017/5/10.
//  Copyright © 2017年 ShiJiJiaLian. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^GetLocation)(NSString * locationString);


@interface POIMapViewController : UIViewController


@property (nonatomic ,copy) GetLocation selectLocation;

@property (nonatomic ,strong) UISearchController *searchCtrl;

//-(void)backToFatherView;


/**
 关闭搜索状态
 */
-(void)closeSearchBar;



@end
