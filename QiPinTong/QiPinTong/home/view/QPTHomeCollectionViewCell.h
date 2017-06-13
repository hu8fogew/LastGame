//
//  QPTHomeCollectionViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/23.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Memlist.h"

#import "Comlist.h"


@class Memlist,Comlist;

@interface QPTHomeCollectionViewCell : UICollectionViewCell

/****首页名企在线，有才有貌及创投共用***/




/*图片*/
@property (strong,nonatomic) UIImageView *imgView;
/*名称*/
@property (strong,nonatomic) UILabel *titleLabel;
/*vIcon*/
@property (strong,nonatomic) UIImageView *vIcon;

/*数量*/
@property (strong,nonatomic) UILabel *NoLabel;
/*eyeIcon*/
@property (strong,nonatomic) UIImageView *eIcon;

/*地址*/
@property (strong,nonatomic) UIImageView *addressIcon;
@property (strong,nonatomic) UILabel *addressLabel;

/*年限*/
@property (strong,nonatomic) UIImageView *ageIcon;
@property (strong,nonatomic) UILabel *ageLabel;

/*学历*/
@property (strong,nonatomic) UIImageView *educationIcon;
@property (strong,nonatomic) UILabel *educationLabel;

/*信息*/
@property (strong,nonatomic) UILabel *contentLabel;
@property (strong,nonatomic) UILabel *contsLabel;

/**价格*/
@property (strong,nonatomic) UILabel *priceLabel;



////////有才有貌不同
/**数字*/
@property (strong,nonatomic) UILabel *numberLabel;
@property (strong,nonatomic) UIImageView *numberIcon;
/**职位*/
@property (strong,nonatomic) UILabel *postLabel;



////////创投不同
@property (strong,nonatomic) UILabel *subTitle;
/*位置*/
@property (strong,nonatomic) UIImageView *locaIcon;
@property (strong,nonatomic) UILabel *locaLabel;
/*数量*/
@property (strong,nonatomic) UIImageView *eyeIcon;
@property (strong,nonatomic) UILabel *numLabel;
/*点赞*/
@property (strong,nonatomic) UIImageView *praiseIcon;
@property (strong,nonatomic) UILabel *praiseLabel;




@property(nonatomic,strong) NSIndexPath *indexPath;
//个人&&企业


@property (nonatomic,strong) Memlist *memberModel;
@property (nonatomic,strong) Comlist *comModel;
@property (nonatomic ,strong) NSMutableArray *jobArr;
@property (nonatomic,strong) NSMutableArray *cmJobArr;

@end
