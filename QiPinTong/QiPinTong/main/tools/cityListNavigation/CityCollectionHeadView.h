//
//  CityCollectionHeadView.h
//  PCN
//
//  Created by 蒙奇D路飞 on 16/8/11.
//  Copyright © 2016年 com.smh.pcn. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol CollectionViewDelegate <NSObject>

@optional

-(void)deleteChangeArr;

@end


@interface CityCollectionHeadView : UICollectionReusableView
@property (nonatomic,strong) UILabel *sectionTitleLabel;

@property (nonatomic,assign) BOOL ishiddenDeleteImg;
@property(nonatomic,assign)id <CollectionViewDelegate> delegate;
@end
