//
//  ComOnlineCollectionViewCell.h
//  家长界
//
//  Created by taylor on 2016/12/6.
//  Copyright © 2016年 西部家联. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comlist.h"
@interface ComOnlineCollectionViewCell : UICollectionViewCell

/*图片*/
@property (strong,nonatomic) UIImageView *imgView;

/*名称*/
@property (strong,nonatomic) UILabel *titleLabel;

/*vIcon*/
@property (strong,nonatomic) UIImageView *vIcon;

/*eyeIcon*/
@property (strong,nonatomic) UIImageView *eIcon;

/*数量*/
@property (strong,nonatomic) UILabel *NoLabel;

/*行业*/
@property (strong,nonatomic) UILabel *proLabel;

/*状态*/
@property (strong,nonatomic) UILabel *typeLabel;

/*定位icon*/
@property (strong,nonatomic) UIImageView *locaIcon;

/*地址*/
@property (strong,nonatomic) UILabel *addressLabel;

/*内容*/
@property (strong,nonatomic) UILabel *contentLabel;
@property (strong,nonatomic) UILabel *contsLabel;

@property (nonatomic,strong) Comlist *comModel;

@property (nonatomic,strong) NSMutableArray *jobArr;

@property (nonatomic,strong) NSIndexPath *indexPath;


@end
